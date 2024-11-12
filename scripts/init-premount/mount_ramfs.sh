#!/bin/sh

# This replaces the mountroot() in /scripts/local
#
# Enable this script with:
# cat mount_ramfs.sh >> /scripts/local
#

mountroot() {
    # Normal setup, copied from local/mountroot
    local_top
    local_device_setup "${ROOT}" "root file system"
    ROOT="${DEV}"
    local_premount
    checkfs "${ROOT}" root "${FSTYPE}"

    # Custom setup
    mount -t ramfs ramfs /root
    mkdir /oldroot
    mount -r ${FSTYPE:+-t "${FSTYPE}"} ${ROOTFLAGS} "${ROOT}" "/oldroot"
    echo "Copying root to ramfs..."
    cp -a /oldroot/. /root/
    umount /oldroot
    echo "Root copied to ramfs"
}
