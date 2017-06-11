#!/bin/bash
# to build the packages after entering into the chroot

CHROOT_DIR_NAME="manjaro-chroot"
CHROOT_DIR_LOC="${HOME}/manjaro-chroot"
CHROOT_BUILD_DIR_NAME="build"
CHROOT_BUILD_DIR_LOC="${CHROOT_DIR_LOC}/${CHROOT_BUILD_DIR_NAME}"

# chroot!
DEST=${CHROOT_DIR_LOC}
sudo mount -t proc proc $DEST/proc/
sudo mount -t sysfs sys $DEST/sys/
sudo mount -o bind /dev $DEST/dev/
sudo mount -o bind /run $DEST/run/
sudo cp /etc/resolv.conf $DEST/etc/resolv.conf
sudo chroot "${CHROOT_DIR_LOC}" /bin/bash -c "cd build/packages-openrc; /bin/bash scripts/setup_chroot_environment.sh"
sudo chroot "${CHROOT_DIR_LOC}" /bin/bash -c "cd build/packages-openrc; /bin/bash scripts/build_packages.sh"

# cleanup
sudo umount $DEST/proc/
sudo umount $DEST/sys/
sudo umount $DEST/dev/
sudo umount $DEST/run/
