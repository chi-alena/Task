FROM ubuntu:18.04

# устанавливаем библиотеки для сборки из исходных кодов
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

# устанавливаем libdeflate 1.7 для сборки SAMtools
RUN wget https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.7.tar.gz && \
    tar -xvf v1.7.tar.gz && \
    cd libdeflate-1.7 && \
    make && \
    make install

# устанавливаем SAMtools 1.12
RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 -O samtools.tar.bz2 && \
    tar -xjvf samtools.tar.bz2 && \
    cd samtools-1.12 && \
    ./configure --with-libdeflate && \
    make && \
    make prefix=/usr/local install
