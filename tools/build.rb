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

base_image_tag = build_base_image(@grubruby)
buildjemalloc_tag = build_jemalloc_image(@grubruby, base_image_tag)

# Commands to be run after main building block
after_commands = []

@supported_versions.each do |ruby_version, sha256hash|
  image_tag = image_tag_name(@grubruby, ruby_version)
  build_ruby_image(image_tag, @grubruby, base_image_tag, buildjemalloc_tag, ruby_version, sha256hash)

  after_commands.push("docker push #{image_tag}") if push?
end

after_commands.each do |command|
  run_command(command)
end

# Release info
puts shipped_with(@grubruby, @supported_versions)
