#!/bin/sh

NAME="libobuild"
ID=$(docker ps -aq -f "name=${NAME}")

[ "${ID}" ] && docker stop ${ID} && docker rm ${ID}

docker run \
  --name ${NAME} \
  --cap-add SYS_ADMIN \
  --security-opt apparmor:unconfined \
  --user $(id -u):$(id -g) \
  -v $PWD/libreoffice:/libreoffice \
  libo-build \
  /bin/bash -c 'cd /libreoffice && ./autogen.sh && make' 2>&1 | tee log.$(date "+%Y%m%d-%H%M%S")
