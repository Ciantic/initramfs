#!/bin/sh

# This replaces the mountroot() in /scripts/local
#
# Enable this script with:
# cat mount_overlay.sh >> /scripts/local
#

mountroot() {
    # Normal setup, copied from local/mountroot
    local_top
    local_device_setup "${ROOT}" "root file system"
    ROOT="${DEV}"
    local_premount
    checkfs "${ROOT}" root "${FSTYPE}"

    # Mount overlay
    mkdir /overlay
    mount -t ramfs ramfs /overlay
    mkdir /overlay/root /overlay/writes /overlay/work
    mount -r ${FSTYPE:+-t "${FSTYPE}"} ${ROOTFLAGS} "${ROOT}" "/overlay/root"
    mount -t overlay overlay -o lowerdir=/overlay/root,upperdir=/overlay/writes,workdir=/overlay/work /root
    echo "Overlay mounted to /"

    # If /root/overlay exists move /overlay inside it
    if [ -d /root/overlay ]; then
        mount -n -o rbind /overlay /root/overlay
        echo "Overlay moved to /overlay"
    else
        echo "Overlay is hidden because /overlay does not exist"
    fi
}
