#!/bin/bash
# to setup test environment where packages can be built

ORIGINAL_DIR="$(pwd)"
CHROOT_DIR_NAME="manjaro-chroot"
CHROOT_DIR_LOC="${HOME}/manjaro-chroot"
CHROOT_BUILD_DIR_NAME="build"
CHROOT_BUILD_DIR_LOC="${CHROOT_DIR_LOC}/${CHROOT_BUILD_DIR_NAME}"

# download script to setup chroot for building
cd "$HOME"
git clone https://github.com/aadityabagga/manjaro-bootstrap.git
sudo manjaro-bootstrap/arch-bootstrap.sh -d "$HOME/pkg_download" manjaro-chroot

# copy things forward to a new directory within the chroot
sudo mkdir "${CHROOT_BUILD_DIR_LOC}"
sudo chmod -R 777 "${CHROOT_BUILD_DIR_LOC}"
cp -a "${ORIGINAL_DIR}" "${CHROOT_BUILD_DIR_LOC}"

# create user for building package
#sudo chroot manjaro-chroot /bin/bash -c "useradd builder"

# setup pacman mirrorlist
# TODO

# initialize pacman
# TODO

# sync pacman
#sudo pacman -Syu
