require_relative 'vars'
require_relative 'util'
require_relative 'helpers'

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
o = RubyFlagCollection.new(['-O1', '-O2', '-Os', '-O3', '-Ofast'], :cflag)
march = RubyFlagCollection.new([nil, '-march=x86-64', '-march=native'], :cflag)
sem = RubyFlagCollection.new([nil, '-fno-semantic-interposition'], :cflag)
ggdb = RubyFlagCollection.new([nil, '-g', '-ggdb3'], :debugflag)

combinations = o.flags.product(march.flags, sem.flags, ggdb.flags).map { |fl| fl.delete_if { |f| f.flag.nil? } }

combinations.each do |combination|
  variant_image_tag = tag_name_variant(@grubruby, "variant-#{Time.now.to_i}")

  optflags = [].tap do |d|
    d.concat(combination.select { |c| c.group == :cflag })
  end
  debugflags = [].tap do |d|
    d.concat(combination.select { |c| c.group == :debugflag })
  end

  # Build Ruby variant
  # -----------------------------------------------------------------
  $logger.info "Building a version of #{ruby_version} with name: #{variant_image_tag}"
  $logger.info "- optflags: #{optflags.map(&:flag).join(' ')}" if optflags.any?
  $logger.info "- debugflags: #{debugflags.map(&:flag).join(' ')}" if debugflags.any?
  build_ruby_image(variant_image_tag, @grubruby, build_image_tag, buildjemalloc_tag, ruby_version, sha256hash,
                   debugflags: debugflags.map(&:flag).join(' '),
                   optflags: optflags.map(&:flag).join(' '))

  require 'pry'; binding.pry
end
