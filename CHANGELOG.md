# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Added Ruby 2.6.1, which includes a few bugfixes, https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/ [#13](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/13)

## [8008] - 2018-01-04

Grubruby version `8008` ships with:
- Rubygems `3.0.2`.
- Bundler `2.0.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8008`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8008`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8008`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8008`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8008`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8008`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8008`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8008`.

### Changed
- Updated Bundler to version `2.0.1` (from `1.7.3`), which is a major release, https://github.com/bundler/bundler/releases/tag/v2.0.0 and https://github.com/bundler/bundler/releases/tag/v2.0.1, [#11](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/11).
- Updated Rubygems to version `3.0.2` (from `3.0.1`), which is a minor release which includes minor enhancements and bug fixes, http://blog.rubygems.org/2019/01/01/3.0.2-released.html, [#12](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/12).

## [8007] - 2018-12-27

Grubruby version `8007` ships with:
- Rubygems `3.0.1`.
- Bundler `1.17.3`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8007`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8007`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8007`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8007`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8007`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8007`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8007`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8007`.

### Added
- Let `build.rb` write the tag for the image being built. [#8](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/8)
- When `build.rb` isn't pushing the local tag will have the format of `#{grubruby_reponame}.local:#{image_version}`. [#8](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/8)
- Added Ruby 2.6.0!!! [#10](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/10)

### Changed
- Updated Rubygems to version `3.0.1` (from `3.0.0`), which is a minor release, with a few fixes: https://blog.rubygems.org/2018/12/23/3.0.1-released.html, [#7](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/7) [@kaspergrubbe](https://github.com/kaspergrubbe).
- Updated Bundler to version `1.7.3` (from `1.7.2`), which is a minor release, with a few fixes: https://github.com/bundler/bundler/releases/v1.17.3, [#9](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/9).

## [8006] - 2018-12-19

Grubruby version `8006` ships with:
- Rubygems `3.0.0`.
- Bundler `1.17.2`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8006`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8006`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8006`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8006`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8006`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8006`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8006`.

### Changed
- Updated Rubygems to version `3.0.0` (from `2.7.8`), which is a major release, with lots of changes: https://blog.rubygems.org/2018/12/19/3.0.0-released.html

## [8005] - 2018-12-11
Grubruby version `8005` ships with:
- Rubygems `2.7.8`.
- Bundler `1.17.2`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8005`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8005`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8005`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8005`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8005`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8005`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8005`.

### Changed
- Updated Bundler to version `1.17.2`, which is a small release that adds compatibility for bundler merge with Ruby 2.6: https://github.com/bundler/bundler/blob/master/CHANGELOG.md#1172-2018-12-11, [#4](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/4) [@kaspergrubbe](https://github.com/kaspergrubbe).

## [8004] - 2018-11-2
Grubruby version `8004` ships with:
- Rubygems `2.7.8`.
- Bundler `1.17.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8004`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8004`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8004`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8004`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8004`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8004`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8004`.

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
