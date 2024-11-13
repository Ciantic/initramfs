#!/bin/sh

set -e

case "${1}" in
  prereqs)
    exit 0
    ;;
esac

. /scripts/functions



while true; do

    # Prompt user for action
    echo "You are in the pre-mount stage. What would you like to do?"
    echo "1) Mount /root as ramfs"
    echo "2) Mount /root as overlay"
    echo "3) Drop to a shell"
    echo "*) Continue booting"
    echo "Choice (5 second timeout): "
    choice=$(bash -c "read -t 5 choice; echo \$choice")

    case "${choice}" in 
        1)
            cat /scripts/init-premount/mount_ramfs.sh >> /scripts/local
            break
            ;;
        2)
            cat /scripts/init-premount/mount_overlay.sh >> /scripts/local
            break
            ;;
        3)
            panic "Dropping to shell!"
            break
            ;;
        *)
            break
            ;;
    esac
done