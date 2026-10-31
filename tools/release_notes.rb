# Prints the GitHub release notes for VERSION=vXXXX: its CHANGELOG section and what it ships with.

require_relative 'vars'
require_relative 'helpers'

def changelog_section(version)
  sections = File.read('CHANGELOG.md').split(/^(?=## )/)
  section  = sections.find { |s| s.start_with?("## [#{version}]") } or abort "No `## [#{version}]` section in CHANGELOG.md"

  section.lines.drop(1).join.strip
end

def push?
  true
end

puts changelog_section(@grubruby.version)
puts
puts "## #{shipped_with(@grubruby, @supported_versions)}"
