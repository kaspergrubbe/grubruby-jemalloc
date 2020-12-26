FROM debian:buster-slim
  ARG DEBIAN_FRONTEND=noninteractive
  RUN set -eux && \
    apt-get update \
    && apt-get install -qq -y --no-install-recommends --fix-missing \
      ca-certificates \
      bzip2 \
      libffi-dev \
      libgmp-dev \
      libssl-dev \
      libyaml-dev \
      procps \
      zlib1g-dev \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

  # skip installing gem documentation
  RUN set -eux && \
    mkdir -p /usr/local/etc && \
    { \
      echo 'install: --no-document'; \
      echo 'update: --no-document'; \
    } >> /usr/local/etc/gemrc
