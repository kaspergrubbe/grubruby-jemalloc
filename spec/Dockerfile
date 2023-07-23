ARG IMAGE=
ARG LD_PRELOAD=

FROM $IMAGE AS bundler
  # Install newest NodeJS from https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
  RUN apt-get update && apt-get install -qq -y curl
  RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -

  RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
  RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list

  # Install dependencies:
  # - build-essential: To ensure certain gems can be compiled
  # - nodejs: Compile assets
  RUN apt-get update && apt-get install -qq -y build-essential nodejs yarn python3 libpq-dev --fix-missing --no-install-recommends

  # skip installing gem documentation
  RUN mkdir -p /usr/local/etc \
    && { \
      echo 'install: --no-document'; \
      echo 'update: --no-document'; \
    } >> /usr/local/etc/gemrc

  RUN mkdir /app
  WORKDIR /app

  COPY Gemfile /app/
  COPY Gemfile.lock /app/

  ARG LD_PRELOAD
  ENV LD_PRELOAD=$LD_PRELOAD

  RUN ruby --version
  RUN gem --version
  RUN bundle --version
  RUN cat Gemfile.lock | grep -A 2 "BUNDLED WITH"

  RUN bundle config set --local jobs 8
  RUN bundle config set --local without 'development test'
  RUN bundle install --verbose

  COPY . /app
  RUN RAILS_ENV=production bundle exec rake assets:precompile

FROM $IMAGE
  COPY --from=bundler /app /app
  COPY --from=bundler /usr/local/bundle/ /usr/local/bundle/

  # For some reason a Rails installation that doesn't serve assets need
  # a javascript engine through ExecJS, let's use Node.
  RUN apt-get update && apt-get install -y nodejs libpq-dev

  # Create a non-root user and a group with the same name
  ENV USER_GROUP=railsapp
  RUN groupadd -r ${USER_GROUP} && \
      useradd --home-dir /home/${USER_GROUP} --create-home -g ${USER_GROUP} ${USER_GROUP}
  RUN mkdir -p /app/logs && \
      mkdir -p /app/tmp && \
      mkdir -p /app/tmp/pids && \
      mkdir -p /app/tmp/sockets && \
      chown -R ${USER_GROUP}:${USER_GROUP} /app/*

  # From here onwards, any RUN, CMD, or ENTRYPOINT will be run under the following user instead of 'root'
  USER ${USER_GROUP}

  WORKDIR /app

  ENV RAILS_ENV=production
  ARG LD_PRELOAD
  ENV LD_PRELOAD=$LD_PRELOAD
  CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
