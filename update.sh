#!/bin/bash

set -e

cd "$(dirname "$0")" || exit

sudo cp -a hooks/. /etc/initramfs-tools/hooks/
sudo cp -a scripts/. /etc/initramfs-tools/scripts/

echo "Contents of /etc/initramfs-tools/:"
find /etc/initramfs-tools/
echo ""
echo "Update initramfs..."
sudo update-initramfs -u
echo ""
echo "Contents of initramfs8:"
sudo lsinitramfs /boot/firmware/initramfs8