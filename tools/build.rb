require_relative 'vars'
require_relative 'util'

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

# Release info to be put into the CHANGELOG.md
release_info = []
release_info << "Grubruby version `#{@grubruby_version}` ships with:"
release_info << "- Rubygems `#{@rubygems_version}`."
release_info << "- Bundler `#{@bundler_version}`."
release_info << "- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`."
release_info << "\nAnd the following Ruby-versions:"

# Commands to be run after main building block
after_commands = []

base_image_tag = if push?
  "#{@grubruby_repoowner}/#{@grubruby_reponame}:#{@grubruby_version}-base"
else
  "#{@grubruby_reponame}.local:#{@grubruby_version}-base"
end
base_command = [].tap { |it|
  it << 'docker build --compress'
  it << "--tag #{base_image_tag}"
  it << "--no-cache" if skip_cache?
  it << "--file base/Dockerfile"
  it << '.'
}.join(' ')
run_command(base_command)

buildjemalloc_tag = if push?
  "#{@grubruby_repoowner}/#{@grubruby_reponame}:#{@grubruby_version}-buildjemalloc"
else
  "#{@grubruby_reponame}.local:#{@grubruby_version}-buildjemalloc"
end
buildjemalloc_command = [].tap { |it|
  it << 'docker build --compress'
  it << "--tag #{buildjemalloc_tag}"
  it << "--no-cache" if skip_cache?
  it << "--file buildjemalloc/Dockerfile"
  it << "--build-arg BASE_IMAGE=#{base_image_tag}"
  it << '.'
}.join(' ')
run_command(buildjemalloc_command)

@supported_versions.each do |ruby_version, sha256hash, _, _|
  image_version = ruby_version.split('.').push(@grubruby_version).join('.')
  image_tag = if push?
    "#{@grubruby_repoowner}/#{@grubruby_reponame}:#{image_version}"
  else
    "#{@grubruby_reponame}.local:#{image_version}"
  end

  build_command = [].tap { |it|
    ruby_version_major = ruby_version[0..2]
    dockerfile = "ruby-#{ruby_version_major}/Dockerfile"

    it << 'docker build --compress'
    it << "--tag #{image_tag}"
    it << "--no-cache" if skip_cache?
    it << "--file #{dockerfile}"
    it << "--build-arg BASE_IMAGE=#{base_image_tag}"
    it << "--build-arg BUILDJEMALLOC_IMAGE=#{buildjemalloc_tag}"
    it << "--build-arg RUBY_MAJOR=#{ruby_version_major}"
    it << "--build-arg RUBY_VERSION=#{ruby_version}"
    it << "--build-arg RUBY_DOWNLOAD_SHA256=#{sha256hash}"
    it << "--build-arg RUBYGEMS_VERSION=#{@rubygems_version}"
    it << "--build-arg BUNDLER_VERSION=#{@bundler_version}"
    it << "--build-arg BUNDLER_VERSION=#{@bundler_version}"
    it << '.'
  }.join(' ')
  run_command(build_command)

  size = bytes_to_megabytes(docker_image_size_in_bytes(image_tag))
  release_info << "- `#{ruby_version}` as `#{image_tag}` (#{size} MB)."

  after_commands.push("docker push #{image_tag}") if push?
end

after_commands.each do |command|
  run_command(command)
end

# Release info
puts release_info.join("\n")
