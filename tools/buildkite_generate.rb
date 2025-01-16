require_relative 'vars'

buildkite_block_step = <<-BLOCK
  - block: "Run? 🤔🧐🤨"
    blocked_state: "running"

BLOCK

def buildkite_ruby_step(ruby_version, index)
  web_port = 3500 + index

  <<-RUBY
  - command: |-
      exec 10>>~/.bash_profile
      flock 10

      echo "--- setup rbenv"
      source ~/.bash_profile

      echo "--- setup ruby"
      rbenv local 3.4.1 || rbenv install 3.4.1 && rbenv local 3.4.1

      echo "--- bundle setup"
      gem search --silent --installed --exact bundler || gem install bundler

      flock -u 10

      echo "--- tests"
      ruby tools/test.rb #{ruby_version}
    label: Ruby #{ruby_version}
    env:
      WEB_PORT: #{web_port}

  RUBY
end

case ARGV.first
when nil
  puts 'buildkite_generate.rb'
  puts 'prints buildkite configurations for Grubruby'
  puts ''
  puts '-minor: prints a configuration for all minor versions of Ruby'
  puts '-major: prints a configuration for all major versions of Ruby'
when '-minor'
  puts 'steps:'
  puts buildkite_block_step

  # Buildkite step for each version:
  versions = @supported_versions.map(&:first)

  versions.each_with_index do |version, index|
    puts buildkite_ruby_step(version, index)
  end
when '-major'
  # Buildkite step for each major version:
  versions = @supported_versions.map(&:first).map do |version|
    major, minor, = version.split('.')
    "#{major}.#{minor}"
  end.uniq

  versions.each_with_index do |version, index|
    puts buildkite_ruby_step(version, index)
  end
end
