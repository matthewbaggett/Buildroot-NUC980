FROM ubuntu:latest

# Two directories - mounted volume /buildroot-out and main working volume /buildroot
RUN mkdir /buildroot-docker

RUN apt update && apt upgrade -y
RUN apt install -y \
    bc \
    build-essential \
    cpio \
    cvs \
    file \
    gcc-arm-linux-gnueabi \
    git \
    libncurses-dev \
    make \
    mercurial \
    rsync \
    subversion \
    unzip \
    vim \
    wget 
RUN git clone https://github.com/Arteom26/Buildroot-NUC980
WORKDIR /Buildroot-NUC980
RUN git submodule init && git submodule update

# Symlink arm-linux-gnueabi- to arm-linux-
RUN ln -s /bin/arm-linux-gnueabi-gcc /bin/arm-linux-gcc
RUN ln -s /bin/arm-linux-gnueabi-ar /bin/arm-linux-ar
RUN ln -s /bin/arm-linux-gnueabi-ld /bin/arm-linux-ld
RUN ln -s /bin/arm-linux-gnueabi-objcopy /bin/arm-linux-objcopy
RUN ln -s /bin/arm-linux-gnueabi-readelf /bin/arm-linux-readelf
RUN ln -s /bin/arm-linux-gnueabi-objdump /bin/arm-linux-objdump
RUN ln -s /bin/arm-linux-gnueabi-nm /bin/arm-linux-nm
