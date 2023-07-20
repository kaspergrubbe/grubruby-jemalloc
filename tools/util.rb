require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
end

def debug?
  !ENV['DEBUG'].nil?
end

def skip_cache?
  false
end

def bytes_to_megabytes(bytes)
  (bytes.to_f / 1_000_000).round(2)
end

def docker_image_size_in_bytes(image_tag)
  size_command = [].tap do |it|
    it << 'docker image inspect'
    it << image_tag
    it << "--format='{{.Size}}'"
  end.join(' ')
  _, size, = run_command(size_command)

  size
end

def run_command(command, input = nil, allowed_exit_codes = [0])
  $logger.debug "+ #{command}" if debug?

  _process, status, stdout, stderr = Open3.popen3(command) do |stdin, stdout, stderr, wait_thread|
    stdin.puts(input) if input
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
    puts 'stdout:'
    puts stdout.strip
    puts
    puts 'stderr:'
    puts stderr.strip
    puts
    raise "`#{command}` failed with status=#{status}"
  end

  [status, stdout.strip, stderr.strip]
end

class PutsLogger
  def info(message = '')
    puts "[#{Time.now}] #{message}"
  end

  def debug(message = '')
    puts "[#{Time.now}] #{message}"
  end
end
$logger = PutsLogger.new
