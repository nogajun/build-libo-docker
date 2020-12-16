#!/bin/sh

mkdir -p $PWD/.cache $PWD/.ccache

docker run --rm \
  --name libobuild \
  --cap-add SYS_ADMIN \
  --security-opt apparmor:unconfined \
  --user $(id -u):$(id -g) \
  -v $PWD/libreoffice:/libreoffice \
  -v $PWD/.cache:/cache \
  -v $PWD/.ccache:/ccache \
  nogajun/libodev \
  /bin/bash -c 'ccache --max-size 32G;cd /libreoffice && ./autogen.sh && make' 2>&1 | tee log.$(date "+%Y%m%d%H%M%S")
