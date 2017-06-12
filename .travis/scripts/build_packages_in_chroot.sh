#!/bin/bash
# to build the packages after entering into the chroot

CHROOT_DIR_NAME="manjaro-chroot"
CHROOT_DIR_LOC="${HOME}/manjaro-chroot"
CHROOT_BUILD_DIR_NAME="build"
CHROOT_BUILD_DIR_LOC="${CHROOT_DIR_LOC}/${CHROOT_BUILD_DIR_NAME}"

user=$USER

# commit range for which we will be building the packages
COMMIT_RANGE=$1

# chroot!
DEST=${CHROOT_DIR_LOC}
sudo mount -t proc proc $DEST/proc/
sudo mount -t sysfs sys $DEST/sys/
sudo mount -o bind /dev $DEST/dev/
sudo mount -o bind /run $DEST/run/
sudo cp /etc/resolv.conf $DEST/etc/resolv.conf
sudo chroot "${CHROOT_DIR_LOC}" /bin/bash -c "cd build/packages-openrc; /bin/bash .travis/scripts/setup_chroot_environment.sh $user"
sudo chroot "${CHROOT_DIR_LOC}" /bin/bash -c "cd build/packages-openrc; /bin/bash .travis/scripts/build_packages.sh $COMMIT_RANGE"

# cleanup
sudo umount $DEST/proc/
sudo umount $DEST/sys/
sudo umount $DEST/dev/
sudo umount $DEST/run/

# exit based on whether packages got built
BUILT_PKG_DIR="${HOME}/manjaro-chroot/var/cache/manjaro-tools/pkg/unstable/x86_64"
if [ "$(ls -1 ${BUILT_PKG_DIR} | wc -l)" -eq 0 ]; then
	exit 1
else
	exit 0
fi
