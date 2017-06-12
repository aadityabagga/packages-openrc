#!/bin/bash
# to build specified packages

# commit range for which we are checking package changes
COMMIT_RANGE=$1

# regenerate packages to build in case we are in a chroot
# assuming we are in base git directory (packages-openrc)
/bin/bash .travis/scripts/changed_packages.sh $COMMIT_RANGE > /dev/null

# get the changed packages
PKGS=$(cat /tmp/packages_changed.txt)

# there are special flags for init system
INIT=$2
BUILDPKG_FLAGS=
[ "$INIT" = openrc ] && BUILDPKG_FLAGS="-x"

# build the changed packages
for pkg in ${PKGS}; do
	[ ! -e "$pkg" ] && continue  # package probably deleted
	echo "building $pkg"
	#cd "${pkg}"
	buildpkg -c "$BUILDPKG_FLAGS" -b unstable -p "$pkg"
	#cd ..
done
