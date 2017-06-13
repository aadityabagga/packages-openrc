#!/bin/bash
# to build specified packages

# commit range for which we are checking package changes
COMMIT_RANGE=$1

# regenerate packages to build in case we are in a chroot
# assuming we are in base git directory (packages-openrc)
/bin/bash .travis/scripts/changed_packages.sh $COMMIT_RANGE > /dev/null

# get the changed packages
PKGS=$(cat /tmp/packages_changed.txt)

# for testing
echo ${PKGS}

# there are special flags for init system
INIT=$2
BUILDPKG_FLAGS=
[ "$INIT" = openrc ] && BUILDPKG_FLAGS="-u"

# import common functions
. .travis/scripts/functions.sh

# build the changed packages
for pkg in ${PKGS}; do
	[ ! -e "$pkg" ] && continue  # package probably deleted
	#cd "${pkg}"
	travis_fold start "build_${pkg}"
	echo "building $pkg"
	travis_ping start "$pkg" # since we are redirecting to log file
	buildpkg -c "$BUILDPKG_FLAGS" -b unstable -p "$pkg" >> /tmp/build_${pkg}.log
	travis_ping stop
	#echo "last 200 lines of log"
	#tail -n 200 /tmp/build_${pkg}.log
	travis_fold end "build_${pkg}"
	#cd ..
done
