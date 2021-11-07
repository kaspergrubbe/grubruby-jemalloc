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

# -0s: Enables all -O2 optimizations except those that often increase code size
# -Ofast: Disregard strict standards compliance. -Ofast enables all -O3 optimizations
o = RubyFlagCollection.new(['-O1', '-O2', '-Os', '-O3', '-Ofast'], :cflag)
march = RubyFlagCollection.new([nil, '-march=x86-64', '-march=native'], :cflag)
sem = RubyFlagCollection.new([nil, '-fno-semantic-interposition'], :cflag)
ggdb = RubyFlagCollection.new([nil, '-g', '-ggdb3'], :debugflag)

combinations = o.flags.product(march.flags, sem.flags, ggdb.flags).map { |fl| fl.delete_if { |f| f.flag.nil? } }

combinations.each do |combination|
  combination_name = combination.map(&:flag).join

  optflags = [].tap do |d|
    d.concat(combination.select { |c| c.group == :cflag })
  end

  debugflags = [].tap do |d|
    d.concat(combination.select { |c| c.group == :debugflag })
  end

  require 'pry'; binding.pry
end
