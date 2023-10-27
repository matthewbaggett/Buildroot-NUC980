FROM ubuntu:latest

# Two directories - mounted volume /buildroot-out and main working volume /buildroot
RUN mkdir /buildroot-docker
WORKDIR /buildroot-docker

RUN apt update && apt upgrade -y
RUN apt install -y \
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
