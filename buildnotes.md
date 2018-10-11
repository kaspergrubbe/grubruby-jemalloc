# How to check a SHA256 for a Ruby version on OSX

```bash
wget -O ruby.tar.xz "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz"
shasum -a 256 ruby.tar.xz
```
