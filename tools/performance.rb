require_relative 'vars'
require_relative 'util'
require_relative 'helpers'

require 'json'
require 'fileutils'

unless Dir.exist?('spec/yjit-bench')
  run_command('wget https://github.com/kaspergrubbe/yjit-bench/archive/refs/heads/main.zip')
  run_command('unzip main.zip -d spec/')
  run_command('rm main.zip')
  run_command('mv spec/yjit-bench-main spec/yjit-bench')
end

class RubyFlag
  def initialize(flag, group)
    @flag = flag
    @group = group
  end

  attr_reader :flag, :group
end

class RubyFlagCollection
  def initialize(flag_list, group)
    @flags = flag_list.map { |f| RubyFlag.new(f, group) }
  end

  attr_reader :flags
end

def push?
  false
end

build_image_tag = build_base_image(@grubruby)
buildjemalloc_tag = build_jemalloc_image(@grubruby, build_image_tag)

ruby_version, sha256hash, = @supported_versions.select{|rv| rv[0] == '3.1.3'}.first
# ruby_version, sha256hash, = @supported_versions.last

# -0s: Enables all -O2 optimizations except those that often increase code size
flags = []
flags << RubyFlagCollection.new([nil, '-0s', '-O2', '-O3'], :cflag)
# flags << RubyFlagCollection.new([nil, '-march=x86-64', '-march=x86-64-v4', '-march=native'], :cflag)
flags << RubyFlagCollection.new([nil, '-fno-semantic-interposition'], :cflag)
flags << RubyFlagCollection.new([nil, '-flto'], :cflag)
# flags << RubyFlagCollection.new([nil, '-finline-limit=10000', '-finline-limit=7500', '-finline-limit=5000', '-finline-limit=2500', '-finline-limit=1500'], :cflag)

flags << if ['2.6', '2.7', '3.0'].map{|mjit_version| ruby_version.start_with?(mjit_version)}.any?
  RubyFlagCollection.new([nil, '--jit --jit-wait'], :runtimeflag)
elsif ruby_version.start_with?('3.1')
  RubyFlagCollection.new([nil, '--mjit --mjit-wait'], :runtimeflag)
elsif ruby_version.start_with?('3.2')
  RubyFlagCollection.new([nil, '--yjit'], :runtimeflag)
else
  RubyFlagCollection.new([nil], :runtimeflag)
end

combinations = flags.first.flags.product(*flags.drop(1).map(&:flags)).map { |fl| fl.delete_if { |f| f.flag.nil? } }

combinations.each.with_index(1) do |combination, index|
  combination_name = combination.map(&:flag).join(' ')

  runtimeflags = [].tap do |d|
    d.concat(combination.select { |c| c.group == :runtimeflag })
  end
  optflags = [].tap do |d|
    d.concat(combination.select { |c| c.group == :cflag })
  end
  debugflags = [].tap do |d|
    d.concat(combination.select { |c| c.group == :debugflag })
  end

  # Build Ruby variant
  # -----------------------------------------------------------------
  variant_image_tag = tag_name_variant(@grubruby, "variant-#{Time.now.to_i}")
  logger_header = "[#{index}/#{combinations.size}]"
  $logger.info "#{logger_header} Building a version of #{ruby_version} with name: #{variant_image_tag}"
  $logger.info "#{logger_header} ... combination_name: #{combination_name}"
  $logger.info "#{logger_header} - runtimeflags: #{runtimeflags.map(&:flag).join(' ')}" if runtimeflags.any?
  $logger.info "#{logger_header} - optflags: #{optflags.map(&:flag).join(' ')}" if optflags.any?
  $logger.info "#{logger_header} - debugflags: #{debugflags.map(&:flag).join(' ')}" if debugflags.any?
  
  build_ruby_image(variant_image_tag, @grubruby, build_image_tag, buildjemalloc_tag, ruby_version, sha256hash,
                   debugflags: debugflags.map(&:flag).join(' '),
                   optflags: optflags.map(&:flag).join(' '))

  # Install benchmark-suite with Ruby variant
  # -----------------------------------------------------------------
  bench_image_tag = tag_name_variant(@grubruby, "bench-#{Time.now.to_i}")
  $logger.info "#{logger_header} Building a variant with benchmark suite with name of: #{bench_image_tag}"
  build_command = [].tap do |it|
    it << 'docker build --compress'
    it << "--tag #{bench_image_tag}"
    it << '--no-cache' if skip_cache?
    it << '--file spec/performance/Dockerfile'
    it << "--build-arg IMAGE=#{variant_image_tag}"
    it << 'spec/yjit-bench'
  end
  run_command(build_command.join(' '))

  # Run benchmarks
  # ------------------------------------------------------------------
  runtimeflags_cmd = runtimeflags.map(&:flag).join(' ')
  $logger.info "#{logger_header} .. running benchmark-suite!"
  benchmark_output = ''.tap do |output|
    build_command = [].tap do |it|
      it << 'docker run'
      it << '--privileged'
      it << "--name rubybench#{Time.now.to_i}"
      it << '--rm'
      it << "-t #{bench_image_tag}"
      it << "ruby run_benchmarks.rb --ruby_opts='#{runtimeflags_cmd}'"
    end
    _, stdout, _ = run_command(build_command.join(' '))
  end

  # Fetch actual compile flags
  # ------------------------------------------------------------------
  $logger.info "#{logger_header} .. fetching actual compile-flags!"
  actual_compile_flags = ''.tap do |acf|
    build_command = [].tap do |it|
      it << 'docker run'
      it << '--privileged'
      it << "--name rubybench#{Time.now.to_i}"
      it << '--rm'
      it << "-t #{variant_image_tag}" 
      it << "ruby -r rbconfig -e 'a = RbConfig::CONFIG[\"CFLAGS\"].split - RbConfig::CONFIG[\"warnflags\"].split; puts a.join \" \"'"
    end
    _, acf, _ = run_command(build_command.join(' '))
  end

  # Parse benchmark data
  # ------------------------------------------------------------------
  ruby_details = {
    'index' => index,
    'combination_name' => combination_name,
    'runtimeflags' => runtimeflags.map(&:flag),
    'debugflags' => debugflags.map(&:flag),
    'optflags' => optflags.map(&:flag),
    'actualcompileflags' => actual_compile_flags,
  }
  benchmark_scores = {'ruby_details' => ruby_details}.merge(JSON.parse(benchmark_output.lines.select{|l| l.start_with?('json=') }.first.split('=').last))
  FileUtils.mkdir_p('benchmark_results')

  $logger.info "#{logger_header} .. writing results to file"
  File.open("benchmark_results/benchmark-#{index}.json", 'w') do |f|
    f.write(JSON.pretty_generate(benchmark_scores))
  end

  # Cleaning up
  # ------------------------------------------------------------------
  $logger.info "#{logger_header} .. cleaning up images"
  run_command("docker image rm #{variant_image_tag}")
  run_command("docker image rm #{bench_image_tag}")

  $logger.info ''
end
