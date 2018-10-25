#!/bin/bash
set -euxo pipefail

REPOOWNER="kaspergrubbe"
REPONAME="grubruby-jemalloc"
VERSION="2.4.4.8001"
DOCKERFILE="ruby-2.4/Dockerfile"

if [ ! -f $DOCKERFILE ]; then
  echo "Can't find $DOCKERFILE, are you in the repo root?"
  exit 1;
fi

echo "Building and pushing ${REPOOWNER}/${REPONAME} version ${VERSION}" \
&& docker build --compress --tag ${REPONAME}:${VERSION} --file ${DOCKERFILE} . \
&& docker tag ${REPONAME}:${VERSION} ${REPOOWNER}/${REPONAME}:${VERSION} \
&& docker push ${REPOOWNER}/${REPONAME}:${VERSION}
