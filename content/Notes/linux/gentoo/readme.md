# gentoo

## Desktop using systemd

### Full disk-encryption

    cat > /etc/portage/package.use/dracut <<EOF
    sys-apps/systemd cryptsetup
    EOF

    emerge -avuNDq world
    emerge -avq dracut

If you're installing gentoo from another live-cd than gentoo you may need to
add `--kver <kernel-version>` and `--no-hostonly` to dracut command.

    dracut -f

Dracut requires some arguments added to the kernel arguments line to identify
the LUKS partition and rootfs.

    root=UUID=<uuid-of-rootfs>
    rd.luks.uuid=luks-<uuid-of-luks-container>
    rd.lvm.vg=<lvm-vg-name>

#### Dracut keymap

Dracut should use `/etc/vconsole.conf` of your rootfs to identify a proper keymap.
Unfortunatelly it seems like there is a bug where Dracut auto-generates this file
on boot and ignores your host-specific settings. To enforce a specific keymap
Dracut will also read the kernel arguments line for a option named `rd.vconsole.keymap`
which can be set to the same value as in `/etc/vconsole.conf`

    rd.vconsole.keymap=de
