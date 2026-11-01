# Version checks:
- Rubygems versions: https://rubygems.org/pages/download
- Bundler versions: https://rubygems.org/gems/bundler
- Ruby versions: https://www.ruby-lang.org/en/downloads/releases/
- Jemalloc versions: https://github.com/jemalloc/jemalloc/releases
- Supported Rubies and Rails versions: https://www.fastruby.io/blog/ruby/rails/versions/compatibility-table.html

# Automated Ruby releases

The `grubruby-release-watch` Buildkite pipeline runs `ruby tools/check_releases.rb` every 15 minutes on `master`. Each run:

- Reads https://github.com/ruby/www.ruby-lang.org/blob/master/_data/releases.yml, adds any newer patch release of a supported series to `tools/rubies.json` (after verifying the tarball SHA256) and to the top of `### Added` under `## [Unreleased]` in `CHANGELOG.md`, and pushes that to `master`.
- Waits until `tools/rubies.json`/`CHANGELOG.md` have been untouched for 20 minutes (`RELEASE_QUIET_MINUTES`), so a batch of releases ships together, then renames `## [Unreleased]` to `## [XXXX] YYYY-MM-DD`, commits and tags that as `vXXXX`, and adds a new empty `## [Unreleased]` in a second `[skip ci]` commit. The tag builds and pushes the images.
- Every `v*` tag, automated or manual, gets a GitHub release from `.github/workflows/release.yml`, with the notes from `VERSION=vXXXX ruby tools/release_notes.rb` (the CHANGELOG section plus what the images ship with).
- The bot follows every series that has a `ruby-X.Y/Dockerfile`. To add a series (e.g. 4.1), add `ruby-4.1/Dockerfile` and the next run adds all its stable releases. To drop one, delete its `ruby-X.Y/` folder, otherwise the bot adds its releases back.

Only a new Ruby triggers an automatic release: `## [Unreleased]` has to contain a bot style `- Added Ruby X.Y.Z, https://www.ruby-lang.org/...` line, and the cooldown has to have passed. Anything else under `## [Unreleased]` on `master` waits, and ships along with the next new Ruby or your next manual release.

Dry run locally: `DRY_RUN=1 RELEASE_QUIET_MINUTES=0 ruby tools/check_releases.rb` (commits and tags locally, does not push).

# How to do a release manually

The Rubies we build are listed in `tools/rubies.json`, one per line, sorted by version (`{"version":"4.0.9","sha256":"...","rails":"rails70"}`). The Grubruby version is not stored anywhere, it is the number of the `vXXXX` git tag.

- Make your change, e.g. add a Ruby to `tools/rubies.json` (get the SHA256 with `ruby tools/ruby_sha256.rb X.Y.Z`), and describe it under `## [Unreleased]` in `CHANGELOG.md`.
- Test it with `ruby tools/test.rb` (or `ruby tools/test.rb 3.4` for one series).
- Merge to `master`. A new Ruby gets released by the watcher after the cooldown, anything else waits for the next new Ruby, or release it by hand:
  - Rename `## [Unreleased]` to `## [XXXX] YYYY-MM-DD`, commit, and tag it: `git tag -m vXXXX vXXXX`.
  - Add a new empty `## [Unreleased]` above it and commit with `[skip ci]` in the message.
  - Push both: `git push origin master vXXXX`.
- The tag builds and pushes the images on Buildkite, and creates the GitHub release. Preview the notes with `VERSION=vXXXX ruby tools/release_notes.rb`.
- To build locally: `VERSION=vXXXX ruby tools/build.rb build`.

# How to check a SHA256 for a Ruby release

```bash
ruby tools/ruby_sha256.rb 2.5.3
```

# Test images

## Dockerhub

```bash
docker run --name grubruby_test --rm -i -t kaspergrubbe/grubruby-jemalloc:2.7.0.8020 /bin/bash
```

## Locally built

```bash
docker run --name grubruby_test --rm -i -t grubruby-jemalloc.local:2.7.0.8020 /bin/bash
```

# Check compile-time flags

```bash
$ ruby -r rbconfig -e 'puts RbConfig::CONFIG["configure_args"]'
# "'--build=x86_64-linux-gnu' '--disable-install-doc' '--enable-shared' 'build_alias=x86_64-linux-gnu'"

$ ruby -r rbconfig -e 'puts RbConfig::CONFIG["LDFLAGS"]'
# "-L. -fstack-protector-strong -rdynamic -Wl,-export-dynamic"

$ ruby -r rbconfig -e 'puts RbConfig::CONFIG["CFLAGS"]'
# "-O3 -ggdb3 -Wall -Wextra -Wdeprecated-declarations -Wduplicated-cond -Wimplicit-function-declaration -Wimplicit-int -Wmisleading-indentation -Wpointer-arith -Wwrite-strings -Wimplicit-fallthrough=0 -Wmissing-noreturn -Wno-cast-function-type -Wno-constant-logical-operand -Wno-long-long -Wno-missing-field-initializers -Wno-overlength-strings -Wno-packed-bitfield-compat -Wno-parentheses-equality -Wno-self-assign -Wno-tautological-compare -Wno-unused-parameter -Wno-unused-value -Wsuggest-attribute=format -Wsuggest-attribute=noreturn -Wunused-variable  -fPIC"

$ ruby -r rbconfig -e 'puts RbConfig::CONFIG["CFLAGS"].split - RbConfig::CONFIG["warnflags"].split'
# -O3
# -ggdb3
# -fPIC
```

## List of GCC resources:

- Generic `-march` and `-mtune`, https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
- Specific to current gcc `-march` and `mtune`: https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/x86-Options.html 
- Optimization `-O`-flags with GCC, https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
- PGO with GCC, https://ddmler.github.io/compiler/2018/06/29/profile-guided-optimization.html

## GCC x86-64 micro-architecture levels

GCC 11 supports micro-architecture tweaking:

```
x86-64: CMOV, CMPXCHG8B, FPU, FXSR, MMX, FXSR, SCE, SSE, SSE2
x86-64-v2: (close to Nehalem) CMPXCHG16B, LAHF-SAHF, POPCNT, SSE3, SSE4.1, SSE4.2, SSSE3
x86-64-v3: (close to Haswell) AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE
x86-64-v4: AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
```

https://gitlab.com/x86-psABIs/x86-64-ABI/-/commit/77566eb03bc6a326811cb7e9

https://www.phoronix.com/scan.php?page=news_item&px=GCC-11-x86-64-Feature-Levels

## Find `-march` and `-mtune` or current CPU

```
$ gcc -march=native -Q --help=target | grep -- '-march='
#  -march=                     		skylake
#  Known valid arguments for -march= option:
```

## `-fno-semantic-interposition`

Someone on Hackernews mentioned that `-fno-semantic-interposition` was helpful for interpreters such as Python.

https://news.ycombinator.com/item?id=28898400
