#!/bin/sh

TAG=$1

docker buildx create --use --config /etc/buildkitd.toml
docker buildx inspect --bootstrap

docker buildx build . -t registry.container-registry:5000/$TAG --push