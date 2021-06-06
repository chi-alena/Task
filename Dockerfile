FROM ubuntu:18.04

# комментарий что ты делаешь
RUN apt-get update && \
    apt-get install -y \
        autoconf \
        automake \
        make \
        gcc \
        perl \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        libcurl4-gnutls-dev \
        libssl-dev \
        libncurses5-dev \
        libtool \
        pkg-config \
        wget
