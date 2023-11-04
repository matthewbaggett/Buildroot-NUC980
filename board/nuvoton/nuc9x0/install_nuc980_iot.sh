#!/bin/sh
cp -a ../board/nuvoton/nuc9x0/quectel-CM output/target/usr/bin

# Copy rootfs.tar and umage to mounted directory
echo 'Copying rootfs.tar and uImage to mounted directory...'
rm ../../../../buildroot-docker/MountedBuildroot/rootfs.tar
rm ../../../../buildroot-docker/MountedBuildroot/uImage
cp /Buildroot-NUC980/buildroot/output/images/rootfs.tar /buildroot-docker/MountedBuildroot/
cp /Buildroot-NUC980/buildroot/output/images/uImage /buildroot-docker/MountedBuildroot/

# TODO: Run install script to flash image to sdcard
