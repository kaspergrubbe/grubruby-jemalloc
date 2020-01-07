require "open3"
require "json"
require "net/http"
require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "yell", "2.2.0"
  gem "pry"
end

grubruby_reponame = "grubruby-jemalloc"
grubruby_version  = "9000"
rubygems_version  = "3.1.2"
bundler_version   = "2.1.3"

# VERSION, HASH, NEEDS_THPOFF, RAILS_VERSION
supported_versions = [
  ["2.4.4", "1d0034071d675193ca769f64c91827e5f54cb3a7962316a41d5217c7bc6949f0", true,  "rails52"],
  ["2.4.5", "2f0cdcce9989f63ef7c2939bdb17b1ef244c4f384d85b8531d60e73d8cc31eeb", true,  "rails52"],
  ["2.4.6", "25da31b9815bfa9bba9f9b793c055a40a35c43c6adfb1fdbd81a09099f9b529c", true,  "rails52"],
  ["2.4.7", "a249193c7e79b891a4783f951cad8160fa5fe985c385b4628db8e9913bff1f98", true,  "rails52"],
  ["2.4.8", "a2a8f53ef14b891821dbbf67b081d7b9e223007a347000ff4a86a226a4708272", true,  "rails52"],
  ["2.4.9", "0c4e000253ef7187feeb940a01a1c7594f28d63aa16f978e892a0e2864f58614", true,  "rails52"],
  ["2.5.1", "886ac5eed41e3b5fc699be837b0087a6a5a3d10f464087560d2d21b3e71b754d", true,  "rails60"],
  ["2.5.2", "8be6b6afdf09957a6e2c2a6ada4b1982a391a828b34e49072c4beb60febb678d", true,  "rails60"],
  ["2.5.3", "1cc9d0359a8ea35fc6111ec830d12e60168f3b9b305a3c2578357d360fcf306f", true,  "rails60"],
  ["2.5.5", "9bf6370aaa82c284f193264cc7ca56f202171c32367deceb3599a4f354175d7d", true,  "rails60"],
  ["2.5.6", "7601e4b83f4f17bc1affe091502dd465282ffba0761dea57c071ead21b132cee", true,  "rails60"],
  ["2.5.7", "201870e8f58957d542233fef588b1d76f7bf962fea44dcbd2237f4a5899a3f95", true,  "rails60"],
  ["2.6.0", "acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f", false, "rails60"],
  ["2.6.1", "47b629808e9fd44ce1f760cdf3ed14875fc9b19d4f334e82e2cf25cb2898f2f2", false, "rails60"],
  ["2.6.2", "91fcde77eea8e6206d775a48ac58450afe4883af1a42e5b358320beb33a445fa", false, "rails60"],
  ["2.6.3", "11a83f85c03d3f0fc9b8a9b6cad1b2674f26c5aaa43ba858d4b0fcc2b54171e1", false, "rails60"],
  ["2.6.4", "df593cd4c017de19adf5d0154b8391bb057cef1b72ecdd4a8ee30d3235c65f09", false, "rails60"],
  ["2.6.5", "d5d6da717fd48524596f9b78ac5a2eeb9691753da5c06923a6c31190abe01a62", false, "rails60"],
  ["2.7.0", "27d350a52a02b53034ca0794efe518667d558f152656c2baaf08f3d0c8b02343", false, "rails60"],
]

$logger = Yell.new do |l|
  l.adapter STDOUT, level: [:debug, :info, :warn]
  l.adapter STDERR, level: [:error, :fatal]
end

def run_command(command, input = nil, allowed_exit_codes = [0])
  process, status, stdout, stderr = Open3.popen3(command) do |stdin, stdout, stderr, wait_thread|
    if input
      stdin.puts(input)
    end
    stdin.close

    threads = {}.tap do |it|
      it[:stdout] = Thread.new do
        output = []
        stdout.each do |l|
          output << l
          $logger.debug l.strip if debug?
        end
        Thread.current[:output] = output.join
      end

      it[:stderr] = Thread.new do
        output = []
        stderr.each do |l|
          output << l
          $logger.debug l.strip if debug?
        end
        Thread.current[:output] = output.join
      end
    end
    threads.values.map(&:join)

    [wait_thread.value, wait_thread.value.exitstatus, threads[:stdout][:output], threads[:stderr][:output]]
  end

  unless allowed_exit_codes.include?(status)
    raise "`#{command}` failed with status=#{status}"
  end

  return [status, stdout.strip, stderr.strip]
end

def skip_cache?
  false
end

def debug?
  false
end

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
$logger.info "Building and testing images for the following Ruby-versions: #{supported_versions.map(&:first).join(", ")}"
$logger.info

test_time = Time.now.utc.to_i
supported_versions.map { |ruby_version, sha256hash, needs_thpoff, rails_version|
  base_image_tag = "#{grubruby_reponame}.beta:#{test_time}-#{ruby_version}"

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
    it << "--build-arg RUBYGEMS_VERSION=#{rubygems_version}"
    it << "--build-arg BUNDLER_VERSION=#{bundler_version}"
    it << "."
  }.join(" ")
  $logger.debug "[#{ruby_version}] + #{build_command}" if debug?
  run_command(build_command)

  [ruby_version, needs_thpoff, rails_version, base_image_tag]
}.map { |ruby_version, needs_thpoff, rails_version, base_image_tag|
  test_image_tag = "#{grubruby_reponame}.beta:#{test_time}-#{ruby_version}-webtest"

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
  $logger.debug "[#{ruby_version}] + #{build_command}" if debug?

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
  $logger.debug "[#{ruby_version}] + #{setup_command}" if debug?
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
  $logger.debug "[#{ruby_version}] + #{kill_command}" if debug?
  run_command(kill_command)

  # Delete Rails image
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Cleaning up, deleting Rails-image: #{test_image_tag}"
  delete_command = [].tap { |it|
    it << "docker image rm"
    it << "--force"
    it << test_image_tag
  }.join(" ")
  $logger.debug "[#{ruby_version}] + #{delete_command}" if debug?
  run_command(delete_command)

  # Delete Base image
  # -----------------------------------------------------------------
  $logger.info "[#{ruby_version}] Cleaning up, deleting base-image: #{base_image_tag}"
  delete_command = [].tap { |it|
    it << "docker image rm"
    it << "--force"
    it << base_image_tag
  }.join(" ")
  $logger.debug "[#{ruby_version}] + #{delete_command}" if debug?
  run_command(delete_command)

  sleep(5)
}
