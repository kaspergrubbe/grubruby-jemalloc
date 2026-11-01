require 'json'
require 'open3'

class Grubruby
  def initialize(repo_owner, repo_name, version, rubygems_version, bundler_version)
    @repo_owner = repo_owner
    @repo_name = repo_name
    @version = version
    @rubygems_version = rubygems_version
    @bundler_version = bundler_version
  end

  attr_reader :repo_owner, :repo_name, :rubygems_version, :bundler_version

  def version
    @version or raise 'env VERSION= or BUILDKITE_TAG= must be set'
  end
end

repo_owner  = 'kaspergrubbe'
repo_name   = 'grubruby-jemalloc'
env_version = ENV['VERSION'] || ENV['BUILDKITE_TAG']
version     = env_version&.delete_prefix('v')&.to_i
rubygems    = '4.0.21'
bundler     = '4.0.21'

@grubruby = Grubruby.new(repo_owner, repo_name, version, rubygems, bundler)

# Newest first, as [VERSION, HASH, RAILS_VERSION]
@supported_versions = JSON.parse(File.read('tools/rubies.json'))
                          .map { |ruby| [ruby['version'], ruby['sha256'], ruby['rails']] }
                          .reverse
