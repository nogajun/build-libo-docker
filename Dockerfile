FROM debian:bullseye

LABEL tv.nofuture.name="libobuildenv" \
      tv.nofuture.version="0.1.3" \
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
    apt-get -y --no-install-recommends -t bullseye-backports build-dep libreoffice && \
    rm -rf /var/lib/apt/lists/* && \
    sed -ie 's/# \(en_US.UTF-8 UTF-8\)/\1/g' /etc/locale.gen && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8 && \
    install -m 0777 -d /usr/src/libreoffice -d /cache -d /ccache && \
    adduser --system --uid 1000 libreoffice && \
    echo "max_size = 32.0G" > /etc/ccache.conf 

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 

WORKDIR /usr/src/libreoffice

