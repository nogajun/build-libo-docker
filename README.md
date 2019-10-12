Build LibreOffice in Docker
===========================

Docker環境内でビルドするためのDockerfileなどです。


How to use
----------

### Dockerイメージをpullする

    $ docker pull nogajun/libodev

### LibreOfficeソースコードをgit cloneする

ソースコードのクローンは恐ろしいぐらい時間がかかります。（遅いと半日かかるレベル）ちょっと試してみたいという人は、 --depth 1 オプションをつけてクローンしてください。これなら、30分ほどでソースコードを持ってくることができます。

お試しの場合（30分コース）

    $ git clone --depth 1 git://gerrit.libreoffice.org/core libreoffice

完全にクローンする場合（半日ぐらいコース）

    $ git clone https://gerrit.libreoffice.org/core libreoffice

### autogen.inputファイルを編集する

[これ](https://blog.documentfoundation.org/blog/2019/06/12/start-developing-libreoffice-download-the-source-code-and-build-on-linux/)を参考にautogen.inputファイルを編集する。
日本語環境で使うなら、--with-lang=ja は必須。

### LibreOfficeをビルドする

    $ docker run --rm --name libobuild --cap-add SYS_ADMIN --security-opt apparmor:unconfined --user $(id -u):$(id -g) -v $PWD/libreoffice:/libreoffice nogajun/libodev /bin/bash -c 'cd /libreoffice && ./autogen.sh && make' 2>&1 | tee log.$(date "+%Y%m%d%H%M%S")

もしくは、このリポジトリにあるbuild.shを使う（上と同じです）

    $ ./build.sh


