#!/bin/sh

set -e

case "${1}" in
  prereqs)
    exit 0
    ;;
esac

. /usr/share/initramfs-tools/hook-functions

# Add overlay kernel module
manual_add_modules overlay