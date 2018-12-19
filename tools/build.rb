grubruby_repoowner = 'kaspergrubbe'
grubruby_reponame  = 'grubruby-jemalloc'
grubruby_version   = '8006'
rubygems_version   = '3.0.0'
bundler_version    = '1.17.2'

def run_command(command)
  system(command)

  unless $?.success?
    abort ['COMMAND:', command, 'failed with error:', $?].join(' ')
  end
end

def build?
  ARGV.include?('build')
end

def push?
  ARGV.include?('push')
end

unless build?
  abort [].tap { |errmsg|
    errmsg << "Usage:"
    errmsg << "build.rb build      - Builds all images, fails on errors."
    errmsg << "build.rb build push - Builds all images, tags them, and pushes them to Dockerhub."
  }.join("\n")
end

supported_versions = [
  ['2.3.7', 'c61f8f2b9d3ffff5567e186421fa191f0d5e7c2b189b426bb84498825d548edb'],
  ['2.3.8', '910f635d84fd0d81ac9bdee0731279e6026cb4cd1315bbbb5dfb22e09c5c1dfe'],
  ['2.4.4', '1d0034071d675193ca769f64c91827e5f54cb3a7962316a41d5217c7bc6949f0'],
  ['2.4.5', '2f0cdcce9989f63ef7c2939bdb17b1ef244c4f384d85b8531d60e73d8cc31eeb'],
  ['2.5.1', '886ac5eed41e3b5fc699be837b0087a6a5a3d10f464087560d2d21b3e71b754d'],
  ['2.5.2', '8be6b6afdf09957a6e2c2a6ada4b1982a391a828b34e49072c4beb60febb678d'],
  ['2.5.3', '1cc9d0359a8ea35fc6111ec830d12e60168f3b9b305a3c2578357d360fcf306f'],
]

# Release info to be put into the CHANGELOG.md
release_info = []
release_info << "Grubruby version `#{grubruby_version}` ships with:"
release_info << "- Rubygems `#{rubygems_version}`."
release_info << "- Bundler `#{bundler_version}`."
release_info << "- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`."
release_info << "\nAnd the following Ruby-versions:"

# Commands to be run after main building block
after_commands = []

supported_versions.each do |ruby_version, sha256hash|
  image_version = ruby_version.split('.').push(grubruby_version).join('.')
  image_tag     = "#{grubruby_repoowner}/#{grubruby_reponame}:#{image_version}"
  release_info  << "- `#{ruby_version}` as `#{image_tag}`."

  build_command = [].tap { |it|
    ruby_version_major = ruby_version[0..2]
    dockerfile = "ruby-#{ruby_version_major}/Dockerfile"

    it << 'docker build --compress'
    it << "--tag #{image_tag}" if push?
    it << "--file #{dockerfile}"
    it << "--build-arg RUBY_MAJOR=#{ruby_version_major}"
    it << "--build-arg RUBY_VERSION=#{ruby_version}"
    it << "--build-arg RUBY_DOWNLOAD_SHA256=#{sha256hash}"
    it << "--build-arg RUBYGEMS_VERSION=#{rubygems_version}"
    it << "--build-arg BUNDLER_VERSION=#{bundler_version}"
    it << '.'
  }.join(' ')

  run_command(build_command)

  if push?
    after_commands << "docker push #{image_tag}"
  end
end

after_commands.each do |command|
  run_command(command)
end

# Release info
puts 'MARKDOWN BUILD NOTES:'
puts release_info.join("\n")
