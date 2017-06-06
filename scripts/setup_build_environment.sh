#!/bin/bash
# to setup test environment where packages can be built

ORIGINAL_DIR="$(pwd)"

# download script to setup chroot for building
cd "$HOME"
git clone https://github.com/aadityabagga/manjaro-bootstrap.git
sudo manjaro-bootstrap/arch-chroot manjaro-chroot

# setup pacman mirrorlist
# TODO

# initialize pacman
# TODO

# sync pacman
#sudo pacman -Syu
