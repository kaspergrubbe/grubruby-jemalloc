#!/bin/bash
set -euxo pipefail

REPOOWNER="kaspergrubbe"
REPONAME="grubruby-jemalloc"
VERSION="2.4.4.1"

echo "Building and pushing ${REPOOWNER}/${REPONAME} version ${VERSION}" \
&& docker build -t ${REPONAME}:${VERSION} -f Dockerfile . \
&& docker tag ${REPONAME}:${VERSION} ${REPOOWNER}/${REPONAME}:${VERSION} \
&& docker push ${REPOOWNER}/${REPONAME}:${VERSION}
