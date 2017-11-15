# dealing with device node permissions

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1234", ATTRS{idProduct}=="1234", GROUP="users", MODE="660"

# predictable network interface names

how to use oldschool interface names

    # cmdline
    net.ifnames=0 (might also need biosdevname=0)
    
    # since v209
    ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules
    
    # before v209 / eudev
    ln -s /dev/null /etc/udev/rules.d/80-net-name-slot.rules
