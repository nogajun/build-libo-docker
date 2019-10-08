#!/bin/sh

docker run --rm -it \
  --name libobuild \
  --cap-add SYS_ADMIN \
  --security-opt apparmor:unconfined \
  --user $(id -u):$(id -g) \
  -v $PWD/libreoffice:/libreoffice \
  nogajun/libodev \
  /bin/bash -c 'cd /libreoffice && ./autogen.sh && make' 2>&1 | tee log.$(date "+%Y%m%d-%H%M%S")
