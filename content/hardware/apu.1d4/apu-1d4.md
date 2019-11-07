# APU.1D4

## hardware

    CPU: AMD T40E (2 x 1,0 GHz)
    RAM: 4GB (DDR3-1066 DRAM)

    Connector:  3 x Realtek RTL8111E Gigabit
                1 x mSATA 6 GBit/s
                1 x SATA 6 GBit/s
                2 x miniPCIe for mSATA
                1 x miniPCIe for gsm/umts/lte (optional)
                1 x miniPCIe for wifi (optional)
                2 x USB2.0 (internal)
                2 x USB2.0 (external)
                1 x RS232 (serial console)

    BIOS: Coreboot Open Source System BIOS

    Power Supply: 12V / 2.0A (5.5mm/2.5mm)

## OPNsense

The APU.1D4 board is nice for a semi-professional firewall. To install [OPNsense](https://www.opnsense.org) download the **amd64 serial** image type from the mirror of your choice.

    $ screen /dev/ttyUSB0 115200
    # login with root / opnsense
    # press 8 for shell
    /usr/local/etc/rc.installer
