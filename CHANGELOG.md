# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Upgraded Bundler to version: `2.1.0` which turns on deprecations for upcoming breaking changes in bundler 3 by default. https://github.com/bundler/bundler/releases/tag/v2.1.0 [#26](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/26)

## [8017] - 2019-10-01

Grubruby version `8017` ships with:
- Rubygems `3.0.6`.
- Bundler `2.0.2`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8017`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8017`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8017`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8017`.
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.8017`.
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.8017`.
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.8017`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8017`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8017`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8017`.
- `2.5.4` as `kaspergrubbe/grubruby-jemalloc:2.5.4.8017`.
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.8017`.
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.8017`.
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.8017`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8017`.
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.8017`.
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.8017`.
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.8017`.
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.8017`.
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.8017`.

### Added
- Added Ruby versions: `2.4.8`, `2.5.7` and `2.6.5` which fixes multiple vulnerabilites, https://www.ruby-lang.org/en/news/2019/10/01/ruby-2-4-8-released/ https://www.ruby-lang.org/en/news/2019/10/01/ruby-2-5-7-released/ https://www.ruby-lang.org/en/news/2019/10/01/ruby-2-6-5-released/
  - CVE-2019-16255: A code injection vulnerability of Shell#[] and Shell#test
  - CVE-2019-16254: HTTP response splitting in WEBrick (Additional fix)
  - CVE-2019-15845: A NUL injection vulnerability of File.fnmatch and File.fnmatch
  - CVE-2019-16201: Regular Expression Denial of Service vulnerability of WEBrick’s Digest access authentication

## [8016] - 2019-08-29

### Added
- Added Ruby versions: `2.4.7`, `2.5.6` and `2.6.4` which fixes multiple jQuery vulnerabilites in RDoc: https://www.ruby-lang.org/en/news/2019/08/28/multiple-jquery-vulnerabilities-in-rdoc/ [#24](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/24)

### Changed
- Update Rubygems to version `3.0.6` (from version `3.0.4`), it includes minor enhancements and bug fixes, https://blog.rubygems.org/2019/08/16/3.0.5-released.html and https://blog.rubygems.org/2019/08/16/3.0.6-released.html [#23](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/23)

## [8015] - 2019-08-06

### Changed
- Updated Jemalloc from version `5.2.0` to `5.2.1`, it includes a few bugfixes: https://github.com/jemalloc/jemalloc/releases/tag/5.2.1 [#21](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/21)
- Update Rubygems to version `3.0.4` (from version `3.0.3`), it includes minor enhancements and bug fixes, https://blog.rubygems.org/2019/06/14/3.0.4-released.html [#22](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/22)

## [8014] - 2019-06-13

Grubruby version `8014` ships with:
- Rubygems `3.0.3`.
- Bundler `2.0.2`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8014`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8014`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8014`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8014`.
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.8014`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8014`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8014`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8014`.
- `2.5.4` as `kaspergrubbe/grubruby-jemalloc:2.5.4.8014`.
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.8014`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8014`.
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.8014`.
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.8014`.
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.8014`.

### Changed
- Updated Bundler from version `2.0.1` to version `2.0.2`, this release includes lots of fixes but also getting rid of Ruby 1.x compatibility code, all changes are described here: https://github.com/bundler/bundler/releases/tag/v2.0.2 [#19](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/19)
- Updated Jemalloc 5 from version `5.1.0` to version `5.2.0`, release notes here: https://github.com/jemalloc/jemalloc/releases/tag/5.2.0 [#20](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/20)

## [8013] - 2019-04-17

### Added
- Added Ruby `2.4.6` this release includes about 20 bug fixes after the previous release, and also includes several security fixes. https://www.ruby-lang.org/en/news/2019/04/01/ruby-2-4-6-released/ [#18](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/18)
- Added Ruby `2.6.3` this release adds support for New Japanese Era “令和” (Reiwa), it updates the Unicode version to 12.1 beta, and updates date library. https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/ [#17](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/17)

## [8012] - 2019-03-15

### Added
- Added Ruby `2.5.5` that includes a one-line fix to `2.5.4` that caused deadlock issues for multi-thread+multi-process (using Process.fork) programs like Puma, https://www.ruby-lang.org/en/news/2019/03/15/ruby-2-5-5-released/ [#16](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/16)

## [8011] - 2019-03-13

Grubruby version `8011` ships with:
- Rubygems `3.0.3`.
- Bundler `2.0.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8011`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8011`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8011`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8011`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8011`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8011`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8011`.
- `2.5.4` as `kaspergrubbe/grubruby-jemalloc:2.5.4.8011`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8011`.
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.8011`.
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.8011`.

### Added
- Added Ruby 2.5.4 and 2.6.2 that was released due to some security issues found in Rubygems, more information about that here: https://www.ruby-lang.org/en/news/2019/03/05/multiple-vulnerabilities-in-rubygems/ and here is the individual Ruby release announcements: https://www.ruby-lang.org/en/news/2019/03/13/ruby-2-5-4-released/ and https://www.ruby-lang.org/en/news/2019/03/13/ruby-2-6-2-released/ [#15](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/15)

## [8010] - 2019-03-06

Grubruby version `8010` ships with:
- Rubygems `3.0.3`.
- Bundler `2.0.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.1.0`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8010`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8010`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8010`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8010`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8010`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8010`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8010`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8010`.
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.8010`.

## Changed

- Updated Rubygems to version 3.0.3 (from 3.0.2) because of multiple security fixes that have been fixed, more here: http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html [#14](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/14)

## [8009] - 2019-01-31

### Added
- Added Ruby 2.6.1, which includes a few bugfixes, https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/ [#13](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/13)

## [8008] - 2019-01-04

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
