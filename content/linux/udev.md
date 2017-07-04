# dealing with device node permissions

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1234", ATTRS{idProduct}=="1234", GROUP="users", MODE="660"
