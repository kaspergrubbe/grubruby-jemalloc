require_relative 'vars'
require_relative 'util'

def build?
  ARGV.include?('build')
end

def push?
  ARGV.include?('push')
end

def tag_name_variant(grubruby, variant)
  if push?
    "#{grubruby.repo_owner}/#{grubruby.repo_name}:#{grubruby.version}-#{variant}"
  else
    "#{grubruby.repo_owner}.local:#{grubruby.version}-#{variant}"
  end
end

def image_tag_name(grubruby, ruby_version)
  image_version = ruby_version.split('.').push(grubruby.version).join('.')

  if push?
    "#{grubruby.repo_owner}/#{grubruby.repo_name}:#{image_version}"
  else
    "#{grubruby.repo_name}.local:#{image_version}"
  end
end

def build_base_image(grubruby)
  base_image_tag = tag_name_variant(grubruby, 'base')

  base_command = [].tap do |it|
    it << 'docker build --compress'
    it << "--tag #{base_image_tag}"
    it << '--no-cache' if skip_cache?
    it << '--file base/Dockerfile'
    it << '.'
  end

  run_command(base_command.join(' '))

  base_image_tag
end

def build_jemalloc_image(grubruby, base_image_tag)
  buildjemalloc_tag = tag_name_variant(grubruby, 'buildjemalloc')

  buildjemalloc_command = [].tap do |it|
    it << 'docker build --compress'
    it << "--tag #{buildjemalloc_tag}"
    it << '--no-cache' if skip_cache?
    it << '--file buildjemalloc/Dockerfile'
    it << "--build-arg BASE_IMAGE=#{base_image_tag}"
    it << '.'
  end

  run_command(buildjemalloc_command.join(' '))

  buildjemalloc_tag
end

def build_ruby_image(grubruby, base_image_tag, buildjemalloc_tag, ruby_version, sha256hash, debugflags: nil, optflags: nil)
  image_tag_name = image_tag_name(grubruby, ruby_version)

  build_command = [].tap do |it|
    ruby_version_major = ruby_version[0..2]
    dockerfile = "ruby-#{ruby_version_major}/Dockerfile"

    it << 'docker build --compress'

    it << "--tag #{image_tag_name}"
    it << '--no-cache' if skip_cache?
    it << "--file #{dockerfile}"

    it << "--build-arg BASE_IMAGE=#{base_image_tag}"
    it << "--build-arg BUILDJEMALLOC_IMAGE=#{buildjemalloc_tag}"

    it << "--build-arg RUBY_MAJOR=#{ruby_version_major}"
    it << "--build-arg RUBY_VERSION=#{ruby_version}"
    it << "--build-arg RUBY_DOWNLOAD_SHA256=#{sha256hash}"

    it << "--build-arg RUBYGEMS_VERSION=#{grubruby.rubygems_version}"
    it << "--build-arg BUNDLER_VERSION=#{grubruby.bundler_version}"

    it << "--build-arg CUSTOM_DEBUGFLAGS=#{debugflags}" if debugflags
    it << "--build-arg CUSTOM_OPTFLAGS=#{optflags}" if optflags

    it << '.'
  end
  run_command(build_command.join(' '))

  image_tag_name
end

unless build?
  abort [].tap { |errmsg|
    errmsg << 'Usage:'
    errmsg << 'build.rb build      - Builds all images, fails on errors.'
    errmsg << 'build.rb build push - Builds all images, tags them, and pushes them to Dockerhub.'
  }.join("\n")
end

# Release info to be put into the CHANGELOG.md
release_info = []
release_info << "Grubruby version `#{@grubruby.version}` ships with:"
release_info << "- Rubygems `#{@grubruby.rubygems_version}`."
release_info << "- Bundler `#{@grubruby.bundler_version}`."
release_info << '- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.'
release_info << "\nAnd the following Ruby-versions:"

base_image_tag = build_base_image(@grubruby)
buildjemalloc_tag = build_jemalloc_image(@grubruby, base_image_tag)

# Commands to be run after main building block
after_commands = []

@supported_versions.each do |ruby_version, sha256hash, _, _|
  image_tag = build_ruby_image(@grubruby, base_image_tag, buildjemalloc_tag, ruby_version, sha256hash)

  size = bytes_to_megabytes(docker_image_size_in_bytes(image_tag))
  release_info << "- `#{ruby_version}` as `#{image_tag}` (#{size} MB)."

  after_commands.push("docker push #{image_tag}") if push?
end

after_commands.each do |command|
  run_command(command)
end

# Release info
puts release_info.join("\n")
