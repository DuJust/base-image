#!/usr/bin/env bash

set -x
set -e

docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
export REPO=dujust/base-image
export COMMIT=0.0.1
export TAG="latest"
docker build -f Dockerfile -t ${REPO}:${COMMIT} .
docker tag ${REPO}:${COMMIT} ${REPO}:${TAG}
docker push ${REPO}
