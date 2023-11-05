#!/bin/sh
cp -a ../board/nuvoton/nuc9x0/quectel-CM output/target/usr/bin

# Copy rootfs.tar and umage to mounted directory
echo 'Copying rootfs.tar and uImage to mounted directory...'
rm ../../../../buildroot-docker/MountedBuildroot/rootfs.tar
rm ../../../../buildroot-docker/MountedBuildroot/uImage

# These two commands should only run in docker container
if [[ -z $IN_DOCKER ]]; then
    cp /Buildroot-NUC980/buildroot/output/images/rootfs.tar /buildroot-docker/MountedBuildroot/
    cp /Buildroot-NUC980/buildroot/output/images/uImage /buildroot-docker/MountedBuildroot/
fi

# TODO: Run install script to flash image to sdcard
set -e # Exit shell script if command fails

BOARD_DIR="$(dirname $0)" # Get path to current directory
BOARD_NAME="nuc980_iot" # Board name suffix to genimage config file
GENIMAGE_CFG="${BOARD_DIR}/genimage_${BOARD_NAME}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
ROOTPATH_TMP="$(mktemp -d)"

rm -rf "${GENIMAGE_TMP}"

genimage \
	--rootpath "${ROOTPATH_TMP}"   \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
