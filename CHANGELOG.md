# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]
### Changed
- Updated `Bundler` to newest version of `1.17.0` (from `1.16.6`).
### Added
- Added tool in `tools/ruby_sha256.rb` to download and calculate SHA256 hash for Ruby releases.
- Added tool in `tools/build.rb` that builds all the supported Ruby versions and pushes them to Dockerhub.
- Added Dockerfile for Ruby-2.3.

## [8001] - 2018-10-11
### Added
- Added `Ruby 2.4.4.8001` and `Ruby 2.5.1.8001` images.
- All images now include `Rubygems 2.7.7` and `Bundler 1.16.6`.
- All images ships with `jemalloc` version `3.6.0`, `4.5.0` and `5.1.0`.
- All images ships with `thpoff`.
