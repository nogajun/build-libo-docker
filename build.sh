#!/bin/sh

mkdir -p $(pwd)/.cache $(pwd)/.ccache

docker run --rm \
  --name libodev \
  --cap-add SYS_ADMIN \
  --security-opt apparmor:unconfined \
  --user $(id -u):$(id -g) \
  --mount type=bind,src=$(pwd)/libreoffice,dst=/usr/src/libreoffice \
  --mount type=bind,src=$(pwd)/.cache,dst=/cache \
  --mount type=bind,src=$(pwd)/.ccache,dst=/ccache \
  libodev \
  /bin/bash -c 'cd /usr/src/libreoffice && ./autogen.sh && make' 2>&1 | tee log.$(date "+%Y%m%d%H%M%S")
