################################################################################
# Jemalloc and Thpoff
################################################################################
FROM debian:buster-slim AS tooling
  RUN apt-get update && apt-get install -qq -y build-essential wget ca-certificates --fix-missing --no-install-recommends

  ENV JEMALLOC_3_SHA256 e16c2159dd3c81ca2dc3b5c9ef0d43e1f2f45b04548f42db12e7c12d7bdf84fe
  RUN mkdir /jemalloc-stable && cd /jemalloc-stable && \
        wget https://github.com/jemalloc/jemalloc/releases/download/3.6.0/jemalloc-3.6.0.tar.bz2 && \
        echo "$JEMALLOC_3_SHA256 *jemalloc-3.6.0.tar.bz2" | sha256sum -c - && \
        tar -xjf jemalloc-3.6.0.tar.bz2 && cd jemalloc-3.6.0 && ./configure --prefix=/usr/local && make && make install && \
        cd / && rm -rf /jemalloc-stable && \
        mv /usr/local/lib/libjemalloc.so /usr/local/lib/libjemalloc3.6.0.so

  ENV JEMALLOC_4_SHA256 9409d85664b4f135b77518b0b118c549009dc10f6cba14557d170476611f6780
  RUN mkdir /jemalloc-new && cd /jemalloc-new && \
        wget https://github.com/jemalloc/jemalloc/releases/download/4.5.0/jemalloc-4.5.0.tar.bz2 && \
        echo "$JEMALLOC_4_SHA256 *jemalloc-4.5.0.tar.bz2" | sha256sum -c - && \
        tar -xjf jemalloc-4.5.0.tar.bz2 && cd jemalloc-4.5.0 && ./configure --prefix=/usr/local --with-install-suffix=4.5.0 && make build_lib && make install_lib && \
        cd / && rm -rf /jemalloc-new

  ENV JEMALLOC_5_SHA256 34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6
  RUN mkdir /jemalloc-new && cd /jemalloc-new && \
        wget https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2 && \
        echo "$JEMALLOC_5_SHA256 *jemalloc-5.2.1.tar.bz2" | sha256sum -c - && \
        tar -xjf jemalloc-5.2.1.tar.bz2 && cd jemalloc-5.2.1 && ./configure --prefix=/usr/local --with-install-suffix=5.2.1 && make build_lib && make install_lib && \
        cd / && rm -rf /jemalloc-new

  # This tool allows us to disable huge page support for our current process
  # since the flag is preserved through forks and execs it can be used on any
  # process
  # Obsolete with Ruby 2.6, according to https://bugs.ruby-lang.org/issues/14705
  ADD source/thpoff.c /src/thpoff.c
  RUN gcc -o /usr/local/bin/thpoff /src/thpoff.c && rm /src/thpoff.c

################################################################################
# Normal Ruby-build blatantly stolen from:
#   https://github.com/docker-library/ruby/blob/defb10adcd6dd2178be3cd9c884fd035b52d42fb/2.4/buster/slim/Dockerfile
#
# .. but with added jemalloc!
################################################################################
FROM debian:buster-slim

