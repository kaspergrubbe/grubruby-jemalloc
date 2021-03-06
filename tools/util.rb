require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "yell", "2.2.0"
  gem "pry"
end

def debug?
  false
end

def skip_cache?
  false
end

def bytes_to_megabytes(bytes)
  (bytes.to_f / 1000000).round(2)
end

def docker_image_size_in_bytes(image_tag)
  size_command = [].tap { |it|
    it << "docker image inspect"
    it << image_tag
    it << "--format='{{.Size}}'"
  }.join(" ")
  _, size, _ = run_command(size_command)

  size
end

def run_command(command, input = nil, allowed_exit_codes = [0])
  $logger.debug "+ #{command}" if debug?

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
    puts "stdout:"
    puts stdout.strip
    puts
    puts "stderr:"
    puts stderr.strip
    puts
    raise "`#{command}` failed with status=#{status}"
  end

  return [status, stdout.strip, stderr.strip]
end

$logger = Yell.new do |l|
  l.adapter STDOUT, level: [:debug, :info, :warn]
  l.adapter STDERR, level: [:error, :fatal]
end
