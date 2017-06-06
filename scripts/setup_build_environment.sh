#!/bin/bash
# to setup test environment where packages can be built

# build and install pacman
/bin/echo -e '\x1b[32m Setting up pacman: \x1b[0m \n'
PACMAN_VER=5.0.2
wget -Nc https://sources.archlinux.org/other/pacman/pacman-${PACMAN_VER}.tar.gz
tar xf pacman-${PACMAN_VER}.tar.gz
cd pacman-${PACMAN_VER}
./configure --disable-doc
make
sudo make install
cd ..

# build and install manjaro-tools
/bin/echo -e '\x1b[32m Setting up manjaro-tools: \x1b[0m \n'
MANJARO_TOOLS_VER=0.15.2
wget -Nc https://github.com/manjaro/manjaro-tools/archive/${MANJARO_TOOLS_VER}.tar.gz
tar xf ${MANJARO_TOOLS_VER}.tar.gz
cd manjaro-tools-${MANJARO_TOOLS_VER}
make
sudo make install
cd ..
