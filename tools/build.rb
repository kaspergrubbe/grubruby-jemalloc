grubruby_repoowner = 'kaspergrubbe'
grubruby_reponame  = 'grubruby-jemalloc'
grubruby_version   = '8020'
rubygems_version   = '3.1.2'
bundler_version    = '2.1.3'

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
  ['2.4.6', '25da31b9815bfa9bba9f9b793c055a40a35c43c6adfb1fdbd81a09099f9b529c'],
  ['2.4.7', 'a249193c7e79b891a4783f951cad8160fa5fe985c385b4628db8e9913bff1f98'],
  ['2.4.8', 'a2a8f53ef14b891821dbbf67b081d7b9e223007a347000ff4a86a226a4708272'],
  ['2.4.9', '0c4e000253ef7187feeb940a01a1c7594f28d63aa16f978e892a0e2864f58614'],
  ['2.5.1', '886ac5eed41e3b5fc699be837b0087a6a5a3d10f464087560d2d21b3e71b754d'],
  ['2.5.2', '8be6b6afdf09957a6e2c2a6ada4b1982a391a828b34e49072c4beb60febb678d'],
  ['2.5.3', '1cc9d0359a8ea35fc6111ec830d12e60168f3b9b305a3c2578357d360fcf306f'],
  ['2.5.4', '46f6eff655a6be1939f70c7a4c1bf58f76663e7e804738bc52f4d47ca31dee3d'],
  ['2.5.5', '9bf6370aaa82c284f193264cc7ca56f202171c32367deceb3599a4f354175d7d'],
  ['2.5.6', '7601e4b83f4f17bc1affe091502dd465282ffba0761dea57c071ead21b132cee'],
  ['2.5.7', '201870e8f58957d542233fef588b1d76f7bf962fea44dcbd2237f4a5899a3f95'],
  ['2.6.0', 'acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f'],
  ['2.6.1', '47b629808e9fd44ce1f760cdf3ed14875fc9b19d4f334e82e2cf25cb2898f2f2'],
  ['2.6.2', '91fcde77eea8e6206d775a48ac58450afe4883af1a42e5b358320beb33a445fa'],
  ['2.6.3', '11a83f85c03d3f0fc9b8a9b6cad1b2674f26c5aaa43ba858d4b0fcc2b54171e1'],
  ['2.6.4', 'df593cd4c017de19adf5d0154b8391bb057cef1b72ecdd4a8ee30d3235c65f09'],
  ['2.6.5', 'd5d6da717fd48524596f9b78ac5a2eeb9691753da5c06923a6c31190abe01a62'],
  ['2.7.0', '27d350a52a02b53034ca0794efe518667d558f152656c2baaf08f3d0c8b02343'],
]

# Release info to be put into the CHANGELOG.md
release_info = []
release_info << "Grubruby version `#{grubruby_version}` ships with:"
release_info << "- Rubygems `#{rubygems_version}`."
release_info << "- Bundler `#{bundler_version}`."
release_info << "- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`."
release_info << "\nAnd the following Ruby-versions:"

# Commands to be run after main building block
after_commands = []

supported_versions.each do |ruby_version, sha256hash|
  image_version   = ruby_version.split('.').push(grubruby_version).join('.')
  image_tag       = "#{grubruby_repoowner}/#{grubruby_reponame}:#{image_version}"
  image_tag_local = "#{grubruby_reponame}.local:#{image_version}"
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
