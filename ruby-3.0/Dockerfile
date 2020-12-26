################################################################################
# Normal Ruby-build blatantly stolen from:
#   https://github.com/docker-library/ruby/blob/defb10adcd6dd2178be3cd9c884fd035b52d42fb/2.4/buster/slim/Dockerfile
#
# .. but with added jemalloc!
################################################################################
ARG BASE_IMAGE=

ARG BUILDJEMALLOC_IMAGE=
FROM $BUILDJEMALLOC_IMAGE as buildjemalloc_image

FROM $BASE_IMAGE

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

ENV LANG C.UTF-8
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
  ruby -e 'exit(Gem::Version.create(ENV["RUBYGEMS_VERSION"]) >= Gem::Version.create(Gem::VERSION))' && \
  gem update --system "$RUBYGEMS_VERSION" && \
  gem install bundler --version "$BUNDLER_VERSION" --force && \
# verify we have no "ruby" packages installed
  ! dpkg -l | grep -i ruby && \
  [ "$(command -v ruby)" = '/usr/local/bin/ruby' ] && \
# rough smoke test
  ruby --version && \
  gem --version && \
  bundle --version && \
  ruby -e "puts Integer::GMP_VERSION"

# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_BIN="$GEM_HOME/bin" \
  BUNDLE_SILENCE_ROOT_WARNING=1 \
  BUNDLE_APP_CONFIG="$GEM_HOME"
# path recommendation: https://github.com/bundler/bundler/pull/6469#issuecomment-383235438
ENV PATH $BUNDLE_BIN:$PATH
# adjust permissions of a few directories for running "gem install" as an arbitrary user
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME" && \
  mkdir -p "$BUNDLE_BIN" && chmod 777 "$BUNDLE_BIN"

################################################################################
# Add in Jemalloc libraries
################################################################################
COPY --from=buildjemalloc_image /usr/local/lib/libjemalloc3.6.0.so /usr/local/lib/libjemalloc3.so
COPY --from=buildjemalloc_image /usr/local/lib/libjemalloc4.5.0.so /usr/local/lib/libjemalloc4.so
COPY --from=buildjemalloc_image /usr/local/lib/libjemalloc5.2.1.so /usr/local/lib/libjemalloc5.so

# Test Jemalloc with LD_PRELOAD
RUN MALLOC_CONF="stats_print:true" \
  LD_PRELOAD="/usr/local/lib/libjemalloc3.so" \
  ruby -e "exit" 2>&1 | grep "3.6.0-0"
RUN MALLOC_CONF="stats_print:true" \
  LD_PRELOAD="/usr/local/lib/libjemalloc4.so" \
  ruby -e "exit" 2>&1 | grep "4.5.0-0"
RUN MALLOC_CONF="stats_print:true" \
  LD_PRELOAD="/usr/local/lib/libjemalloc5.so" \
  ruby -e "exit" 2>&1 | grep "5.2.1-0"

CMD [ "irb" ]
