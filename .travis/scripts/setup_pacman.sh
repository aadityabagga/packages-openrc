#!/bin/bash
# setup_pacman.sh: to setup pacman so that packages could be built

# build and install pacman
/bin/echo -e '\x1b[32m Setting up pacman: \x1b[0m \n'
PACMAN_VER=5.0.2
wget -Nc https://sources.archlinux.org/other/pacman/pacman-${PACMAN_VER}.tar.gz
tar xf pacman-${PACMAN_VER}.tar.gz
cd pacman-${PACMAN_VER}
./configure --prefix=/usr --sysconfdir=/etc --disable-doc
make
sudo make install
cd ..
