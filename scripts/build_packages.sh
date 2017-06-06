#!/bin/bash
# to build specified packages

PKGS=$(cat /tmp/packages_changed.txt)

for pkg in ${PKGS}; do
	echo "building $pkg"
	cd "${pkg}"
	makechrootpkg
	cd ..
done