RUN set -eux && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    bzip2 \
    ca-certificates \
    libffi-dev \
    libgmp-dev \
    libssl-dev \
    libyaml-dev \
    procps \
    zlib1g-dev \
  && \
  rm -rf /var/lib/apt/lists/*

# skip installing gem documentation
RUN set -eux && \
  mkdir -p /usr/local/etc && \
  { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc

ARG RUBY_MAJOR
ARG RUBY_VERSION
ARG RUBY_DOWNLOAD_SHA256
ARG RUBYGEMS_VERSION
ARG BUNDLER_VERSION

ENV RUBY_MAJOR=${RUBY_MAJOR}
ENV RUBY_VERSION=${RUBY_VERSION}
ENV RUBY_DOWNLOAD_SHA256=${RUBY_DOWNLOAD_SHA256}
ENV RUBYGEMS_VERSION=${RUBYGEMS_VERSION}
ENV BUNDLER_VERSION=${BUNDLER_VERSION}

# some of ruby's build scripts are written in ruby
#   we purge system ruby later to make sure our final image uses what we just built
RUN set -eux && \
  savedAptMark="$(apt-mark showmanual)" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    autoconf \
    bison \
    dpkg-dev \
    gcc \
    libbz2-dev \
    libgdbm-compat-dev \
    libgdbm-dev \
    libglib2.0-dev \
    libncurses-dev \
    libreadline-dev \
    libxml2-dev \
    libxslt-dev \
    make \
    ruby \
    wget \
    xz-utils \
    libjemalloc-dev \
  && \
  rm -rf /var/lib/apt/lists/* && \
  \
  wget -O ruby.tar.xz "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" && \
  echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.xz" | sha256sum --check --strict && \
  \
  mkdir -p /usr/src/ruby && \
  tar -xJf ruby.tar.xz -C /usr/src/ruby --strip-components=1 && \
  rm ruby.tar.xz && \
  \
  cd /usr/src/ruby && \
  \
# hack in "ENABLE_PATH_CHECK" disabling to suppress:
#   warning: Insecure world writable dir
  { \
    echo '#define ENABLE_PATH_CHECK 0'; \
    echo; \
    cat file.c; \
  } > file.c.new && \
  mv file.c.new file.c && \
  \
  autoconf && \
  gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" && \
  ./configure \
    --build="$gnuArch" \
    --disable-install-doc \
    --enable-shared \
    --with-jemalloc \
  && \
  make -j "$(nproc)" && \
  make install && \
  \
  apt-mark auto '.*' > /dev/null && \
  apt-mark manual $savedAptMark > /dev/null && \
  find /usr/local -type f -executable -not \( -name '*tkinter*' \) -exec ldd '{}' ';' \
    | awk '/=>/ { print $(NF-1) }' \
    | sort -u \
    | xargs -r dpkg-query --search \
    | cut -d: -f1 \
    | sort -u \
    | xargs -r apt-mark manual \
  && \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
  \
  cd / && \
  rm -r /usr/src/ruby && \
# make sure bundled "rubygems" is older than RUBYGEMS_VERSION (https://github.com/docker-library/ruby/issues/246)
  ruby -e "puts Gem::Version.create(ENV['RUBYGEMS_VERSION'])" && \
  ruby -e "puts Gem::Version.create(Gem::VERSION)" && \
  ruby -e 'exit(Gem::Version.create(ENV["RUBYGEMS_VERSION"]) > Gem::Version.create(Gem::VERSION))' && \
  gem update --system "$RUBYGEMS_VERSION" && \
  gem install bundler --version "$BUNDLER_VERSION" --force && \
  rm -r /root/.gem/ && \
# verify we have no "ruby" packages installed
  ! dpkg -l | grep -i ruby && \
  [ "$(command -v ruby)" = '/usr/local/bin/ruby' ] && \
# rough smoke test
  ruby --version && \
  gem --version && \
  bundle --version && \
  ruby -r rbconfig -e "RbConfig::CONFIG['LIBS'].include?('jemalloc') ? puts('Ruby is compiled with jemalloc') : abort('JEMALLOC IS MISSING FROM RUBY')" && \
  ruby -e "puts Integer::GMP_VERSION"

# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
  BUNDLE_SILENCE_ROOT_WARNING=1 \
  BUNDLE_APP_CONFIG="$GEM_HOME"
# path recommendation: https://github.com/bundler/bundler/pull/6469#issuecomment-383235438
ENV PATH $GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH
# adjust permissions of a few directories for running "gem install" as an arbitrary user
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"
# (BUNDLE_PATH = GEM_HOME, no need to mkdir/chown both)

################################################################################
#  Add in thpoff and jemalloc libraries
################################################################################
COPY --from=tooling /usr/local/bin/thpoff              /usr/local/bin/thpoff
COPY --from=tooling /usr/local/lib/libjemalloc3.6.0.so /usr/local/lib/libjemalloc3.so
COPY --from=tooling /usr/local/lib/libjemalloc4.5.0.so /usr/local/lib/libjemalloc4.so
COPY --from=tooling /usr/local/lib/libjemalloc5.2.1.so /usr/local/lib/libjemalloc5.so

CMD [ "irb" ]
