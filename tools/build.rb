require_relative 'vars'
require_relative 'util'
require_relative 'helpers'

def build?
  ARGV.include?('build')
end

def push?
  ARGV.include?('push')
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
  image_tag = image_tag_name(@grubruby, ruby_version)
  build_ruby_image(image_tag, @grubruby, base_image_tag, buildjemalloc_tag, ruby_version, sha256hash)

  size = bytes_to_megabytes(docker_image_size_in_bytes(image_tag))
  release_info << "- `#{ruby_version}` as `#{image_tag}` (#{size} MB)."

  after_commands.push("docker push #{image_tag}") if push?
end

after_commands.each do |command|
  run_command(command)
end

# Release info
puts release_info.join("\n")
