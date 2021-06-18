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

# устанавливаем libdeflate 1.7 для сборки SAMtools + устанавливаем SAMtools 1.12
RUN wget https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.7.tar.gz && \
    tar -xvf v1.7.tar.gz && \
    cd libdeflate-1.7 && \
    make && \
    make install && \
    wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 -O samtools.tar.bz2 && \
    tar -xjvf samtools.tar.bz2 && \
    cd samtools-1.12 && \
    ./configure --with-libdeflate && \
    make && \
    make prefix=/usr/local install

# устанавливаем libmaus 0.0.196-release-20150326095654 для сборки biobambam
# устанавливаем biobambam 0.0.191-release-20150401083643
RUN wget https://github.com/gt1/libmaus/archive/refs/tags/0.0.196-release-20150326095654.tar.gz && \
    tar -xvf 0.0.196-release-20150326095654.tar.gz && \
    cd libmaus-0.0.196-release-20150326095654 && \
    autoreconf -i -f && \
    ./configure && \
    make && \
    make prefix=/usr/local install && \
    wget https://github.com/gt1/biobambam/archive/refs/tags/0.0.191-release-20150401083643.tar.gz && \
    tar -xvf 0.0.191-release-20150401083643.tar.gz && \
    cd biobambam-0.0.191-release-20150401083643 && \
    autoreconf -i -f && \
    ./configure --with-libmaus=/usr/local/include/libmaus/ --prefix=${HOME}/biobambam

# экспортируем переменную окружения для того чтобы
# SAMtools искала библиотеки по правильным путям
ENV LD_LIBRARY_PATH=/usr/local/lib
