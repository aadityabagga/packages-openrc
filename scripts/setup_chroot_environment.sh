#!/bin/bash
# setup_chroot_environemnt.sh: to setup correct environment *within* the chroot

# setup pacman
pacman -S haveged --noconfirm
haveged -w 1024
pacman-key --init
pacman-key --populate archlinux manjaro
pacman-mirrors -g -c Germany
