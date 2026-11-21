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

# The Rubies this release added go first, and every image is pushed as soon as it is built,
# so a new Ruby is out without waiting for the rest to build.
added = added_rubies(@grubruby.version)
ruby_versions = @supported_versions.partition { |ruby_version, _| added.include?(ruby_version) }.flatten(1)
$logger.info "Build order: #{ruby_versions.map(&:first).join(', ')}"

ruby_versions.each do |ruby_version, sha256hash|
  image_tag = image_tag_name(@grubruby, ruby_version)
  build_ruby_image(image_tag, @grubruby, base_image_tag, buildjemalloc_tag, ruby_version, sha256hash)

  run_command("docker push #{image_tag}") if push?
end

# Release info
puts shipped_with(@grubruby, @supported_versions)
