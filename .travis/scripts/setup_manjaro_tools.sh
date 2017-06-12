#!/bin/bash
# setup_manjaro_tools.sh: to setup manjaro tools for building packages

# build and install manjaro-tools
/bin/echo -e '\x1b[32m Setting up manjaro-tools: \x1b[0m \n'
MANJARO_TOOLS_VER=0.15.2
wget -Nc https://github.com/manjaro/manjaro-tools/archive/${MANJARO_TOOLS_VER}.tar.gz
tar xf ${MANJARO_TOOLS_VER}.tar.gz
cd manjaro-tools-${MANJARO_TOOLS_VER}
make SYSCONFDIR=/etc PREFIX=/usr
sudo make SYSCONFDIR=/etc PREFIX=/usr install
cd ..
