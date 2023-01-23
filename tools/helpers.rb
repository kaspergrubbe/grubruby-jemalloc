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

def build_ruby_image(tag_name, grubruby, base_image_tag, buildjemalloc_tag, ruby_version, sha256hash, debugflags: nil, optflags: nil)
  build_command = [].tap do |it|
    ruby_version_major = ruby_version[0..2]
    dockerfile = "ruby-#{ruby_version_major}/Dockerfile"

    it << 'docker build --compress'

    it << "--tag #{tag_name}"
    it << '--no-cache' if skip_cache?
    it << "--file #{dockerfile}"

    it << "--build-arg BASE_IMAGE=#{base_image_tag}"
    it << "--build-arg BUILDJEMALLOC_IMAGE=#{buildjemalloc_tag}"

    it << "--build-arg RUBY_MAJOR=#{ruby_version_major}"
    it << "--build-arg RUBY_VERSION=#{ruby_version}"
    it << "--build-arg RUBY_DOWNLOAD_SHA256=#{sha256hash}"

    it << "--build-arg RUBYGEMS_VERSION=#{grubruby.rubygems_version}"
    it << "--build-arg BUNDLER_VERSION=#{grubruby.bundler_version}"

    debugflags = nil if debugflags && debugflags.strip.empty?
    it << "--build-arg CUSTOM_DEBUGFLAGS=\"#{debugflags}\"" if debugflags

    optflags = nil if optflags && optflags.strip.empty?
    it << "--build-arg CUSTOM_OPTFLAGS=\"#{optflags}\"" if optflags

    it << '.'
  end
  run_command(build_command.join(' '))

  tag_name
end

def docker_container_running?(container_name)
  check_command = [].tap do |it|
    it << 'docker inspect'
    it << container_name
  end
  status, stdout, = run_command(check_command.join(' '), nil, [0, 1])

  case status
  when 0
    container_data = JSON.parse(stdout).first
    container_data['State']['Running']
  else
    false
  end
end

def healthy_server?(port)
  uri = URI("http://localhost:#{port}")
  http = Net::HTTP.new(uri.host, uri.port)
  req =  Net::HTTP::Get.new(uri)
  req.add_field('Accept-Encoding', 'gzip, deflate')

  res = http.request(req)

  case res.code.to_i
  when 200..299
    puts JSON.parse(res.body) if debug?

    true
  else
    false
  end
rescue
  false
end

