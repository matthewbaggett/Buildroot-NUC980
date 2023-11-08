#! /bin/sh

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
