# Version checks:
- Rubygems versions: https://rubygems.org/pages/download
- Bundler versions: https://rubygems.org/gems/bundler
- Ruby versions: https://www.ruby-lang.org/en/downloads/releases/
- Jemalloc versions: https://github.com/jemalloc/jemalloc/releases

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
