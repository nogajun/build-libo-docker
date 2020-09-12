FROM debian:buster

LABEL tv.nofuture.name="libo-build" \
      tv.nofuture.version="0.1.1" \
      tv.nofuture.maintainer="Jun Nogata <nogajun@gmail.com>"

ADD sources.list /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive \
    XDG_CACHE_HOME=/cache \
    CCACHE_DIR=/ccache \
    CCACHE_COMPRESS=1 \
    CCACHE_EXEC=/usr/bin/ccache \
    USE_CCACHE=1

RUN apt-get -y update && \
    apt-get -y --no-install-recommends install locales build-essential git gstreamer1.0-libav libkrb5-dev nasm graphviz wget ccache && \
    apt-get -y --no-install-recommends -t buster-backports build-dep libreoffice && \
    rm -rf /var/lib/apt/lists/* && \
    sed -ie 's/# \(en_US.UTF-8 UTF-8\)/\1/g' /etc/locale.gen && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8 && \
    install -m 0777 -d /libreoffice -d /cache -d /ccache && \
    adduser --system --uid 1000 libreoffice && \
    ccache --max-size 32G

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 

WORKDIR /libreoffice
