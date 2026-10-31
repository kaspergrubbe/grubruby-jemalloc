# Run by the scheduled `grubruby-release-watch` Buildkite pipeline:
# adds new Ruby releases to master, and tags a release once things have been quiet.
# Run it from the repository root: `ruby tools/check_releases.rb`.
#
# DRY_RUN set to any value commits and tags locally without pushing, RELEASE_QUIET_MINUTES=0 skips the cooldown.

require 'date'
require 'digest'
require 'json'
require 'net/http'
require 'open3'
require 'shellwords'
require 'yaml'

require_relative 'util'

RELEASES_URL   = 'https://raw.githubusercontent.com/ruby/www.ruby-lang.org/master/_data/releases.yml'
RUBIES_PATH    = 'tools/rubies.json'
CHANGELOG_PATH = 'CHANGELOG.md'
UNRELEASED     = '## [Unreleased]'
REMOTE         = 'git@github.com:kaspergrubbe/grubruby-jemalloc.git'

# We build a Ruby series when there is a ruby-X.Y folder with its Dockerfile, e.g. ["3.2", "3.3", "3.4", "4.0"].
SUPPORTED_SERIES = Dir.glob('ruby-*/').map { |dir| dir.delete_prefix('ruby-').delete_suffix('/') }

# Only bot-style "Added Ruby" lines trigger an automatic release, so keep these two in sync.
NEW_RUBY_ENTRY = %r{^- Added Ruby \d+\.\d+\.\d+, https://www\.ruby-lang\.org/}

def changelog_entry(release)
  "- Added Ruby #{release['version']}, https://www.ruby-lang.org#{release['post']}"
end

def http_get(url)
  response = Net::HTTP.get_response(URI(url))
  abort "GET #{url} failed with #{response.code}" unless response.is_a?(Net::HTTPSuccess)

  response.body
end

def series(version)
  version.split('.')[0..1].join('.')
end

def ruby_releases
  YAML.safe_load(http_get(RELEASES_URL), permitted_classes: [Date])
      .select { |release| release['version'].to_s.match?(/\A\d+\.\d+\.\d+\z/) }
end

def verified_sha256(release)
  version  = release['version']
  expected = release.dig('sha256', 'xz') or abort "releases.yml has no xz sha256 for #{version}"
  url      = "https://cache.ruby-lang.org/pub/ruby/#{series(version)}/ruby-#{version}.tar.xz"

  $logger.info "Downloading #{url}"
  sha256 = Digest::SHA256.hexdigest(http_get(url))
  abort "SHA256 mismatch for #{version}: releases.yml says #{expected}, tarball is #{sha256}" unless sha256 == expected

  sha256
end

# A new Ruby uses the same Rails app as the newest Ruby in its series, or as the newest Ruby overall for a new series.
def add_ruby(version, sha256)
  rubies        = JSON.parse(File.read(RUBIES_PATH)).sort_by { |ruby| Gem::Version.new(ruby['version']) }
  same_series   = rubies.select { |ruby| series(ruby['version']) == series(version) }
  rails_version = (same_series.last || rubies.last)['rails']
  rubies << { 'version' => version, 'sha256' => sha256, 'rails' => rails_version }

  write_rubies(rubies)
end

# Sorted by version with one Ruby per line, so every new release is a one line diff.
def write_rubies(rubies)
  lines = rubies.sort_by { |ruby| Gem::Version.new(ruby['version']) }.map { |ruby| "  #{JSON.generate(ruby)}" }

  File.write(RUBIES_PATH, "[\n#{lines.join(",\n")}\n]\n")
end

# CHANGELOG.md split at every `## ` heading: the header, the `## [Unreleased]` section, and the releases.
def changelog_sections
  header, unreleased, *released = File.read(CHANGELOG_PATH).split(/^(?=## )/)
  abort "CHANGELOG.md has no `#{UNRELEASED}` section at the top" unless unreleased&.start_with?(UNRELEASED)

  [header, unreleased, released]
end

def write_changelog(header, unreleased, released)
  File.write(CHANGELOG_PATH, [header, unreleased, *released].join)
end

# Adds the entry at the top of `### Added` under `## [Unreleased]`.
def add_to_changelog(entry)
  header, unreleased, released = changelog_sections
  unless unreleased.include?("### Added\n")
    unreleased = unreleased.sub(/\A#{Regexp.escape(UNRELEASED)}\n+/, "#{UNRELEASED}\n\n### Added\n\n")
  end

  write_changelog(header, unreleased.sub("### Added\n", "### Added\n#{entry}\n"), released)
end

# A release is new when we build its series, and it is newer than the newest Ruby we have in that series.
# A series we have no Rubies for yet gets all of its releases.
def new_release?(version, known_versions)
  return false unless SUPPORTED_SERIES.include?(series(version))

  same_series = known_versions.select { |known| series(known) == series(version) }
  return true if same_series.empty?

  newest = same_series.max_by { |known| Gem::Version.new(known) }
  Gem::Version.new(version) > Gem::Version.new(newest)
end

# Adds new Ruby releases to rubies.json and CHANGELOG.md, and returns the added versions.
def add_new_releases
  known_versions = JSON.parse(File.read(RUBIES_PATH)).map { |ruby| ruby['version'] }
  new_releases   = ruby_releases.select { |release| new_release?(release['version'], known_versions) }

  new_releases.sort_by { |release| Gem::Version.new(release['version']) }.map do |release|
    version = release['version']
    $logger.info "New Ruby release: #{version}"

    add_ruby(version, verified_sha256(release))
    add_to_changelog(changelog_entry(release))
    version
  end
end

# True only when the `## [Unreleased]` CHANGELOG section has a new Ruby in it, and rubies.json/CHANGELOG.md
# have been quiet for RELEASE_QUIET_MINUTES, so a batch of Ruby releases ships together.
# Other changes under `## [Unreleased]` never trigger a release, they ship along with the next new Ruby.
def releasable?
  _, unreleased, = changelog_sections

  unless unreleased.match?(NEW_RUBY_ENTRY)
    $logger.info 'No new Rubies under `## [Unreleased]` in CHANGELOG.md'
    return false
  end

  quiet_minutes = Integer(ENV.fetch('RELEASE_QUIET_MINUTES', '20'))
  _, last_change, = git('log', '-1', '--format=%ct', '--', RUBIES_PATH, CHANGELOG_PATH)
  waited = ((Time.now - Time.at(Integer(last_change))) / 60).floor

  if waited < quiet_minutes
    $logger.info "Last change was #{waited} minutes ago, waiting for #{quiet_minutes}"
    return false
  end

  true
end

def next_version
  _, tags, = git('tag', '--list', 'v*')
  latest   = tags.split.grep(/\Av\d+\z/).map { |tag| tag.delete_prefix('v').to_i }.max
  abort 'No vXXXX tags found, run `git fetch --tags`' unless latest

  latest + 1
end

# Turns `## [Unreleased]` into `## [XXXX] YYYY-MM-DD`, so the tagged commit has no `## [Unreleased]`.
def date_unreleased_section(version)
  header, unreleased, released = changelog_sections
  dated = unreleased.sub(UNRELEASED, "## [#{version}] #{Date.today.iso8601}")

  write_changelog(header, dated, released)
end

# Adds a new empty `## [Unreleased]` above the newest release, after it has been tagged.
def add_unreleased_section
  header, *released = File.read(CHANGELOG_PATH).split(/^(?=## )/)

  write_changelog(header, "#{UNRELEASED}\n\n", released)
end

def dry_run?
  !ENV['DRY_RUN'].nil?
end

# Commits and tags as the bot, unsigned, whatever the local git config says.
def git(*args)
  run_command([
    'git',
    '-c', 'user.name=Grubruby Release Bot',
    '-c', 'user.email=git@kaspergrubbe.com',
    '-c', 'commit.gpgsign=false',
    '-c', 'tag.gpgsign=false',
    *args
  ].shelljoin)
end

# Pushes the checked out commit (and tag) to master, rejected if master has moved since Buildkite checked it out.
def push(tag = nil)
  args = ['push', '--atomic', 'origin', 'HEAD:master', tag].compact

  if dry_run?
    $logger.info "DRY_RUN: would run git #{args.join(' ')}"
  else
    git(*args)
  end
end

# Loads the deploy key from Buildkite Secrets into an in-memory ssh-agent, never onto disk.
def with_deploy_key
  return yield if dry_run?

  _, agent, = run_command('ssh-agent -s')
  ENV.update(agent.scan(/(SSH_AUTH_SOCK|SSH_AGENT_PID)=([^;]+);/).to_h)
  agent_pid = Integer(ENV['SSH_AGENT_PID'])

  # Not run_command, it logs stdout with DEBUG=1, and stdout is the private key.
  key, status = Open3.capture2('buildkite-agent', 'secret', 'get', 'GRUBRUBY_DEPLOY_KEY')
  abort 'Could not read the GRUBRUBY_DEPLOY_KEY secret' unless status.success?
  run_command('ssh-add -', key)

  yield
ensure
  Process.kill('TERM', agent_pid) if agent_pid
end

with_deploy_key do
  unless dry_run?
    git('remote', 'set-url', 'origin', REMOTE)
    git('fetch', '--tags', '--force', 'origin')
  end

  added = add_new_releases
  if added.any?
    git('commit', '--quiet', '-m', "Add Ruby #{added.join(', ')}", '--', RUBIES_PATH, CHANGELOG_PATH)
    push
  end

  if releasable?
    version = next_version
    tag     = "v#{version}"

    date_unreleased_section(version)
    git('commit', '--quiet', '-m', "Update for #{version}", '--', CHANGELOG_PATH)
    git('tag', '--annotate', '--message', tag, tag)

    # [skip ci], Buildkite has nothing to build for an empty changelog section, the tag builds the release.
    add_unreleased_section
    git('commit', '--quiet', '-m', 'Add [Unreleased] to CHANGELOG.md [skip ci]', '--', CHANGELOG_PATH)
    push(tag)
  end
end
