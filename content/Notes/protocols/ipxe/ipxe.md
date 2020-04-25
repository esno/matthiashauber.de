# ipxe

install archlinux via ipxe

    #!ipxe
    dhcp
    kernel http://mirror.ams1.nl.leaseweb.net/archlinux/iso/archboot/latest/boot/vmlinuz_x86_64 archisobasedir=archiso archiso_http_srv=http://mirror.ams1.nl.leaseweb.net/ ip=:::::enp32s0:dhcp
    initrd http://mirror.ams1.nl.leaseweb.net/archlinux/iso/archboot/latest/boot/initramfs_x86_64.img
    boot

install ubuntu xenial via ipxe

    #!ipxe
    dhcp
    set base-url http://archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64
    kernel ${base-url}/linux vga=normal fb=false
    initrd ${base-url}/initrd.gz
    boot
