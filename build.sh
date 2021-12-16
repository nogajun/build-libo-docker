#!/bin/sh

mkdir -p $(pwd)/.cache $(pwd)/.ccache

docker run --rm \
  --name libobuildenv \
  --cap-add SYS_ADMIN \
  --security-opt apparmor:unconfined \
  --user $(id -u):$(id -g) \
  -v "$(pwd)/libreoffice:/usr/src/libreoffice" \
  -v "$(pwd)/.cache:/cache" \
  -v "$(pwd)/.ccache:/ccache" \
  libobuildenv \
  /bin/bash -c 'cd /usr/src/libreoffice && ./autogen.sh && make' 2>&1 | tee log.$(date "+%Y%m%d%H%M%S")
