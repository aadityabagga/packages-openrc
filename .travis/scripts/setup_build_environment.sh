#!/bin/bash
# to setup test environment where packages can be built

ORIGINAL_DIR="$(pwd)"
CHROOT_DIR_NAME="manjaro-chroot"
CHROOT_DIR="${HOME}/manjaro-chroot"
CHROOT_BUILD_DIR_NAME="build"
CHROOT_BUILD_DIR="${CHROOT_DIR}/${CHROOT_BUILD_DIR_NAME}"

# download script to setup chroot for building
cd "$HOME"
git clone https://github.com/aadityabagga/manjaro-bootstrap.git
cd manjaro-bootstrap
if [ "$1" = openrc ]; then
	# setup bootstrap config
	[ -e "${ORIGINAL_DIR}/.travis/manjaro-bootstrap-config.sh" ] &&
		cp -v "${ORIGINAL_DIR}/.travis/manjaro-bootstrap-config.sh" config.sh
fi
sudo ./arch-bootstrap.sh -d "$HOME/pkg_download" "${CHROOT_DIR}"
cd -

# copy things forward to a new directory within the chroot
sudo mkdir "${CHROOT_BUILD_DIR}"
sudo chmod -R 777 "${CHROOT_BUILD_DIR}"
cp -a "${ORIGINAL_DIR}" "${CHROOT_BUILD_DIR}"
