# Grubruby-jemalloc

This is a collection of Ruby images that builds Ruby with support for jemalloc (`--with-jemalloc`) and also bundles the images with stable releases of jemalloc.

It is also bundled with `thpoff` which can disable huge page support which will be the default in Ruby 2.6 according to https://bugs.ruby-lang.org/issues/14705

Everything here is heavily inspired of how the Discourse project (https://github.com/discourse) are building their Docker images, but the main Dockerfiles are using the base of https://github.com/docker-library/ruby.

## Versioning

`GRUBRUBY_IMAGE_VERSION` starts versioning 8001 to not be confused with Ruby patchlevels. To understand the versioning of these images, we use the following format:

```
RUBY_MAJOR.RUBY_MINOR.RUBY_MINOR.GRUBRUBY_IMAGE_VERSION
```

So if you download version `2.5.1.8001` you are getting Ruby-version `2.5.1` and version `8001` of Grubruby.

## How to use Jemalloc

File locations for Jemalloc is:

- Jemalloc newest stable release version 3: `/usr/local/lib/libjemalloc3.so`
- Jemalloc newest stable release version 4: `/usr/local/lib/libjemalloc4.so`
- Jemalloc newest stable release version 5: `/usr/local/lib/libjemalloc5.so`

To use Jemalloc in your `Dockerfile`, pick a version, and use `ENV LD_PRELOAD`:

```dockerfile
ENV LD_PRELOAD=/usr/local/lib/libjemalloc5.so
```

## Thpoff

File location for thpoff is: `/usr/local/bin/thpoff` you can use it by prepending your command with the binary.

In docker-compose you can do the following:

```yaml
command: ["/usr/local/bin/thpoff", "bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
```
