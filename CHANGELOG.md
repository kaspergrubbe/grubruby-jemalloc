# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]
N/A

## [8004] - 2018-11-2
### Changed
- Updated Rubygems to version `2.7.8`, which includes some minor enhancements and bug-fixes: http://blog.rubygems.org/2018/11/02/2.7.8-released.html,  [#4](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/4) [@kaspergrubbe](https://github.com/kaspergrubbe).

## [8003] - 2018-10-26
Grubruby version `8003` ships with:
- Rubygems `2.7.7`.
- Bundler `1.17.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8003`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8003`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8003`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8003`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8003`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8003`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8003`.

### Changed
- Updated Bundler to version `1.17.1` to prevent some path issues introduced in version `1.17.0`, https://github.com/bundler/bundler/releases/v1.17.1

## [8002] - 2018-10-25
Grubruby version `8002` ships with:
- Rubygems `2.7.7`.
- Bundler `1.17.0`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `Ruby 2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8002`.
- `Ruby 2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8002`.
- `Ruby 2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8002`.
- `Ruby 2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8002`.
- `Ruby 2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8002`.
- `Ruby 2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8002`.
- `Ruby 2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8002`.

### Changed
- Updated `Bundler` to newest version of `1.17.0` (from `1.16.6`).

### Added
- Added tool in `tools/ruby_sha256.rb` to download and calculate SHA256 hash for Ruby releases.
- Added tool in `tools/build.rb` that builds all the supported Ruby versions and pushes them to Dockerhub.
- Added Dockerfile for Ruby-2.3.

## [8001] - 2018-10-11
Grubruby version `8001` ships with:
- Rubygems `2.7.7`.
- Bundler `1.16.6`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

### Added
- Added `Ruby 2.4.4.8001` and `Ruby 2.5.1.8001` images.
- All images now include `Rubygems 2.7.7` and `Bundler 1.16.6`.
- All images ships with `jemalloc` version `3.6.0`, `4.5.0` and `5.1.0`.
- All images ships with `thpoff`.
