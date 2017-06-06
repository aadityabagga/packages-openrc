#!/bin/bash
# to setup test environment where packages can be built

# build and install pacman
PACMAN_VER=5.0.2
wget -Nc https://sources.archlinux.org/other/pacman/pacman-${PACMAN_VER}.tar.gz
tar xvf pacman-${PACMAN_VER}.tar.gz
cd pacman-${PACMAN_VER}
./configure
make
sudo make install
cd ..

# build and install manjaro-tools
git clone --depth=1 https://github.com/manjaro/manjaro-tools.git
cd manjaro-tools
make
sudo make install
cd ..
