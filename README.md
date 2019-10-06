Building LibreOffice in Docker
==============================

Docker環境内でビルドするためのDockerfileなどです。


How to use
----------

### Dockerfileをビルド

    $ docker build -t libo-build .

### LibreOfficeソースコードをgit cloneする

    $ git clone https://gerrit.libreoffice.org/core libreoffice

### autogen.inputファイルを編集する

[これ](https://blog.documentfoundation.org/blog/2019/06/12/start-developing-libreoffice-download-the-source-code-and-build-on-linux/)を参考にautogen.inputファイルを編集する。
日本語環境で使うなら、--with-lang=ja は必須。

### ビルドする

    $ ./build.sh

