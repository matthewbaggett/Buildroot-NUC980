#! /bin/bash

# Build container and tag as latest
docker build \
    -t buildroot .
docker tag buildroot buildroot:latest

# Run container abd attach current directory
docker run \
    -v /home/arteom/Documents/Buildroot-NUC980:/buildroot-docker/MountedBuildroot \
    -it buildroot:latest bash
