# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

N/A

## [9039] 2025-12-25

### Added
- Added Ruby 4.0.0, happy holidays! https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released/

### Changed
- Updated Bundler to `4.0.3` (from `2.7.2`), https://github.com/rubygems/rubygems/blob/bundler-v4.0.3/bundler/CHANGELOG.md
- Updated Rubygems to `4.0.3` (from `3.7.2`), https://github.com/rubygems/rubygems/blob/v4.0.3/CHANGELOG.md

### Removed
- Removed Ruby 3.4.0, something in it breaks compilation of the pg-gem which we rely on for testing.

## [9038] 2025-12-21

### Added
- Added Ruby 3.4.8, https://github.com/ruby/ruby/releases/tag/v3_4_8

## [9037] 2025-10-31

### Added
- Added Ruby 3.4.7, https://www.ruby-lang.org/en/news/2025/10/07/ruby-3-4-7-released/
- Added Ruby 3.3.10, https://www.ruby-lang.org/en/news/2025/10/23/ruby-3-3-10-released/

## [9036] 2025-07-17

### Added
- Added Ruby 3.4.6, https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
- Added Ruby 3.3.9, https://www.ruby-lang.org/en/news/2025/07/24/ruby-3-3-9-released/
- Added Ruby 3.2.9, https://www.ruby-lang.org/en/news/2025/07/24/ruby-3-2-9-released/

### Changed
- Updated Rubygems to `3.7.2` (from `3.7.0`), https://github.com/rubygems/rubygems/blob/v3.7.2/CHANGELOG.md
- Updated Bundler to `2.7.2` (from `2.7.0`), https://github.com/rubygems/rubygems/blob/bundler-v2.7.0/bundler/CHANGELOG.md

## [9035] 2025-07-17

