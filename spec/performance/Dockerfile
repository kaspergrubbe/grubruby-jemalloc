ARG IMAGE=
FROM $IMAGE

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
RUN apt-get update && apt-get install -qq -y build-essential git libsqlite3-dev --fix-missing --no-install-recommends

COPY . .

# Create a non-root user and a group with the same name
ENV USER_GROUP=benchmark
RUN groupadd -r ${USER_GROUP} && \
    useradd --home-dir /home/${USER_GROUP} --create-home -g ${USER_GROUP} ${USER_GROUP}
RUN chown -R ${USER_GROUP}:${USER_GROUP} /app && \
  chown -R ${USER_GROUP}:${USER_GROUP} /app/*

# From here onwards, any RUN, CMD, or ENTRYPOINT will be run under the following user instead of 'root'
USER ${USER_GROUP}

CMD ["irb"]
