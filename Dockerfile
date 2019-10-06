FROM debian:buster

LABEL tv.nofuture.name="libo-build" \
      tv.nofuture.version="0.1" \
      tv.nofuture.maintainer="Jun Nogata <nogajun@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive 

ADD sources.list /etc/apt/sources.list

RUN apt-get -y update && \
    apt-get -y --no-install-recommends install build-essential git libkrb5-dev graphviz wget vim && \
    apt-get -y -t buster-backports build-dep libreoffice && \
    rm -rf /var/lib/apt/lists/*

RUN install -m 0777 -d /libreoffice && \
    adduser --system --uid 1000 libreoffice

WORKDIR /libreoffice
