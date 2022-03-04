#!/bin/bash

check() {
    # including a module dedicated to live environments in a host-only initrd doesn't make sense
    [[ $hostonly ]] && return 1
    return 255
}

depends() {
    echo dmsquash-live
    return 0
}

install() {
    inst_multiple awk basename blkid cat grep mkdir mkfs.btrfs mkfs.ext4 mkfs.xfs mount parted readlink rmdir tr umount
    # shellcheck disable=SC2154
    inst_hook pre-udev 25 "$moddir/create-overlay-genrules.sh"
    inst_script "$moddir/create-overlay.sh" "/sbin/create-overlay"
    dracut_need_initqueue # Do I need this? I think I do...
}
