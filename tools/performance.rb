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
ruby_version, sha256hash, = @supported_versions.last

# -0s: Enables all -O2 optimizations except those that often increase code size
# -Ofast: Disregard strict standards compliance. -Ofast enables all -O3 optimizations
o = RubyFlagCollection.new(['-O1', '-O2', '-O3', '-Ofast'], :cflag)
march = RubyFlagCollection.new([nil, '-march=x86-64', '-march=native'], :cflag)
sem = RubyFlagCollection.new([nil, '-fno-semantic-interposition'], :cflag)
ggdb = RubyFlagCollection.new([nil, '-g', '-ggdb3'], :debugflag)

combinations = o.flags.product(march.flags, sem.flags, ggdb.flags).map { |fl| fl.delete_if { |f| f.flag.nil? } }

combinations.each.with_index(1) do |combination, index|
  combination_name = combination.map(&:flag).join(' ')

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
  status, stdout, stderr = run_command(build_command.join(' '))

  # Run benchmarks
  # ------------------------------------------------------------------
  $logger.info "#{logger_header} .. running benchmark-suite!"
  build_command = [].tap do |it|
    it << 'docker run'
    it << '--privileged'
    it << "--name rubybench#{Time.now.to_i}"
    it << '--rm'
    it << "-t #{bench_image_tag}"
    it << 'ruby run_benchmarks.rb'
  end
  status, stdout, stderr = run_command(build_command.join(' '))

  # Parse benchmark data
  # ------------------------------------------------------------------
  ruby_details = {
    'index' => index,
    'combination_name' => combination_name,
    'debugflags' => debugflags.map(&:flag),
    'optflags' => optflags.map(&:flag),
  }
  benchmark_scores = JSON.parse(stdout.lines.select{|l| l.start_with?('json=') }.first.split('=').last).merge({'ruby_details' => ruby_details})
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
