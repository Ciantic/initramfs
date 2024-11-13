#!/bin/sh

set -e

case "${1}" in
  prereqs)
    exit 0
    ;;
esac

. /usr/share/initramfs-tools/hook-functions

# Add bash
# rm ${DESTDIR}/bin/bash 
copy_exec /usr/bin/bash /bin/bash