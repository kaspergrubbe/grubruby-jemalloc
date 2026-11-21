# Prints the GitHub release notes for VERSION=vXXXX: its CHANGELOG section and what it ships with.

require_relative 'vars'
require_relative 'helpers'

def push?
  true
end

puts changelog_section(@grubruby.version) || abort("No `## [#{@grubruby.version}]` section in CHANGELOG.md")
puts
puts "## #{shipped_with(@grubruby, @supported_versions)}"
