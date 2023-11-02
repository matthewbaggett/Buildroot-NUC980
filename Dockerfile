FROM ubuntu:18.04
ARG CONFIG=nuvoton_nuc980_iot_defconfig

# Two directories - mounted volume /buildroot-out and main working volume /buildroot
RUN mkdir /buildroot-docker
WORKDIR /buildroot-docker

RUN apt update -yqq && apt upgrade -yqq
RUN apt install -yqq \
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
    echo "CONFIG IS $CONFIG" && \
    make defconfig BR2_DEFCONFIG=../nuc_configs/$CONFIG && \
    mkdir -p output/build/image && \
    make
