#!/bin/bash
# to build specified packages

# regenerate packages to build in case we are in a chroot
# assuming we are in base git directory (packages-openrc)
/bin/bash scripts/changed_packages.sh

# get the changed packages
PKGS=$(cat /tmp/packages_changed.txt)

# build the changed packages
for pkg in ${PKGS}; do
	echo "building $pkg"
	cd "${pkg}"
	buildpkg -c -b unstable -p "$pkg"
	cd ..
done
