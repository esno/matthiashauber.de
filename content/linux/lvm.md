# lvm

## mounting partitions inside of a lv

    kartpx -a /dev/mapper/vg0-lvname
    losetup /dev/loop0 /dev/mapper/vg0-lvname1
    mount /dev/loop0 /mnt

    # other way around
    umount /dev/loop0
    losetup -d /dev/loop0
    kpartx -d /dev/mapper/vg0-lvname
