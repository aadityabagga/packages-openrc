#!/bin/bash
# to setup test environment where packages can be built

ORIGINAL_DIR="$(pwd)"

# download script to setup chroot for building
cd "$HOME"
git clone https://github.com/aadityabagga/manjaro-bootstrap.git
sudo manjaro-bootstrap/arch-bootstrap.sh -d "$HOME/pkg_download" manjaro-chroot

# create user for building package
#sudo chroot manjaro-chroot /bin/bash -c "useradd builder"

# setup pacman mirrorlist
# TODO

# initialize pacman
# TODO

# sync pacman
#sudo pacman -Syu
