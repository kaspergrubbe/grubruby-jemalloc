require "json"
require "net/http"

require_relative "vars.rb"
require_relative "util.rb"

def docker_container_running?(container_name)
  check_command = [].tap { |it|
    it << "docker inspect"
    it << container_name
  }.join(" ")
  status, stdout, _ = run_command(check_command, allowed_exit_codes: [0,1])

  running = case status
  when 0
    container_data = JSON.parse(stdout).first
    container_data["State"]["Running"]
  else
    false
  end

  running
end

def healthy_server?(port)
  uri = URI("http://localhost:#{port}")
  http = Net::HTTP.new(uri.host, uri.port)
  req =  Net::HTTP::Get.new(uri)
  req.add_field "Accept-Encoding", "gzip, deflate"

  res = http.request(req)

  return case res.code.to_i
  when 200..299
    true
  else
    false
  end
rescue
  false
end

$logger.info "Grubruby test-suite"
$logger.info "-" * 80
$logger.info "Building and testing images for the following Ruby-versions: #{@supported_versions.map(&:first).join(", ")}"
$logger.info

test_time = Time.now.utc.to_i
@supported_versions.map { |ruby_version, sha256hash, needs_thpoff, rails_version|
  base_image_tag = "#{@grubruby_reponame}.beta:#{test_time}-#{ruby_version}"

  $logger.info "[#{ruby_version}] Building base image for Ruby #{ruby_version} with name: #{base_image_tag}"
  build_command = [].tap { |it|
    ruby_version_major = ruby_version[0..2]
    dockerfile = "ruby-#{ruby_version_major}/Dockerfile"

    it << "docker build --compress"
    it << "--tag #{base_image_tag}"
    it << "--no-cache" if skip_cache?
    it << "--file #{dockerfile}"
    it << "--build-arg RUBY_MAJOR=#{ruby_version_major}"
    it << "--build-arg RUBY_VERSION=#{ruby_version}"
    it << "--build-arg RUBY_DOWNLOAD_SHA256=#{sha256hash}"
    it << "--build-arg RUBYGEMS_VERSION=#{@rubygems_version}"
    it << "--build-arg BUNDLER_VERSION=#{@bundler_version}"
    it << "."
  }.join(" ")
  run_command(build_command)
  $logger.info "[#{ruby_version}] .. size is #{bytes_to_megabytes(docker_image_size_in_bytes(base_image_tag))} MB"

  [ruby_version, needs_thpoff, rails_version, base_image_tag]
}.map { |ruby_version, needs_thpoff, rails_version, base_image_tag|
  test_image_tag = "#{@grubruby_reponame}.beta:#{test_time}-#{ruby_version}-webtest"

  dockerfile = if needs_thpoff
    "spec/Dockerfile-with-thpoff"
  else
    "spec/Dockerfile-without-thpoff"
  end

  $logger.info "[#{ruby_version}] Building Rails image on top of base image with name: #{test_image_tag}"
  build_command = [].tap { |it|
    it << "docker build --compress"
    it << "--tag #{test_image_tag}"
    it << "--no-cache" if skip_cache?
    it << "--file #{dockerfile}"
    it << "--build-arg IMAGE=#{base_image_tag}"
    it << "spec/#{rails_version}"
  }.join(" ")

  run_command(build_command)

  [ruby_version, base_image_tag, test_image_tag]
}.map { |ruby_version, base_image_tag, test_image_tag|
  outside_port = 3888

  # Boot image
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Booting Rails container on port #{outside_port}"
  setup_command = [].tap { |it|
    it << "docker run"
    it << "--name grubruby_test"
    it << "-d=true" # detach, run in background
    it << "--rm"
    it << "-i"
    it << "-p #{outside_port}:3000"
    it << "-t #{test_image_tag}"
  }.join(" ")
  _, container_name, _ = run_command(setup_command)

  # Verify that the container is running
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Verifying that the container is running"
  running = false
  deadline = Time.now.utc + 60
  until running
    running = docker_container_running?(container_name)
    raise "[#{ruby_version}] Couldn't start container #{container_name} running image #{test_image_tag} for Ruby #{ruby_version}" if Time.now.utc > deadline
    sleep(1)
  end

  # Verify that the container is responding on specified port
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Verifying that the container responds with 200 on http://localhost:#{outside_port}/"
  webserver_running = false
  deadline = Time.now.utc + 60
  tries = 0
  until webserver_running
    tries += 1

    if healthy_server?(outside_port)
      webserver_running = true
    else
      webserver_running = false
    end

    raise "[#{ruby_version}] Couldn't connect to #{container_name} running image #{test_image_tag} for Ruby #{ruby_version} after #{tries} tries" if Time.now.utc > deadline
    sleep(1)
  end
  $logger.info "[#{ruby_version}] Container responded succesfully after #{tries} tries."

  # Shutdown container
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Shutting down container"
  kill_command = [].tap { |it|
    it << "docker kill"
    it << "--signal=SIGTERM"
    it << container_name
  }.join(" ")
  run_command(kill_command)

  # Delete Rails image
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Cleaning up, deleting Rails-image: #{test_image_tag}"
  delete_command = [].tap { |it|
    it << "docker image rm"
    it << "--force"
    it << test_image_tag
  }.join(" ")
  run_command(delete_command)

  # Delete Base image
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Cleaning up, deleting base-image: #{base_image_tag}"
  delete_command = [].tap { |it|
    it << "docker image rm"
    it << "--force"
    it << base_image_tag
  }.join(" ")
  run_command(delete_command)

  sleep(5)
}