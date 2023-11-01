FROM ubuntu:18.04

# Two directories - mounted volume /buildroot-out and main working volume /buildroot
RUN mkdir /buildroot-docker
WORKDIR /buildroot-docker

RUN apt update && apt upgrade -y
RUN apt install -y \
    bash \
    bc \
    build-essential \
    cpio \
    cvs \
    file \
    libncurses-dev \
    make \
    mercurial \
    rsync \
    subversion \
    unzip \
    wget
COPY . .
ENTRYPOINT ["bash"]
RUN cd buildroot && \
    make defconfig BR2_DEFCONFIG=../nuc_configs/nuvoton_nuc980_iot_defconfig && \
    make
