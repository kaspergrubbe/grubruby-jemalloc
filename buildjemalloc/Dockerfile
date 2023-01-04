################################################################################
# Build and compile Jemalloc
################################################################################
ARG BASE_IMAGE=

FROM $BASE_IMAGE
  ARG DEBIAN_FRONTEND=noninteractive
  RUN apt-get update \ 
    && apt-get install -qq -y wget build-essential --fix-missing --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

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

  ENV JEMALLOC_5_3_SHA256 2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa
  RUN mkdir /jemalloc-new && cd /jemalloc-new && \
        wget https://github.com/jemalloc/jemalloc/releases/download/5.3.0/jemalloc-5.3.0.tar.bz2 && \
        echo "$JEMALLOC_5_3_SHA256 *jemalloc-5.3.0.tar.bz2" | sha256sum -c - && \
        tar -xjf jemalloc-5.3.0.tar.bz2 && cd jemalloc-5.3.0 && ./configure --prefix=/usr/local --with-install-suffix=5.3.0 && make build_lib && make install_lib && \
        cd / && rm -rf /jemalloc-new

