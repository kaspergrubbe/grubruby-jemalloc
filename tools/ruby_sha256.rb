def program_exists?(program)
  `type "#{program}" > /dev/null 2>&1;`
  $?.success?
end

def run_command(command)
  system(command)

  unless $?.success?
    abort ['COMMAND:', command, 'failed with error:', $?].join(' ')
  end
end

['wget', 'shasum'].each do |program_name|
  unless program_exists?(program_name)
    abort "#{program_name} not installed"
  end
end

ruby_version = ARGV[0]
unless ruby_version
  abort "You need to provide script with a version number, e.g:\n  ruby tools/ruby_sha256.rb 2.5.1"
end

unless ruby_version.split('.').size == 3
  abort "Version number needs to be in format: x.y.z"
end
ruby_major   = ruby_version.split('.')[0..1].join('.')

run_command "wget -O ruby.tar.xz \"https://cache.ruby-lang.org/pub/ruby/#{ruby_major}/ruby-#{ruby_version}.tar.xz\""
run_command "shasum -a 256 ruby.tar.xz"
run_command "rm ruby.tar.xz"
