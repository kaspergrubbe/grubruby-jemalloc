require_relative "vars.rb"

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

# Release info to be put into the CHANGELOG.md
release_info = []
release_info << "Grubruby version `#{@grubruby_version}` ships with:"
release_info << "- Rubygems `#{@rubygems_version}`."
release_info << "- Bundler `#{@bundler_version}`."
release_info << "- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`."
release_info << "\nAnd the following Ruby-versions:"

# Commands to be run after main building block
after_commands = []

@supported_versions.each do |ruby_version, sha256hash, _, _|
  image_version   = ruby_version.split('.').push(@grubruby_version).join('.')
  image_tag       = "#{@grubruby_repoowner}/#{@grubruby_reponame}:#{image_version}"
  image_tag_local = "#{@grubruby_reponame}.local:#{image_version}"
  release_info   << "- `#{ruby_version}` as `#{image_tag}`."

  build_command = [].tap { |it|
    ruby_version_major = ruby_version[0..2]
    dockerfile = "ruby-#{ruby_version_major}/Dockerfile"

    it << 'docker build --compress'
    if push?
      puts "Tag: #{image_tag}"
      it << "--tag #{image_tag}"
    else
      puts "Tag: #{image_tag_local}"
      it << "--tag #{image_tag_local}"
    end
    # it << "--no-cache"
    it << "--file #{dockerfile}"
    it << "--build-arg RUBY_MAJOR=#{ruby_version_major}"
    it << "--build-arg RUBY_VERSION=#{ruby_version}"
    it << "--build-arg RUBY_DOWNLOAD_SHA256=#{sha256hash}"
    it << "--build-arg RUBYGEMS_VERSION=#{@rubygems_version}"
    it << "--build-arg BUNDLER_VERSION=#{@bundler_version}"
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
