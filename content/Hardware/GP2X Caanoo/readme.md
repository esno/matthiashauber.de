# GP2X Caanoo

The GP2X Caanoo (aka. Caanoo) is a linux based handheld video gaming console and portable media player.

    SoC: MagicEyes Pollux VR3520F
    CPU: ARM926EJ 533 MHz (ARMv5TEJ)
    RAM: 128 MB DDR SDRAM (133 MHz)
    Display: 3.5 inch LCD 320x240px (resistive touchscreen)
    Storage:
    Battery: 1850 mAh Li-polymer
             approx. 5/6h game/video playback

You can find further information on [elinux](https://elinux.org/Pollux) like [datasheet](https://elinux.org/images/c/ca/Pollux-datasheet.pdf).

## Update Procedure

Prepare a sdcard with a msdos partition layout. The first partition can be either fat16 or fat32 formatted.
The u-boot bootloader will probe files in the following order when you press `R` while booting the device.

1. polluxb-n35
2. uImage-n35
3. uImageUP
4. update.gz

If one does not exists it will be skipped. The `update.gz` will only be loaded when a `uImageUP` was loaded successfully.
See [u-boot 1.1.6](https://github.com/esno/u-boot-gp2x-caanoo/blob/a60b01e90c6dcf6fd7db323ad014c00d15e70649/common/main.c#L673-L779)
for details.

## Bootloader

The source for the u-boot bootbloader `1.1.6` is available at [openhandhelds.org](https://dl.openhandhelds.org/cgi-bin/caanoo.cgi?0,0,0,0,42,539).
A git repo containing also the u-boot history until `1.1.6` is available on [github](https://github.com/esno/u-boot-gp2x-caanoo).

## Kernel

The source for kernel `2.6.24` is available at [openhandhelds.org](https://dl.openhandhelds.org/cgi-bin/caanoo.cgi?0,0,0,0,42)
but at least for me I had some weird character issues therefore I cleaned up the source and applied
all changes to the upstream linux-stable repository on [github](https://github.com/esno/linux-gp2x-caanoo).
