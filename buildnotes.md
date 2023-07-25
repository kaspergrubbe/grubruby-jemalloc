# Version checks:
- Rubygems versions: https://rubygems.org/pages/download
- Bundler versions: https://rubygems.org/gems/bundler
- Ruby versions: https://www.ruby-lang.org/en/downloads/releases/
- Jemalloc versions: https://github.com/jemalloc/jemalloc/releases
- Supported Rubies and Rails versions: https://www.fastruby.io/blog/ruby/rails/versions/compatibility-table.html

# How to do a release
- Test if everything is building and working by running `ruby tools/test.rb`.
- Update variable `grubruby_version` with `+ 1` in `tools/vars.rb`.
- Build all the images by running `ruby tools/build.rb build`.
- Update `CHANGELOG.md` with the new release and commit.
- Git version tag the release with: `git_tag.rb vXXXX`.
- Paste the information from `CHANGELOG.md` to Github, by going to https://github.com/kaspergrubbe/grubruby-jemalloc/releases and clicking "Draft new release".
- Finally build and push everything: `ruby tools/build.rb build push`.

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
