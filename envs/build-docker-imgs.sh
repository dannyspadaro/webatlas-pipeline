#! /bin/sh
VERSION=0.5.3

#
# Build local docker images
#
# When using docker the pipleine can use local images or pull them from DockerHub. 
# If you want to build the images yourself you can do it like this:
#
#   cd envs
#   ./build-docker-imgs.sh
#

docker build --platform=linux/amd64 -t dannyspadaro/webatlas-pipeline:${VERSION}-galaxy -f ./Dockerfile .
cd build_config/
docker build --platform=linux/amd64 -t dannyspadaro/webatlas-pipeline-build-config:${VERSION}-galaxy -f ./Dockerfile .
