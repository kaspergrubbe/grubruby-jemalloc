ARG IMAGE=
FROM $IMAGE AS bundler

# skip installing gem documentation
RUN mkdir -p /usr/local/etc \
  && { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc

RUN mkdir /app
WORKDIR /app

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
RUN apt-get update && apt-get install -qq -y build-essential git --fix-missing --no-install-recommends && \
git clone http://github.com/mame/optcarrot.git

COPY scripts/run180frames-none.sh run180frames-none.sh
COPY scripts/run180frames-opt.sh  run180frames-opt.sh

# Create a non-root user and a group with the same name
ENV USER_GROUP=optcarrot
RUN groupadd -r ${USER_GROUP} && \
    useradd --home-dir /home/${USER_GROUP} --create-home -g ${USER_GROUP} ${USER_GROUP}
RUN chown -R ${USER_GROUP}:${USER_GROUP} /app/*

# From here onwards, any RUN, CMD, or ENTRYPOINT will be run under the following user instead of 'root'
USER ${USER_GROUP}

ENV LD_PRELOAD=/usr/local/lib/libjemalloc3.so
CMD ["irb"]
