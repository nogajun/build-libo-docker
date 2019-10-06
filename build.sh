#!/bin/sh

docker run -it \
  --cap-add SYS_ADMIN \
  --security-opt apparmor:unconfined \
  --user $(id -u):$(id -g) \
  -v $PWD/libreoffice:/libreoffice \
  libo-build \
  /bin/bash -c 'cd /libreoffice && ./autogen.sh && make'