Grubruby version `9035` ships with:
- Rubygems `3.7.0`.
- Bundler `2.7.0`.
- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.4.5` as `kaspergrubbe/grubruby-jemalloc:3.4.5.9035` (220.12 MB).
- `3.4.4` as `kaspergrubbe/grubruby-jemalloc:3.4.4.9035` (220.09 MB).
- `3.4.3` as `kaspergrubbe/grubruby-jemalloc:3.4.3.9035` (220.06 MB).
- `3.4.2` as `kaspergrubbe/grubruby-jemalloc:3.4.2.9035` (220.03 MB).
- `3.4.1` as `kaspergrubbe/grubruby-jemalloc:3.4.1.9035` (220.0 MB).
- `3.4.0` as `kaspergrubbe/grubruby-jemalloc:3.4.0.9035` (220.03 MB).
- `3.3.8` as `kaspergrubbe/grubruby-jemalloc:3.3.8.9035` (212.13 MB).
- `3.3.7` as `kaspergrubbe/grubruby-jemalloc:3.3.7.9035` (212.06 MB).
- `3.3.6` as `kaspergrubbe/grubruby-jemalloc:3.3.6.9035` (212.05 MB).
- `3.3.5` as `kaspergrubbe/grubruby-jemalloc:3.3.5.9035` (212.0 MB).
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9035` (211.97 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9035` (206.22 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9035` (206.22 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9035` (206.06 MB).
- `3.2.8` as `kaspergrubbe/grubruby-jemalloc:3.2.8.9035` (209.65 MB).
- `3.2.7` as `kaspergrubbe/grubruby-jemalloc:3.2.7.9035` (209.65 MB).
- `3.2.6` as `kaspergrubbe/grubruby-jemalloc:3.2.6.9035` (209.61 MB).
- `3.2.5` as `kaspergrubbe/grubruby-jemalloc:3.2.5.9035` (204.45 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9035` (204.33 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9035` (204.32 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9035` (204.21 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9035` (204.19 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9035` (204.25 MB).

### Added
- Added Ruby 3.4.5, https://www.ruby-lang.org/en/news/2025/07/15/ruby-3-4-5-released/

### Changed
- Updated Rubygems to `3.7.0` (from `3.6.9`), https://github.com/rubygems/rubygems/blob/v3.7.0/CHANGELOG.md
- Updated Bundler to `2.7.0` (from `2.6.9`), https://github.com/rubygems/rubygems/blob/bundler-v2.6.9/bundler/CHANGELOG.md

### Removed
- Removed Ruby `3.1.*`
  - Bundler and Rubygems kills support for Ruby 3.1.0 with their newest release, https://github.com/rubygems/rubygems/pull/8634

## [9034] 2025-05-15

Grubruby version `9034` ships with:
- Rubygems `3.6.9`.
- Bundler `2.6.9`.
- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.4.4` as `kaspergrubbe/grubruby-jemalloc:3.4.4.9034` (220.07 MB).
- `3.4.3` as `kaspergrubbe/grubruby-jemalloc:3.4.3.9034` (220.04 MB).
- `3.4.2` as `kaspergrubbe/grubruby-jemalloc:3.4.2.9034` (220.01 MB).
- `3.4.1` as `kaspergrubbe/grubruby-jemalloc:3.4.1.9034` (219.98 MB).
- `3.4.0` as `kaspergrubbe/grubruby-jemalloc:3.4.0.9034` (220.01 MB).
- `3.3.8` as `kaspergrubbe/grubruby-jemalloc:3.3.8.9034` (212.11 MB).
- `3.3.7` as `kaspergrubbe/grubruby-jemalloc:3.3.7.9034` (212.04 MB).
- `3.3.6` as `kaspergrubbe/grubruby-jemalloc:3.3.6.9034` (212.03 MB).
- `3.3.5` as `kaspergrubbe/grubruby-jemalloc:3.3.5.9034` (211.98 MB).
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9034` (211.95 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9034` (206.2 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9034` (206.19 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9034` (206.03 MB).
- `3.2.8` as `kaspergrubbe/grubruby-jemalloc:3.2.8.9034` (209.63 MB).
- `3.2.7` as `kaspergrubbe/grubruby-jemalloc:3.2.7.9034` (209.62 MB).
- `3.2.6` as `kaspergrubbe/grubruby-jemalloc:3.2.6.9034` (209.59 MB).
- `3.2.5` as `kaspergrubbe/grubruby-jemalloc:3.2.5.9034` (204.43 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9034` (204.31 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9034` (204.29 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9034` (204.19 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9034` (204.17 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9034` (204.23 MB).
- `3.1.7` as `kaspergrubbe/grubruby-jemalloc:3.1.7.9034` (203.89 MB).
- `3.1.6` as `kaspergrubbe/grubruby-jemalloc:3.1.6.9034` (204.28 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9034` (204.28 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9034` (204.22 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9034` (204.22 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9034` (226.76 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9034` (226.76 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9034` (225.26 MB).

### Added
- Added Ruby 3.4.4, https://www.ruby-lang.org/en/news/2025/05/14/ruby-3-4-4-released/

### Changed
- Updated Rubygems to `3.6.9` (from `3.6.8`), https://github.com/rubygems/rubygems/blob/v3.6.9/CHANGELOG.md
- Updated Bundler to `2.6.9` (from `2.6.8`), https://github.com/rubygems/rubygems/blob/bundler-v2.6.9/bundler/CHANGELOG.md

## [9033] 2025-04-18

Grubruby version `9033` ships with:
- Rubygems `3.6.8`.
- Bundler `2.6.8`.
- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.4.3` as `kaspergrubbe/grubruby-jemalloc:3.4.3.9033` (227.42 MB).
- `3.4.2` as `kaspergrubbe/grubruby-jemalloc:3.4.2.9033` (227.39 MB).
- `3.4.1` as `kaspergrubbe/grubruby-jemalloc:3.4.1.9033` (227.36 MB).
- `3.4.0` as `kaspergrubbe/grubruby-jemalloc:3.4.0.9033` (227.39 MB).
- `3.3.8` as `kaspergrubbe/grubruby-jemalloc:3.3.8.9033` (219.49 MB).
- `3.3.7` as `kaspergrubbe/grubruby-jemalloc:3.3.7.9033` (219.42 MB).
- `3.3.6` as `kaspergrubbe/grubruby-jemalloc:3.3.6.9033` (219.41 MB).
- `3.3.5` as `kaspergrubbe/grubruby-jemalloc:3.3.5.9033` (219.36 MB).
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9033` (219.33 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9033` (213.58 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9033` (213.58 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9033` (213.42 MB).
- `3.2.8` as `kaspergrubbe/grubruby-jemalloc:3.2.8.9033` (217.01 MB).
- `3.2.7` as `kaspergrubbe/grubruby-jemalloc:3.2.7.9033` (217.01 MB).
- `3.2.6` as `kaspergrubbe/grubruby-jemalloc:3.2.6.9033` (216.97 MB).
- `3.2.5` as `kaspergrubbe/grubruby-jemalloc:3.2.5.9033` (211.81 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9033` (211.69 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9033` (211.68 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9033` (211.57 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9033` (211.55 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9033` (211.61 MB).
- `3.1.7` as `kaspergrubbe/grubruby-jemalloc:3.1.7.9033` (211.27 MB).
- `3.1.6` as `kaspergrubbe/grubruby-jemalloc:3.1.6.9033` (211.66 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9033` (211.66 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9033` (211.6 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9033` (211.61 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9033` (233.96 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9033` (233.96 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9033` (232.45 MB).

### Added
- Added Ruby 3.4.3, https://www.ruby-lang.org/en/news/2025/04/14/ruby-3-4-3-released/
- Added Ruby 3.4.2, https://www.ruby-lang.org/en/news/2025/02/14/ruby-3-4-2-released/
- Added Ruby 3.3.8, https://www.ruby-lang.org/en/news/2025/04/09/ruby-3-3-8-released/
- Added Ruby 3.3.7, https://www.ruby-lang.org/en/news/2025/01/15/ruby-3-3-7-released/
- Added Ruby 3.2.8, https://www.ruby-lang.org/en/news/2025/03/26/ruby-3-2-8-released/
- Added Ruby 3.2.7, https://www.ruby-lang.org/en/news/2025/02/04/ruby-3-2-7-released/

### Changed
- Updated Rubygems to `3.6.8` (from `3.6.2`), https://github.com/rubygems/rubygems/blob/v3.6.8/CHANGELOG.md
- Updated Bundler to `2.6.8` (from `2.6.2`), https://github.com/rubygems/rubygems/blob/bundler-v2.6.8/bundler/CHANGELOG.md

## [9031] 2024-12-26

Grubruby version `9031` ships with:
- Rubygems `3.6.2`.
- Bundler `2.6.2`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.4.1` as `kaspergrubbe/grubruby-jemalloc:3.4.1.9031` (212.22 MB).
- `3.4.0` as `kaspergrubbe/grubruby-jemalloc:3.4.0.9031` (212.26 MB).
- `3.3.6` as `kaspergrubbe/grubruby-jemalloc:3.3.6.9031` (211.9 MB).
- `3.3.5` as `kaspergrubbe/grubruby-jemalloc:3.3.5.9031` (211.85 MB).
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9031` (211.82 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9031` (206.07 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9031` (206.06 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9031` (205.91 MB).
- `3.2.6` as `kaspergrubbe/grubruby-jemalloc:3.2.6.9031` (209.46 MB).
- `3.2.5` as `kaspergrubbe/grubruby-jemalloc:3.2.5.9031` (204.3 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9031` (204.18 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9031` (204.17 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9031` (204.06 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9031` (204.04 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9031` (204.1 MB).
- `3.1.6` as `kaspergrubbe/grubruby-jemalloc:3.1.6.9031` (204.15 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9031` (204.15 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9031` (204.09 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9031` (204.1 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9031` (225.84 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9031` (225.84 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9031` (224.33 MB).

### Added
- Added Ruby `3.4.0`, a major release with lots of exciting changes! https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-0-released/
- Added Ruby `3.4.1`, a minor release that fixes the version output! https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/

### Removed
- Ruby `3.0.*` have been removed as they are no longer supported, this also mean that we can get rid of Debian Bullseye images.

### Changed
- Updated Rubygems to `3.6.2` (from `3.5.23`), https://github.com/rubygems/rubygems/blob/v3.6.2/CHANGELOG.md
- Updated Bundler to `2.6.2` (from `2.5.23`), https://github.com/rubygems/rubygems/blob/bundler-v2.6.2/bundler/CHANGELOG.md

## [9030] 2024-11-07

Grubruby version `9030` ships with:
- Rubygems `3.5.23`.
- Bundler `2.5.23`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.3.6` as `kaspergrubbe/grubruby-jemalloc:3.3.6.9030` (218.3 MB).
- `3.3.5` as `kaspergrubbe/grubruby-jemalloc:3.3.5.9030` (218.25 MB).
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9030` (218.22 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9030` (212.47 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9030` (212.47 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9030` (212.31 MB).

- `3.2.6` as `kaspergrubbe/grubruby-jemalloc:3.2.6.9030` (215.86 MB).
- `3.2.5` as `kaspergrubbe/grubruby-jemalloc:3.2.5.9030` (210.7 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9030` (210.58 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9030` (210.57 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9030` (210.46 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9030` (210.44 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9030` (210.5 MB).

- `3.1.6` as `kaspergrubbe/grubruby-jemalloc:3.1.6.9030` (210.55 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9030` (210.55 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9030` (210.49 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9030` (210.5 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9030` (232.01 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9030` (232.01 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9030` (230.5 MB).

- `3.0.7` as `kaspergrubbe/grubruby-jemalloc:3.0.7.9030` (279.13 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9030` (279.13 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9030` (279.13 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9030` (279.11 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9030` (279.09 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9030` (278.31 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9030` (278.28 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9030` (277.89 MB).

### Added
- Added Ruby `3.3.6`, a minor release with bugfixes! https://www.ruby-lang.org/en/news/2024/11/05/ruby-3-3-6-released/
- Added Ruby `3.2.6`, a minor release with bugfixes! https://www.ruby-lang.org/en/news/2024/10/30/ruby-3-2-6-released/

### Changed
- Updated Rubygems to `3.5.23` (from `3.5.18`), https://github.com/rubygems/rubygems/blob/v3.5.23/CHANGELOG.md
- Updated Bundler to `2.5.23` (from `2.5.18`), https://github.com/rubygems/rubygems/blob/bundler-v2.5.23/bundler/CHANGELOG.md

## [9029] 2024-09-04

Grubruby version `9029` ships with:
- Rubygems `3.5.18`.
- Bundler `2.5.18`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.3.5` as `kaspergrubbe/grubruby-jemalloc:3.3.5.9029` (246.91 MB).
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9029` (246.88 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9029` (241.12 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9029` (241.12 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9029` (240.96 MB).
- `3.2.5` as `kaspergrubbe/grubruby-jemalloc:3.2.5.9029` (239.36 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9029` (239.23 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9029` (239.22 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9029` (239.11 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9029` (239.1 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9029` (239.16 MB).
- `3.1.6` as `kaspergrubbe/grubruby-jemalloc:3.1.6.9029` (239.21 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9029` (239.21 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9029` (239.15 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9029` (239.15 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9029` (260.32 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9029` (260.32 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9029` (258.81 MB).
- `3.0.7` as `kaspergrubbe/grubruby-jemalloc:3.0.7.9029` (295.24 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9029` (295.24 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9029` (295.24 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9029` (295.22 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9029` (295.2 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9029` (294.42 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9029` (294.39 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9029` (294.0 MB).

### Added
- Added Ruby `3.3.5`, a minor release with bugfixes! https://www.ruby-lang.org/en/news/2024/09/03/3-3-5-released/

### Changed
- Updated Rubygems to `3.5.18` (from `3.5.16`), https://github.com/rubygems/rubygems/blob/v3.5.18/CHANGELOG.md
- Updated Bundler to `2.5.18` (from `2.5.16`), https://github.com/rubygems/rubygems/blob/bundler-v2.5.18/bundler/CHANGELOG.md

## [9028] 2024-07-26

Grubruby version `9028` ships with:
- Rubygems `3.5.16`.
- Bundler `2.5.16`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9027` (246.86 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9027` (241.11 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9027` (241.11 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9027` (240.95 MB).
- `3.2.5` as `kaspergrubbe/grubruby-jemalloc:3.2.5.9027` (239.34 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9027` (239.22 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9027` (239.21 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9027` (239.1 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9027` (239.09 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9027` (239.14 MB).
- `3.1.6` as `kaspergrubbe/grubruby-jemalloc:3.1.6.9027` (239.19 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9027` (239.19 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9027` (239.14 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9027` (239.14 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9027` (260.12 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9027` (260.12 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9027` (258.61 MB).
- `3.0.7` as `kaspergrubbe/grubruby-jemalloc:3.0.7.9027` (295.03 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9027` (295.03 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9027` (295.03 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9027` (295.02 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9027` (294.99 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9027` (294.22 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9027` (294.19 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9027` (293.8 MB).

### Added
- Added Ruby `3.2.5`! https://www.ruby-lang.org/en/news/2024/07/26/ruby-3-2-5-released/

### Changed
- Updated Rubygems to `3.5.16` (from `3.5.15`), https://github.com/rubygems/rubygems/blob/v3.5.16/CHANGELOG.md
- Updated Bundler to `2.5.16` (from `2.5.15`), https://github.com/rubygems/rubygems/blob/bundler-v2.5.16/bundler/CHANGELOG.md

## [9027] 2024-07-18

Grubruby version `9027` ships with:
- Rubygems `3.5.15`.
- Bundler `2.5.15`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.3.4` as `kaspergrubbe/grubruby-jemalloc:3.3.4.9027` (246.85 MB).
- `3.3.3` as `kaspergrubbe/grubruby-jemalloc:3.3.3.9027` (241.1 MB).
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9027` (241.1 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9027` (240.94 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9027` (239.21 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9027` (239.2 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9027` (239.09 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9027` (239.08 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9027` (239.13 MB).
- `3.1.6` as `kaspergrubbe/grubruby-jemalloc:3.1.6.9027` (239.18 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9027` (239.18 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9027` (239.13 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9027` (239.13 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9027` (260.06 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9027` (260.06 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9027` (258.55 MB).
- `3.0.7` as `kaspergrubbe/grubruby-jemalloc:3.0.7.9027` (294.98 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9027` (294.98 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9027` (294.98 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9027` (294.96 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9027` (294.94 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9027` (294.16 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9027` (294.13 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9027` (293.74 MB).

### Added
- Added Ruby `3.3.3`! https://www.ruby-lang.org/en/news/2024/06/12/ruby-3-3-3-released/
- Added Ruby `3.3.4`! https://www.ruby-lang.org/en/news/2024/07/09/ruby-3-3-4-released/

### Changed
- Updated Rubygems to `3.5.15` (from `3.5.9`), https://github.com/rubygems/rubygems/blob/v3.5.15/CHANGELOG.md
- Updated Bundler to `2.5.15` (from `2.5.9`), https://github.com/rubygems/rubygems/blob/bundler-v2.5.15/bundler/CHANGELOG.md

## [9026] 2024-04-23

Grubruby version `9026` ships with:
- Rubygems `3.5.9`.
- Bundler `2.5.9`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.3.1` as `kaspergrubbe/grubruby-jemalloc:3.3.1.9026` (233.63 MB).
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9026` (240.86 MB).
- `3.2.4` as `kaspergrubbe/grubruby-jemalloc:3.2.4.9026` (239.13 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9026` (239.12 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9026` (239.01 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9026` (238.99 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9026` (239.05 MB).
- `3.1.5` as `kaspergrubbe/grubruby-jemalloc:3.1.5.9026` (239.1 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9026` (239.04 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9026` (239.05 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9026` (259.5 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9026` (259.5 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9026` (257.99 MB).
- `3.0.7` as `kaspergrubbe/grubruby-jemalloc:3.0.7.9026` (290.58 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9026` (290.58 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9026` (290.58 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9026` (290.56 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9026` (290.54 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9026` (289.76 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9026` (289.73 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9026` (289.34 MB).

### Added
- Added Ruby `3.3.1`! https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/
- Added Ruby `3.2.4`! https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-2-4-released/
- Added Ruby `3.1.5`! https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-1-5-released/
- Added Ruby `3.0.7`! https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-0-7-released/

### Changed
- Updated Rubygems to `3.5.9` (from `3.5.6`), https://github.com/rubygems/rubygems/blob/v3.5.9/CHANGELOG.md
- Updated Bundler to `2.5.9` (from `2.5.6`), https://github.com/rubygems/rubygems/blob/bundler-v2.5.9/bundler/CHANGELOG.md

## [9025] 2024-01-27

Grubruby version `9025` ships with:
- Rubygems `3.5.6`.
- Bundler `2.5.6`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9025` (234.31 MB).
- `3.2.3` as `kaspergrubbe/grubruby-jemalloc:3.2.3.9025` (232.57 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9025` (232.46 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9025` (232.45 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9025` (232.51 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9025` (232.5 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9025` (232.5 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9025` (252.68 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9025` (252.68 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9025` (251.18 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9025` (289.44 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9025` (289.44 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9025` (289.42 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9025` (289.4 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9025` (288.62 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9025` (288.6 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9025` (288.2 MB).

### Added
- Added Ruby `3.2.3` due to CVE-2023-36617: ReDoS vulnerability in URI, https://www.ruby-lang.org/en/news/2024/01/18/ruby-3-2-3-released/

### Changed
- Updated Rubygems to `3.5.6` (from `3.5.3`), https://github.com/rubygems/rubygems/blob/v3.5.6/CHANGELOG.md
- Updated Bundler to `2.5.6` (from `2.5.3`), https://github.com/rubygems/rubygems/blob/bundler-v2.5.6/bundler/CHANGELOG.md

## [9024] 2023-12-28

Grubruby version `9024` ships with:
- Rubygems `3.5.3`.
- Bundler `2.5.3`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `3.3.0` as `kaspergrubbe/grubruby-jemalloc:3.3.0.9024` (204.56 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9024` (209.77 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9024` (209.75 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9024` (209.81 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9024` (209.8 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9024` (209.8 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9024` (229.67 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9024` (229.67 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9024` (228.16 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9024` (264.6 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9024` (264.6 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9024` (264.59 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9024` (264.56 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9024` (263.79 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9024` (263.76 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9024` (263.37 MB)

### Added
- Added Ruby `3.3.0`! Happy holidays! https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/

### Removed
- Ruby `2.6.*` and Ruby `2.7.*` have been removed, they are no longer supported, and rubygems and bundler have removed support.

### Changed
- **THIS WILL BE A SPLIT RELEASE:**
  - **Ruby 3.3, 3.2 and 3.1 version will now be running Debian Bookworm:** Please test your builds when upgrading! 
  - Ruby 3.0 will remain on Debian Bullseye due to OpenSSL compatibility issues.
- Updated Rubygems to `3.5.3` (from `3.4.10`), https://github.com/rubygems/rubygems/blob/v3.5.3/CHANGELOG.md
- Updated Bundler to `2.5.3` (from `2.4.10`), https://github.com/rubygems/rubygems/blob/bundler-v2.5.3/bundler/CHANGELOG.md

## [9023] 2023-03-31

Grubruby version `9023` ships with:
- Rubygems `3.4.10`.
- Bundler `2.4.10`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9022` (183.11 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9022` (183.15 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9022` (183.16 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9022` (183.23 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9022` (183.13 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9022` (183.13 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9022` (183.13 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9022` (183.18 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9022` (183.18 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9022` (183.21 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9022` (183.21 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9022` (185.38 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9022` (185.41 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9022` (185.43 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9022` (185.48 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9022` (176.52 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9022` (176.55 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9022` (176.55 MB).
- `2.7.7` as `kaspergrubbe/grubruby-jemalloc:2.7.7.9022` (176.57 MB).
- `2.7.8` as `kaspergrubbe/grubruby-jemalloc:2.7.8.9022` (176.57 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9022` (212.43 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9022` (212.82 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9022` (212.85 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9022` (213.63 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9022` (213.65 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9022` (213.67 MB).
- `3.0.6` as `kaspergrubbe/grubruby-jemalloc:3.0.6.9022` (213.67 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9022` (221.98 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9022` (223.49 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9022` (223.49 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9022` (205.08 MB).
- `3.1.4` as `kaspergrubbe/grubruby-jemalloc:3.1.4.9022` (205.09 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9022` (205.2 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9022` (205.15 MB).
- `3.2.2` as `kaspergrubbe/grubruby-jemalloc:3.2.2.9022` (197.03 MB).

### Added
- Added Ruby `3.2.2` which fixes CVE-2023-28755 and CVE-2023-28756, https://www.ruby-lang.org/en/news/2023/03/30/ruby-3-2-2-released/
- Added Ruby `3.1.4` which fixes CVE-2023-28755 and CVE-2023-28756, https://www.ruby-lang.org/en/news/2023/03/30/ruby-3-1-4-released/
- Added Ruby `3.0.6` which fixes CVE-2023-28755 and CVE-2023-28756, https://www.ruby-lang.org/en/news/2023/03/30/ruby-3-0-6-released/
- Added Ruby `2.7.8` which fixes CVE-2023-28755 and CVE-2023-28756, https://www.ruby-lang.org/en/news/2023/03/30/ruby-2-7-8-released/

### Changed
- Updated Rubygems to `3.4.10` (from `3.4.6`), https://github.com/rubygems/rubygems/blob/v3.4.10/CHANGELOG.md
- Updated Bundler to `2.4.10` (from `2.4.6`), https://github.com/rubygems/rubygems/blob/bundler-v2.4.10/bundler/CHANGELOG.md

## [9022] 2023-02-09

Grubruby version `9022` ships with:
- Rubygems `3.4.6`.
- Bundler `2.4.6`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9022` (183.03 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9022` (183.06 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9022` (183.08 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9022` (183.15 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9022` (183.04 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9022` (183.04 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9022` (183.05 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9022` (183.09 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9022` (183.09 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9022` (183.12 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9022` (183.12 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9022` (185.3 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9022` (185.32 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9022` (185.34 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9022` (185.39 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9022` (176.43 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9022` (176.46 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9022` (176.47 MB).
- `2.7.7` as `kaspergrubbe/grubruby-jemalloc:2.7.7.9022` (176.48 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9022` (212.06 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9022` (212.45 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9022` (212.48 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9022` (213.26 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9022` (213.28 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9022` (213.3 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9022` (221.61 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9022` (223.12 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9022` (223.12 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9022` (204.99 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9022` (205.12 MB).
- `3.2.1` as `kaspergrubbe/grubruby-jemalloc:3.2.1.9022` (197.0 MB).

### Added
- Added Ruby 3.2.1 which doesn't seem to change much of anything: https://www.ruby-lang.org/en/news/2023/02/08/ruby-3-2-1-released/

## [9021] 2023-02-06

Grubruby version `9021` ships with:
- Rubygems `3.4.6`.
- Bundler `2.4.6`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9021` (183.03 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9021` (183.06 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9021` (183.08 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9021` (183.15 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9021` (183.04 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9021` (183.04 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9021` (183.05 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9021` (183.09 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9021` (183.09 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9021` (183.12 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9021` (183.12 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9021` (185.3 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9021` (185.32 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9021` (185.34 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9021` (185.39 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9021` (176.43 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9021` (176.46 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9021` (176.47 MB).
- `2.7.7` as `kaspergrubbe/grubruby-jemalloc:2.7.7.9021` (176.48 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9021` (212.06 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9021` (212.45 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9021` (212.48 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9021` (213.26 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9021` (213.28 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9021` (213.3 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9021` (221.61 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9021` (223.12 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9021` (223.12 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9021` (204.99 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9021` (205.12 MB).

### Changed
- Updated Rubygems to `3.4.6` (from `3.4.4`), https://github.com/rubygems/rubygems/blob/v3.4.6/CHANGELOG.md
- Updated Bundler to `2.4.6` (from `2.4.4`), which fixes some issues with `bundler/inline`: https://github.com/rubygems/rubygems/blob/bundler-v2.4.6/bundler/CHANGELOG.md

## [9020] 2023-01-20 - The Yjit and Jemalloc 5.3 release!

Grubruby version `9020` ships with:
- Rubygems `3.4.4`.
- Bundler `2.4.4`.

- Jemalloc:
  - `3.6.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so`.
  - `4.5.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc4.so`.
  - `5.2.1`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so`.
  - `5.3.0`, use with `ENV LD_PRELOAD=/usr/local/lib/libjemalloc5_3.so`.

And the following Ruby-versions:
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9020` (182.95 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9020` (182.98 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9020` (182.99 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9020` (183.06 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9020` (182.96 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9020` (182.96 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9020` (182.96 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9020` (183.01 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9020` (183.01 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9020` (183.04 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9020` (183.04 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9020` (185.22 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9020` (185.24 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9020` (185.26 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9020` (185.31 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9020` (176.35 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9020` (176.38 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9020` (176.38 MB).
- `2.7.7` as `kaspergrubbe/grubruby-jemalloc:2.7.7.9020` (176.4 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9020` (211.91 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9020` (212.3 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9020` (212.33 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9020` (213.11 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9020` (213.13 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9020` (213.15 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9020` (221.46 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9020` (222.97 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9020` (222.97 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9020` (204.91 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9020` (205.03 MB).

### Added
- Added Yjit support to Ruby `3.2.0`! https://github.com/kaspergrubbe/grubruby-jemalloc/pull/58
- Added Jemalloc `5.3.0`, I still haven't heard much about its performance with Ruby, so it's added alongside the more battletested version of `5.2.1`.

### Changed
- Updated Rubygems to `3.4.4` (from `3.4.1`), https://github.com/rubygems/rubygems/blob/v3.4.4/CHANGELOG.md
- Updated Bundler to `2.4.4` (from `2.4.1`), https://github.com/rubygems/rubygems/blob/bundler-v2.4.4/bundler/CHANGELOG.md

## [9019] - 2022-12-31

Grubruby version `9019` ships with:
- Rubygems `3.4.1`.
- Bundler `2.4.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9019` (174.53 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9019` (174.57 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9019` (174.58 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9019` (174.65 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9019` (174.55 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9019` (174.55 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9019` (174.55 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9019` (174.6 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9019` (174.6 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9019` (174.63 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9019` (174.63 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9019` (176.8 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9019` (176.83 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9019` (176.85 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9019` (176.9 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9019` (167.94 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9019` (167.97 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9019` (167.97 MB).
- `2.7.7` as `kaspergrubbe/grubruby-jemalloc:2.7.7.9019` (167.99 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9019` (203.4 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9019` (203.79 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9019` (203.82 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9019` (204.6 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9019` (204.62 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9019` (204.64 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9019` (212.95 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9019` (214.46 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9019` (214.46 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9019` (196.5 MB).
- `3.2.0` as `kaspergrubbe/grubruby-jemalloc:3.2.0.9019` (183.79 MB).

### Added
- Added Ruby `3.2.0`! Happy holidays! No YJIT yet, as our version of Debian don't have the right version of Rust https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/

### Changed
- Updated Rubygems to `3.4.1` (from `3.3.26`) which **drops supports for Ruby 2.3, 2.4 and 2.5**, https://github.com/rubygems/rubygems/blob/v3.4.1/CHANGELOG.md
- Updated Bundler to `2.4.1` (from `2.3.26`) which **drops supports for Ruby 2.3, 2.4 and 2.5**, https://github.com/rubygems/rubygems/blob/bundler-v2.4.1/bundler/CHANGELOG.md

### Removed
- Ruby `2.4.*` and Ruby `2.5.*` have been removed.
- We no longer need thpoff, so that has also been removed. 

## [9018] - 2022-11-25

Grubruby version `9018` ships with:
- Rubygems `3.3.26`.
- Bundler `2.3.26`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9018` (170.7 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9018` (170.71 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9018` (170.71 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9018` (170.62 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9018` (170.63 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9018` (170.62 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9018` (170.62 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9018` (171.37 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9018` (171.0 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9018` (171.39 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9018` (171.39 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9018` (171.3 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9018` (171.3 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9018` (171.31 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9018` (171.31 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9018` (174.52 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9018` (174.55 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9018` (174.56 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9018` (174.63 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9018` (174.53 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9018` (174.53 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9018` (174.53 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9018` (174.58 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9018` (174.58 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9018` (174.61 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9018` (174.61 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9018` (176.79 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9018` (176.81 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9018` (176.83 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9018` (176.88 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9018` (167.93 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9018` (167.96 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9018` (167.96 MB).
- `2.7.7` as `kaspergrubbe/grubruby-jemalloc:2.7.7.9018` (167.98 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9018` (203.23 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9018` (203.62 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9018` (203.65 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9018` (204.43 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9018` (204.45 MB).
- `3.0.5` as `kaspergrubbe/grubruby-jemalloc:3.0.5.9018` (204.46 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9018` (212.77 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9018` (214.28 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9018` (214.28 MB).
- `3.1.3` as `kaspergrubbe/grubruby-jemalloc:3.1.3.9018` (188.49 MB).

### Added
- Ruby `2.7.7` due to vulnerability [CVE-2021-33621](https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/), https://www.ruby-lang.org/en/news/2022/11/24/ruby-2-7-7-released/
- Ruby `3.0.5` due to vulnerability [CVE-2021-33621](https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/), https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-0-5-released/
- Ruby `3.1.3` due to vulnerability [CVE-2021-33621](https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/), https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/

### Changed
- Updated Rubygems to `3.3.26` (from `3.3.24`) that includes a few enhancements and bug fixes, https://github.com/rubygems/rubygems/blob/v3.3.26/CHANGELOG.md
- Updated Bundler to `2.3.26` (from `2.3.24`) that includes enhancements and bug fixes, https://github.com/rubygems/rubygems/blob/bundler-v2.3.26/bundler/CHANGELOG.md

## [9017] - 2022-11-01

Grubruby version `9017` ships with:
- Rubygems `3.3.24`.
- Bundler `2.3.24`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9017` (170.69 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9017` (170.7 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9017` (170.7 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9017` (170.61 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9017` (170.62 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9017` (170.61 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9017` (170.61 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9017` (171.36 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9017` (170.99 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9017` (171.38 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9017` (171.38 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9017` (171.29 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9017` (171.29 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9017` (171.3 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9017` (171.3 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9017` (174.5 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9017` (174.54 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9017` (174.55 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9017` (174.62 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9017` (174.52 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9017` (174.52 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9017` (174.52 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9017` (174.57 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9017` (174.57 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9017` (174.6 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9017` (174.6 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9017` (176.78 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9017` (176.8 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9017` (176.82 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9017` (176.87 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9017` (167.92 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9017` (167.95 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9017` (167.95 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9017` (203.09 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9017` (203.48 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9017` (203.51 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9017` (204.29 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9017` (204.31 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9017` (212.63 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9017` (214.14 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9017` (214.14 MB).

### Changed
- Updated Rubygems to `3.3.24` (from `3.3.14`) that includes a few enhancements and bug fixes, https://github.com/rubygems/rubygems/blob/v3.3.24/CHANGELOG.md
- Updated Bundler to `2.3.24` (from `2.3.14`) that includes enhancements and bug fixes, https://github.com/rubygems/rubygems/blob/bundler-v2.3.24/bundler/CHANGELOG.md

## [9016] - 2022-05-25

Grubruby version `9016` ships with:
- Rubygems `3.3.14`.
- Bundler `2.3.14`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9016` (174.24 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9016` (174.25 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9016` (174.25 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9016` (174.16 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9016` (174.16 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9016` (174.16 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9016` (174.16 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9016` (174.91 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9016` (174.54 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9016` (174.93 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9016` (174.93 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9016` (174.84 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9016` (174.84 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9016` (174.85 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9016` (174.85 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9016` (178.05 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9016` (178.09 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9016` (178.1 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9016` (178.17 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9016` (178.07 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9016` (178.07 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9016` (178.07 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9016` (178.12 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9016` (178.12 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9016` (178.15 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9016` (178.15 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9016` (180.32 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9016` (180.35 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9016` (180.37 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9016` (180.42 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9016` (171.46 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9016` (171.5 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9016` (171.5 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9016` (205.91 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9016` (206.31 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9016` (206.33 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9016` (207.11 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9016` (207.14 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9016` (215.46 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9016` (216.97 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9016` (216.97 MB).

### Changed
- **Upgrade from Debian Buster to Debian Bullseye:** Please test your builds when upgrading!
- Update Rubygems to `3.3.14` (from `3.3.11`), it installs Bundler `2.3.14` as a default gem, it also fixes an issue with resolving: https://github.com/rubygems/rubygems/blob/v3.3.14/CHANGELOG.md#3314--2022-05-18

## [9015] - 2022-04-14

Grubruby version `9015` ships with:
- Rubygems `3.3.11`.
- Bundler `2.3.11`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9015` (165.39 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9015` (165.4 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9015` (165.4 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9015` (165.31 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9015` (165.32 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9015` (165.31 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9015` (165.31 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9015` (166.03 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9015` (165.66 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9015` (166.04 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9015` (166.05 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9015` (165.95 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9015` (165.95 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9015` (165.96 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9015` (165.97 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9015` (168.98 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9015` (168.95 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9015` (168.97 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9015` (169.02 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9015` (168.94 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9015` (168.94 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9015` (168.94 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9015` (168.97 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9015` (168.97 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9015` (169.0 MB).
- `2.6.10` as `kaspergrubbe/grubruby-jemalloc:2.6.10.9015` (169.0 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9015` (171.04 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9015` (171.07 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9015` (171.09 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9015` (171.16 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9015` (162.56 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9015` (162.59 MB).
- `2.7.6` as `kaspergrubbe/grubruby-jemalloc:2.7.6.9015` (162.59 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9015` (196.36 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9015` (196.73 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9015` (196.77 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9015` (197.54 MB).
- `3.0.4` as `kaspergrubbe/grubruby-jemalloc:3.0.4.9015` (197.56 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9015` (206.05 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9015` (207.56 MB).
- `3.1.2` as `kaspergrubbe/grubruby-jemalloc:3.1.2.9015` (207.56 MB).

### Added
- Ruby `3.1.2` due to vulnerability CVE-2022-28738 and CVE-2022-28739, https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/
- Ruby `3.0.4` due to vulnerability CVE-2022-28738 and CVE-2022-28739, https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-0-4-released/
- Ruby `2.7.6` due to vulnerability CVE-2022-28739, this marks maintenance phase of `2.7` meaning that it will only receive security updates, https://www.ruby-lang.org/en/news/2022/04/12/ruby-2-7-6-released/
- Ruby `2.6.10` due to vulnerability CVE-2022-28739, it also includes a regression in the date library, this marks the EOL of `2.6`, https://www.ruby-lang.org/en/news/2022/04/12/ruby-2-6-10-released/

### Changed
- Update Bundler to `2.3.11` (from `2.3.8`), it includes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/bundler-v2.3.11/bundler/CHANGELOG.md#2311-april-7-2022
- Update Rubygems to `3.3.11` (from `3.3.8`), it installs Bundler `2.3.9` as a default gem: https://github.com/rubygems/rubygems/blob/v3.3.11/CHANGELOG.md#3311--2022-04-07

## [9014] - 2022-03-07

Grubruby version `9014` ships with:
- Rubygems `3.3.8`.
- Bundler `2.3.8`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9014` (165.17 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9014` (165.19 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9014` (165.19 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9014` (165.09 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9014` (165.1 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9014` (165.09 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9014` (165.09 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9014` (165.81 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9014` (165.44 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9014` (165.82 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9014` (165.83 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9014` (165.74 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9014` (165.74 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9014` (165.75 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9014` (165.75 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9014` (168.76 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9014` (168.74 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9014` (168.75 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9014` (168.81 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9014` (168.73 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9014` (168.72 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9014` (168.72 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9014` (168.75 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9014` (168.75 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9014` (168.78 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9014` (170.83 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9014` (170.85 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9014` (170.87 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9014` (170.94 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9014` (162.34 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9014` (162.37 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9014` (195.98 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9014` (196.35 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9014` (196.38 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9014` (197.16 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9014` (205.67 MB).
- `3.1.1` as `kaspergrubbe/grubruby-jemalloc:3.1.1.9014` (207.17 MB).

### Added
- Added Ruby `3.1.1`!

### Changed
- Update Bundler to `2.3.8` (from `2.3.5`), it includes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/bundler-v2.3.8/bundler/CHANGELOG.md#238-february-23-2022
- Update Rubygems to `3.3.8` (from `3.3.5`), it incudes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/v3.3.8/CHANGELOG.md#338--2022-02-23

## [9013] - 2022-01-14

Grubruby version `9013` ships with:
- Rubygems `3.3.5`.
- Bundler `2.3.5`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9013` (165.17 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9013` (165.18 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9013` (165.18 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9013` (165.09 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9013` (165.09 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9013` (165.09 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9013` (165.09 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9013` (165.8 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9013` (165.43 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9013` (165.82 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9013` (165.82 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9013` (165.73 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9013` (165.73 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9013` (165.74 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9013` (165.74 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9013` (168.75 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9013` (168.73 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9013` (168.74 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9013` (168.8 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9013` (168.72 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9013` (168.71 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9013` (168.71 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9013` (168.74 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9013` (168.74 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9013` (168.78 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9013` (170.82 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9013` (170.84 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9013` (170.87 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9013` (170.93 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9013` (162.33 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9013` (162.37 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9013` (195.75 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9013` (196.12 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9013` (196.15 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9013` (196.92 MB).
- `3.1.0` as `kaspergrubbe/grubruby-jemalloc:3.1.0.9013` (205.43 MB).

### Added
- Added Ruby `3.1.0`, happy holidays!

### Changed
- Update Bundler to `2.3.5` (from `2.2.32`), it includes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/bundler-v2.3.5/bundler/CHANGELOG.md#235-january-12-2022
- Update Rubygems to `3.3.5` (from `3.2.32`), it incudes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/v3.3.5/CHANGELOG.md#335--2022-01-12

## [9012] - 2021-11-29

Grubruby version `9012` ships with:
- Rubygems `3.2.32`.
- Bundler `2.2.32`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9012` (165.16 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9012` (165.18 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9012` (165.18 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9012` (165.08 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9012` (165.09 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9012` (165.08 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9012` (165.08 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9012` (165.8 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9012` (165.43 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9012` (165.82 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9012` (165.82 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9012` (165.73 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9012` (165.73 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9012` (165.74 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9012` (165.74 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9012` (168.75 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9012` (168.73 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9012` (168.74 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9012` (168.8 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9012` (168.72 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9012` (168.71 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9012` (168.71 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9012` (168.74 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9012` (168.74 MB).
- `2.6.9` as `kaspergrubbe/grubruby-jemalloc:2.6.9.9012` (168.78 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9012` (170.82 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9012` (170.84 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9012` (170.86 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9012` (170.93 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9012` (162.33 MB).
- `2.7.5` as `kaspergrubbe/grubruby-jemalloc:2.7.5.9012` (162.36 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9012` (195.54 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9012` (195.91 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9012` (195.94 MB).
- `3.0.3` as `kaspergrubbe/grubruby-jemalloc:3.0.3.9012` (188.88 MB).

### Changed
- Update Bundler to `2.2.32` (from `2.2.31`), it includes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/bundler-v2.2.32/bundler/CHANGELOG.md#2232-november-23-2021
- Update Rubygems to `3.2.32` (from `3.2.31`), it incudes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/v3.2.32/CHANGELOG.md#3232--2021-11-23

### Added
- Added Ruby `2.6.9` that was released because of security issues: https://www.ruby-lang.org/en/news/2021/11/24/ruby-2-6-9-released/
- Added Ruby `2.7.5` that was released because of security issues: https://www.ruby-lang.org/en/news/2021/11/24/ruby-2-7-5-released/
- Added Ruby `3.0.3` that was released because of security issues: https://www.ruby-lang.org/en/news/2021/11/24/ruby-3-0-3-released/

## [9011] - 2021-11-12

Grubruby version `9011` ships with:
- Rubygems `3.2.31`.
- Bundler `2.2.31`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9011` (165.17 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9011` (165.18 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9011` (165.18 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9011` (165.09 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9011` (165.1 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9011` (165.09 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9011` (165.09 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9011` (165.81 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9011` (165.44 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9011` (165.82 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9011` (165.83 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9011` (165.73 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9011` (165.73 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9011` (165.74 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9011` (165.75 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9011` (168.76 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9011` (168.73 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9011` (168.75 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9011` (168.81 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9011` (168.72 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9011` (168.72 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9011` (168.72 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9011` (168.75 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9011` (168.75 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9011` (170.83 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9011` (170.85 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9011` (170.87 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9011` (170.94 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9011` (162.34 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9011` (195.47 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9011` (195.84 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9011` (195.88 MB).

### Changed

- Update Bundler to `2.2.31` (from `2.2.22`), it includes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/bundler-v2.2.31/bundler/CHANGELOG.md#2231-november-8-2021
- Update Rubygems to `3.2.31` (from `3.2.22`), it incudes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/v3.2.31/CHANGELOG.md#3231--2021-11-08

## [9010] - 2021-07-09

Grubruby version `9010` ships with:
- Rubygems `3.2.22`.
- Bundler `2.2.22`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9010` (164.88 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9010` (164.9 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9010` (164.9 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9010` (164.8 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9010` (164.81 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9010` (164.8 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9010` (164.8 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9010` (165.52 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9010` (165.15 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9010` (165.53 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9010` (165.54 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9010` (165.45 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9010` (165.45 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9010` (165.45 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9010` (165.46 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9010` (168.47 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9010` (168.45 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9010` (168.46 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9010` (168.52 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9010` (168.43 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9010` (168.43 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9010` (168.43 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9010` (168.46 MB).
- `2.6.8` as `kaspergrubbe/grubruby-jemalloc:2.6.8.9010` (168.46 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9010` (170.54 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9010` (170.56 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9010` (170.58 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9010` (170.65 MB).
- `2.7.4` as `kaspergrubbe/grubruby-jemalloc:2.7.4.9010` (162.05 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9010` (194.84 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9010` (195.21 MB).
- `3.0.2` as `kaspergrubbe/grubruby-jemalloc:3.0.2.9010` (187.64 MB).

### Changed

- Update Bundler to `2.2.22` (from `2.2.19`), it includes bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/bundler-v2.2.22/bundler/CHANGELOG.md#2222-july-6-2021
- Update Rubygems to `3.2.22` (from `3.2.19`), it incudes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/v3.2.22/CHANGELOG.md#3222--2021-07-06

### Added

- Added Ruby 2.6.8 that was introduced due to several security issues: https://www.ruby-lang.org/en/news/2021/07/07/ruby-2-6-8-released/
- Added Ruby 2.7.4 that was introduced due to several security issues: https://www.ruby-lang.org/en/news/2021/07/07/ruby-2-7-4-released/
- Added Ruby 3.0.2 that was introduced due to several security issues: https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/

## [9009] - 2021-06-01

Grubruby version `9009` ships with:
- Rubygems `3.2.19`.
- Bundler `2.2.19`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9009` (164.86 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9009` (164.87 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9009` (164.87 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9009` (164.78 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9009` (164.79 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9009` (164.78 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9009` (164.78 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9009` (165.5 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9009` (165.13 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9009` (165.51 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9009` (165.52 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9009` (165.42 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9009` (165.42 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9009` (165.43 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9009` (165.44 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9009` (168.45 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9009` (168.42 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9009` (168.44 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9009` (168.5 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9009` (168.41 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9009` (168.41 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9009` (168.41 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9009` (168.44 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9009` (170.52 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9009` (170.54 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9009` (170.56 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9009` (170.63 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9009` (194.72 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9009` (195.09 MB).

### Changed

- Update Bundler to `2.2.19` (from `2.2.15`), it includes bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/bundler-v2.2.19/bundler/CHANGELOG.md
- Update Rubygems to `3.2.19` (from `3.2.15`), it incudes multiple bugfixes and enhancements: https://github.com/rubygems/rubygems/blob/v3.2.19/bundler/CHANGELOG.md

## [9008] - 2021-04-06

Grubruby version `9008` ships with:
- Rubygems `3.2.15`.
- Bundler `2.2.15`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9008` (164.35 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9008` (164.36 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9008` (164.36 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9008` (164.26 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9008` (164.27 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9008` (164.26 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9008` (164.26 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9008` (164.98 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9008` (164.61 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9008` (165.0 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9008` (165.0 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9008` (164.91 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9008` (164.91 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9008` (164.92 MB).
- `2.5.9` as `kaspergrubbe/grubruby-jemalloc:2.5.9.9008` (164.92 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9008` (167.93 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9008` (167.91 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9008` (167.92 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9008` (167.98 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9008` (167.9 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9008` (167.89 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9008` (167.89 MB).
- `2.6.7` as `kaspergrubbe/grubruby-jemalloc:2.6.7.9008` (167.92 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9008` (170.0 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9008` (170.02 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9008` (170.05 MB).
- `2.7.3` as `kaspergrubbe/grubruby-jemalloc:2.7.3.9008` (170.11 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9008` (194.05 MB).
- `3.0.1` as `kaspergrubbe/grubruby-jemalloc:3.0.1.9008` (187.34 MB).

### Added
- Added Ruby `3.0.1` that fixes multiple CVEs: https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/
- Added Ruby `2.7.3` that fixes multiple CVEs: https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-7-3-released/
- Added Ruby `2.6.7` that fixes multiple CVEs: https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-6-7-released/
- Added Ruby `2.5.9` that fixes multiple CVEs: https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-5-9-released/

### Changed

- Upgraded Bundler to version 2.2.15 (from version 2.2.11).
- Upgraded Rubygems to version 3.2.15 (from version 3.2.11).

## [9007] - 2021-02-24

Grubruby version `9007` ships with:
- Rubygems `3.2.11`.
- Bundler `2.2.11`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `grubruby-jemalloc.local:2.4.4.9007` (164.3 MB).
- `2.4.5` as `grubruby-jemalloc.local:2.4.5.9007` (164.31 MB).
- `2.4.6` as `grubruby-jemalloc.local:2.4.6.9007` (164.31 MB).
- `2.4.7` as `grubruby-jemalloc.local:2.4.7.9007` (164.22 MB).
- `2.4.8` as `grubruby-jemalloc.local:2.4.8.9007` (164.23 MB).
- `2.4.9` as `grubruby-jemalloc.local:2.4.9.9007` (164.22 MB).
- `2.4.10` as `grubruby-jemalloc.local:2.4.10.9007` (164.22 MB).
- `2.5.1` as `grubruby-jemalloc.local:2.5.1.9007` (164.94 MB).
- `2.5.2` as `grubruby-jemalloc.local:2.5.2.9007` (164.57 MB).
- `2.5.3` as `grubruby-jemalloc.local:2.5.3.9007` (164.95 MB).
- `2.5.5` as `grubruby-jemalloc.local:2.5.5.9007` (164.96 MB).
- `2.5.6` as `grubruby-jemalloc.local:2.5.6.9007` (164.86 MB).
- `2.5.7` as `grubruby-jemalloc.local:2.5.7.9007` (164.86 MB).
- `2.5.8` as `grubruby-jemalloc.local:2.5.8.9007` (164.87 MB).
- `2.6.0` as `grubruby-jemalloc.local:2.6.0.9007` (167.89 MB).
- `2.6.1` as `grubruby-jemalloc.local:2.6.1.9007` (167.86 MB).
- `2.6.2` as `grubruby-jemalloc.local:2.6.2.9007` (167.88 MB).
- `2.6.3` as `grubruby-jemalloc.local:2.6.3.9007` (167.93 MB).
- `2.6.4` as `grubruby-jemalloc.local:2.6.4.9007` (167.85 MB).
- `2.6.5` as `grubruby-jemalloc.local:2.6.5.9007` (167.85 MB).
- `2.6.6` as `grubruby-jemalloc.local:2.6.6.9007` (167.85 MB).
- `2.7.0` as `grubruby-jemalloc.local:2.7.0.9007` (169.95 MB).
- `2.7.1` as `grubruby-jemalloc.local:2.7.1.9007` (169.98 MB).
- `2.7.2` as `grubruby-jemalloc.local:2.7.2.9007` (170.0 MB).
- `3.0.0` as `grubruby-jemalloc.local:3.0.0.9007` (193.87 MB).

### Changed

- Upgraded Bundler to version 2.2.11 (from version 2.2.3).
- Upgraded Rubygems to version 3.2.11 (from version 3.2.3).

## [9006] - 2020-12-26

Grubruby version `9006` ships with:
- Rubygems `3.2.3`.
- Bundler `2.2.3`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9006` (164.29 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9006` (164.3 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9006` (164.3 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9006` (164.21 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9006` (164.22 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9006` (164.21 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9006` (164.21 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9006` (164.93 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9006` (164.56 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9006` (164.94 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9006` (164.95 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9006` (164.85 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9006` (164.85 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9006` (164.86 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9006` (167.87 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9006` (167.85 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9006` (167.86 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9006` (167.92 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9006` (167.84 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9006` (167.83 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9006` (167.84 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9006` (169.94 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9006` (169.97 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9006` (169.99 MB).
- `3.0.0` as `kaspergrubbe/grubruby-jemalloc:3.0.0.9006` (186.74 MB).

### Added
- Added `ENV LANG C.UTF-8` to all images.
- Added Ruby 3.0.0. Comprehensive changelog available here: https://rubyreferences.github.io/rubychanges/3.0.html

### Changed
- Upgraded Bundler to version `2.2.3` (was `2.2.2`)
- Updated Rubygems to version `3.2.3` (was `3.2.2`)
- No longer setting `ENV BUNDLE_PATH`.

## [9005] - 2020-12-21

Grubruby version `9005` ships with:
- Rubygems `3.2.2`.
- Bundler `2.2.2`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9005` (165.27 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9005` (165.29 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9005` (165.29 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9005` (165.19 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9005` (165.2 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9005` (165.19 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9005` (165.19 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9005` (165.91 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9005` (165.54 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9005` (165.93 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9005` (165.93 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9005` (165.84 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9005` (165.84 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9005` (165.85 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9005` (168.86 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9005` (168.84 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9005` (168.85 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9005` (168.91 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9005` (168.83 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9005` (168.82 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9005` (168.82 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9005` (170.93 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9005` (170.95 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9005` (170.97 MB).

### Changed
- Upgraded Bundler to version `2.2.2` (was `2.2.1`)
- Updated Rubygems to version `3.2.2` (was `3.2.1`)

## [9004] - 2020-12-16

Grubruby version `9004` ships with:
- Rubygems `3.2.1`.
- Bundler `2.2.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9004` (164.28 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9004` (164.29 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9004` (164.29 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9004` (164.19 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9004` (164.2 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9004` (164.19 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9004` (164.19 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9004` (164.91 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9004` (164.54 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9004` (164.93 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9004` (164.93 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9004` (164.84 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9004` (164.84 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9004` (164.85 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9004` (167.86 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9004` (167.84 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9004` (167.85 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9004` (167.91 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9004` (167.83 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9004` (167.82 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9004` (167.82 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9004` (169.93 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9004` (169.95 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9004` (169.97 MB).

### Changed
- Upgraded Bundler to version `2.2.1` (was `2.1.4`), includes some major fixes and enhancements: https://github.com/rubygems/rubygems/releases/tag/bundler-v2.2.0 and https://github.com/rubygems/rubygems/releases/tag/bundler-v2.2.1
- Updated Rubygems to version `3.2.1` (from version `3.1.4`)

## [9003] - 2020-10-02

Grubruby version `9003` ships with:
- Rubygems `3.1.4`.
- Bundler `2.1.4`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9003` (164.09 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9003` (164.1 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9003` (164.1 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9003` (164.0 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9003` (164.01 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9003` (164.0 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9003` (164.0 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9003` (164.72 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9003` (164.35 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9003` (164.74 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9003` (164.74 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9003` (164.65 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9003` (164.65 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9003` (164.66 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9003` (167.78 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9003` (167.76 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9003` (167.77 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9003` (167.83 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9003` (167.74 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9003` (167.74 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9003` (167.74 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9003` (169.85 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9003` (169.87 MB).
- `2.7.2` as `kaspergrubbe/grubruby-jemalloc:2.7.2.9003` (163.11 MB).

### Added
- Added Ruby `2.7.2` that disables deprecated warnings by default fixes, it also includes a new version of WEBrick that fixes [CVE-2020-25613](https://www.ruby-lang.org/en/news/2020/09/29/http-request-smuggling-cve-2020-25613/), read more here: https://www.ruby-lang.org/en/news/2020/10/02/ruby-2-7-2-released/

### Changed
- Updated Rubygems to version `3.1.4` (from version `3.1.3`) which is a very small release: https://github.com/rubygems/rubygems/releases/tag/v3.1.4

## [9002] - 2020-05-09

Grubruby version `9002` ships with:
- Rubygems `3.1.3`.
- Bundler `2.1.4`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9002` (164.07 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9002` (164.09 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9002` (164.09 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9002` (163.99 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9002` (164.0 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9002` (163.99 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9002` (163.99 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9002` (164.71 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9002` (164.34 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9002` (164.72 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9002` (164.73 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9002` (164.64 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9002` (164.64 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9002` (164.64 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9002` (167.77 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9002` (167.74 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9002` (167.76 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9002` (167.81 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9002` (167.73 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9002` (167.73 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9002` (167.73 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9002` (169.84 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9002` (169.86 MB).

### Changed
- Updated Rubygems to version `3.1.3` (from `3.1.2`) that includes a couple of smaller fixes: https://blog.rubygems.org/2020/05/05/3.1.3-released.html

## [9001] - 2020-03-31

Grubruby version `9001` ships with:
- Rubygems `3.1.2`.
- Bundler `2.1.4`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9001` (164.06 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9001` (164.08 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9001` (164.08 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9001` (163.98 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9001` (163.99 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9001` (163.98 MB).
- `2.4.10` as `kaspergrubbe/grubruby-jemalloc:2.4.10.9001` (163.98 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9001` (164.7 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9001` (164.33 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9001` (164.72 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9001` (164.72 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9001` (164.63 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9001` (164.63 MB).
- `2.5.8` as `kaspergrubbe/grubruby-jemalloc:2.5.8.9001` (164.64 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9001` (167.76 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9001` (167.74 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9001` (167.75 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9001` (167.81 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9001` (167.72 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9001` (167.72 MB).
- `2.6.6` as `kaspergrubbe/grubruby-jemalloc:2.6.6.9001` (167.72 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9001` (163.06 MB).
- `2.7.1` as `kaspergrubbe/grubruby-jemalloc:2.7.1.9001` (163.08 MB).

### Added

- Add Ruby `2.5.8`, `2.6.6` and `2.7.1` that fixes CVE-2020-10933 which is related to a heap exposure vulnerability in the socket library, read more here: https://www.ruby-lang.org/en/news/2020/03/31/heap-exposure-in-socket-cve-2020-10933/
- Add Ruby `2.4.10` that fixes CVE-2020-16255 which is related to Unsafe Object Creation Vulnerability in JSON, read more here: https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-4-10-released/

## [9000] - 2020-03-27

Grubruby version `9000` ships with:
- Rubygems `3.1.2`.
- Bundler `2.1.4`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.9000` (164.06 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.9000` (164.08 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.9000` (164.08 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.9000` (163.98 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.9000` (163.99 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.9000` (163.98 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.9000` (164.7 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.9000` (164.33 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.9000` (164.72 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.9000` (164.72 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.9000` (164.63 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.9000` (164.63 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.9000` (167.76 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.9000` (167.74 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.9000` (167.75 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.9000` (167.81 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.9000` (167.72 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.9000` (167.72 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.9000` (163.06 MB).

### Changed
- Updated base-image from Debian 9 (stretch) to Debian 10 (buster). This means that **SOME THINGS MIGHT BREAK**, so please update carefully, there are newer packages and there might be updated package names. [#34](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/34)
- We no longer compile Ruby with the `--with-jemalloc` flag, this means that `LD_PRELOAD` needs to be used if Jemalloc needs to be used.
- Added tests for `LD_PRELOAD` and Jemalloc usage.

## [8021] - 2020-01-07

Grubruby version `8021` ships with:
- Rubygems `3.1.2`.
- Bundler `2.1.4`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8021` (189.98 MB).
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8021` (189.99 MB).
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.8021` (189.99 MB).
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.8021` (189.89 MB).
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.8021` (189.9 MB).
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.8021` (189.89 MB).
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8021` (190.49 MB).
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8021` (190.12 MB).
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8021` (190.51 MB).
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.8021` (190.51 MB).
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.8021` (190.41 MB).
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.8021` (190.41 MB).
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8021` (193.29 MB).
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.8021` (193.27 MB).
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.8021` (193.28 MB).
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.8021` (193.34 MB).
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.8021` (193.26 MB).
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.8021` (193.26 MB).
- `2.7.0` as `kaspergrubbe/grubruby-jemalloc:2.7.0.8021` (209.72 MB).

### Added
- Added a rudimentary test-suite that builds a small Rails setup, starts a container, and sends a HTTP request to it. [#36](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/36)
- Print image-sizes to our release notes and when we test newly built images [d46a59a](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/36/commits/d46a59aedfadc2da9606cf57377cf2dd24a642e2)

### Changed
- Upgraded Bundler to version `2.1.4` (was `2.1.3`), includes some minor fixes: https://github.com/bundler/bundler/releases/tag/v2.1.4 [#35](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/35)

### Removed
- Got rid of Ruby `2.3.*` as those versions are no longer supported.
- Got rid of Ruby `2.5.4` as that release was a bad release causing forks on threaded-programs to fail: https://www.ruby-lang.org/en/news/2019/03/15/ruby-2-5-5-released/

## [8020] - 2020-01-03

### Added
- Added Ruby `2.7.0`: https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/, comprehensive changelog available at: https://rubyreferences.github.io/rubychanges/2.7.html [#32](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/32)

### Changed
- Upgraded Rubygems to version `3.1.2` (was `3.1.1`), includes minor enhancements and bugfixes: https://blog.rubygems.org/2019/12/20/3.1.2-released.html [#30](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/30)
- Upgraded Bundler to version `2.1.3` (was `2.1.1`),
  - `2.1.2` includes one minor bugfix: https://github.com/bundler/bundler/releases/tag/v2.1.2 [#31](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/31)
  - `2.1.3` includes a couple of minor bugfixes: https://github.com/bundler/bundler/releases/tag/v2.1.3 [#33](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/33)

## [8019] - 2019-12-18

Grubruby version `8019` ships with:
- Rubygems `3.1.1`.
- Bundler `2.1.1`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8019`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8019`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8019`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8019`.
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.8019`.
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.8019`.
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.8019`.
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.8019`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8019`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8019`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8019`.
- `2.5.4` as `kaspergrubbe/grubruby-jemalloc:2.5.4.8019`.
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.8019`.
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.8019`.
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.8019`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8019`.
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.8019`.
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.8019`.
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.8019`.
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.8019`.
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.8019`.

### Changed
- Updated Rubygems to version `3.1.1`, https://blog.rubygems.org/2019/12/16/3.1.1-released.html [#28](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/28)
- Upgraded Bundler to version: `2.1.1` (from `2.1.0`) which includes some minor fixes https://github.com/bundler/bundler/releases/tag/v2.1.1 [#29](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/29)

## [8018] - 2019-12-15

Grubruby version `8018` ships with:
- Rubygems `3.0.6`.
- Bundler `2.1.0`.
- Jemalloc `3.6.0`, `4.5.0` and `5.2.1`.

And the following Ruby-versions:
- `2.3.7` as `kaspergrubbe/grubruby-jemalloc:2.3.7.8018`.
- `2.3.8` as `kaspergrubbe/grubruby-jemalloc:2.3.8.8018`.
- `2.4.4` as `kaspergrubbe/grubruby-jemalloc:2.4.4.8018`.
- `2.4.5` as `kaspergrubbe/grubruby-jemalloc:2.4.5.8018`.
- `2.4.6` as `kaspergrubbe/grubruby-jemalloc:2.4.6.8018`.
- `2.4.7` as `kaspergrubbe/grubruby-jemalloc:2.4.7.8018`.
- `2.4.8` as `kaspergrubbe/grubruby-jemalloc:2.4.8.8018`.
- `2.4.9` as `kaspergrubbe/grubruby-jemalloc:2.4.9.8018`.
- `2.5.1` as `kaspergrubbe/grubruby-jemalloc:2.5.1.8018`.
- `2.5.2` as `kaspergrubbe/grubruby-jemalloc:2.5.2.8018`.
- `2.5.3` as `kaspergrubbe/grubruby-jemalloc:2.5.3.8018`.
- `2.5.4` as `kaspergrubbe/grubruby-jemalloc:2.5.4.8018`.
- `2.5.5` as `kaspergrubbe/grubruby-jemalloc:2.5.5.8018`.
- `2.5.6` as `kaspergrubbe/grubruby-jemalloc:2.5.6.8018`.
- `2.5.7` as `kaspergrubbe/grubruby-jemalloc:2.5.7.8018`.
- `2.6.0` as `kaspergrubbe/grubruby-jemalloc:2.6.0.8018`.
- `2.6.1` as `kaspergrubbe/grubruby-jemalloc:2.6.1.8018`.
- `2.6.2` as `kaspergrubbe/grubruby-jemalloc:2.6.2.8018`.
- `2.6.3` as `kaspergrubbe/grubruby-jemalloc:2.6.3.8018`.
- `2.6.4` as `kaspergrubbe/grubruby-jemalloc:2.6.4.8018`.
- `2.6.5` as `kaspergrubbe/grubruby-jemalloc:2.6.5.8018`.

### Added
- Upgraded Bundler to version: `2.1.0` which turns on deprecations for upcoming breaking changes in bundler 3 by default. https://github.com/bundler/bundler/releases/tag/v2.1.0 [#26](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/26)
- Added Ruby version `2.4.9` which were somehow missed earlier. [#27](https://github.com/kaspergrubbe/grubruby-jemalloc/pull/27)

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
