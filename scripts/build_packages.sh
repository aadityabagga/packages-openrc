#!/bin/bash
# to build specified packages

PKGS=$(cat /tmp/packages_changed.txt)

for pkg in ${PKGS}; do
	echo "building $pkg"
	cd "${pkg}"
	mkchrootpkg -r "$HOME/manjaro-chroot" -l "$HOME/manjaro-chroot"
	cd ..
done
