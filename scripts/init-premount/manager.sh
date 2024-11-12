#!/bin/sh

set -e

case "${1}" in
  prereqs)
    exit 0
    ;;
esac

. /scripts/functions

mount_as_ramfs() {
    echo "mount_ramfs" >> /scripts/local
}

mount_as_overlay() {
    echo "mount_overlay" >> /scripts/local
}

enter_shell() {
    panic "Dropping to shell!"
}


while true; do

    # Prompt user for action
    echo "You are in the pre-mount stage. What would you like to do?"
    echo "1) Mount /root as ramfs"
    echo "2) Mount /root as overlay"
    echo "3) Drop to a shell"
    echo "4) Continue booting"
    echo -n "Choice: "
    read choice

    case "${choice}" in
        1)
            mount_as_ramfs
            break
            ;;
        2)
            mount_as_overlay
            break
            ;;
        3)
            enter_shell
            break
            ;;
        4)
            break
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done