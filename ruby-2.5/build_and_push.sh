#!/bin/bash
set -euxo pipefail

REPOOWNER="kaspergrubbe"
REPONAME="grubruby-jemalloc"
VERSION="2.5.1"
DOCKERFILE="ruby-2.5/Dockerfile"

if [[ "$PWD" != */grubruby ]]
then
  echo "You need to be in root dir of the repo!"
  exit 1;
fi

echo "Building and pushing ${REPOOWNER}/${REPONAME} version ${VERSION}" \
&& docker build -t ${REPONAME}:${VERSION} -f ${DOCKERFILE} . \
&& docker tag ${REPONAME}:${VERSION} ${REPOOWNER}/${REPONAME}:${VERSION} \
&& docker push ${REPOOWNER}/${REPONAME}:${VERSION}
