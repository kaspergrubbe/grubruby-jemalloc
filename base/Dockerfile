FROM debian:buster-slim
  ARG DEBIAN_FRONTEND=noninteractive
  RUN apt-get update \ 
    && apt-get install -qq -y ca-certificates --fix-missing --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
