require 'json'
require 'net/http'

require_relative 'vars'
require_relative 'util'
require_relative 'helpers'

tested_versions = if ARGV[0]
                    @supported_versions.select { |version, _, _, _| version.start_with?(ARGV[0]) }
                  else
                    @supported_versions
                  end

$logger.info 'Grubruby test-suite'
$logger.info '-' * 80
$logger.info "Building and testing images for the following Ruby-versions: #{tested_versions.map(&:first).join(', ')}"
$logger.info

test_time = Time.now.utc.to_i

base_image_tag = "#{@grubruby.repo_name}.beta:#{test_time}-base"
base_command = [].tap do |it|
  it << "--tag #{base_image_tag}"
  it << '--platform=linux/amd64'
  it << '--no-cache' if skip_cache?
  it << '--file base/Dockerfile'
  it << '.'
end
run_command(base_command.join(' '))

base_image_tag_30 = "#{@grubruby.repo_name}.beta:#{test_time}-base30"
base_command = [].tap do |it|
  it << 'docker build'
  it << "--tag #{base_image_tag_30}"
  it << '--platform=linux/amd64'
  it << '--no-cache' if skip_cache?
  it << '--file base/Dockerfile-bullseye'
  it << '.'
end
run_command(base_command.join(' '))

buildjemalloc_tag = "#{@grubruby.repo_name}.beta:#{test_time}-buildjemalloc"
buildjemalloc_command = [].tap do |it|
  it << 'docker build --compress'
  it << "--tag #{buildjemalloc_tag}"
  it << '--platform=linux/amd64'
  it << '--no-cache' if skip_cache?
  it << '--file buildjemalloc/Dockerfile'
  it << "--build-arg BASE_IMAGE=#{base_image_tag}"
  it << '.'
end
run_command(buildjemalloc_command.join(' '))

buildjemalloc_tag_30 = "#{@grubruby.repo_name}.beta:#{test_time}-buildjemalloc30"
buildjemalloc_command = [].tap do |it|
  it << 'docker build'
  it << "--tag #{buildjemalloc_tag_30}"
  it << '--platform=linux/amd64'
  it << '--no-cache' if skip_cache?
  it << '--file buildjemalloc/Dockerfile'
  it << "--build-arg BASE_IMAGE=#{base_image_tag_30}"
  it << '.'
end
run_command(buildjemalloc_command.join(' '))

tested_versions.map do |ruby_version, sha256hash, rails_version|
  base_ruby_image_tag = "#{@grubruby.repo_name}.beta:#{test_time}-#{ruby_version}"

  $logger.info "[#{ruby_version}] Building base image for Ruby #{ruby_version} with name: #{base_ruby_image_tag}"

  if ruby_version.start_with?('3.0')
    build_ruby_image(base_ruby_image_tag, @grubruby, base_image_tag_30, buildjemalloc_tag_30, ruby_version, sha256hash)
  else
    build_ruby_image(base_ruby_image_tag, @grubruby, base_image_tag, buildjemalloc_tag, ruby_version, sha256hash)
  end

  $logger.info "[#{ruby_version}] .. size is #{bytes_to_megabytes(docker_image_size_in_bytes(base_ruby_image_tag))} MB"

  # Build Rails image
  # -----------------------------------------------------------------
  test_image_tag = "#{@grubruby.repo_name}.beta:#{test_time}-#{ruby_version}-webtest"

  $logger.info "[#{ruby_version}] Building Rails image on top of base image:"
  $logger.info "[#{ruby_version}] .. base-image: #{base_ruby_image_tag}"
  $logger.info "[#{ruby_version}] .. test-image: #{test_image_tag}"

  build_command = [].tap do |it|
    it << 'docker build --compress'
    it << "--tag #{test_image_tag}"
    it << '--platform=linux/amd64'
    it << '--no-cache' if skip_cache?
    it << "--file spec/Dockerfile"
    it << "--build-arg IMAGE=#{base_ruby_image_tag}"
    it << '--build-arg LD_PRELOAD=/usr/local/lib/libjemalloc3.so'
    it << "spec/#{rails_version}"
  end
  run_command(build_command.join(' '))

  # Boot Rails image
  # -----------------------------------------------------------------
  outside_port = ENV.fetch('WEB_PORT', 3888)
  $logger.info "[#{ruby_version}] Booting Rails container #{test_image_tag} on port #{outside_port}"

  setup_command = [].tap do |it|
    it << 'docker run'
    it << "--name grubruby_test-#{Process.pid}"
    it << '-d=true' # detach, run in background
    it << '--rm'
    it << '-i'
    it << "-p #{outside_port}:3000"
    it << "-t #{test_image_tag}"
  end
  _, container_name, = run_command(setup_command.join(' '))

  # Verify that the Rails container is running
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Verifying that the container is running"
  running = false
  deadline = Time.now.utc + 60
  until running
    running = docker_container_running?(container_name)

    if Time.now.utc > deadline
      raise "[#{ruby_version}] Couldn't start container #{container_name} running image #{test_image_tag} for Ruby #{ruby_version}"
    end

    print '.'
    sleep(1)
  end
  print "\n"

  # Verify that the Rails container is responding on specified port
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Verifying that the container responds with 200 on http://localhost:#{outside_port}/"
  webserver_running = false
  deadline = Time.now.utc + 60
  tries = 0
  until webserver_running
    tries += 1

    webserver_running = healthy_server?(outside_port)

    if Time.now.utc > deadline
      raise "[#{ruby_version}] Couldn't connect to #{container_name} running image #{test_image_tag} for Ruby #{ruby_version} after #{tries} tries"
    end

    sleep(1)
  end
  $logger.info "[#{ruby_version}] Container responded succesfully after #{tries} tries."

  # Shutdown Rails container
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Shutting down container"
  kill_command = [].tap do |it|
    it << 'docker kill'
    it << container_name
  end

  run_command(kill_command.join(' '))

  # Verify that the Rails container is shutdown
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Verifying that the container is shutdown"
  shutdown = false
  deadline = Time.now.utc + 60
  until shutdown
    shutdown = !docker_container_running?(container_name)

    if Time.now.utc > deadline
      raise "[#{ruby_version}] Couldn't stop container #{container_name} running image #{test_image_tag} for Ruby #{ruby_version}"
    end

    sleep(1)
  end

  # Delete Rails image
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Cleaning up, deleting Rails-image: #{test_image_tag}"
  delete_command = [].tap do |it|
    it << 'docker image rm'
    it << '--force'
    it << test_image_tag
  end
  run_command(delete_command.join(' '))

  # Delete Ruby Base image
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Cleaning up, deleting ruby-base-image: #{base_ruby_image_tag}"
  delete_command = [].tap do |it|
    it << 'docker image rm'
    it << '--force'
    it << base_ruby_image_tag
  end
  run_command(delete_command.join(' '))

  $logger.info ''
  $logger.info '-' * 80
  $logger.info ''
end
