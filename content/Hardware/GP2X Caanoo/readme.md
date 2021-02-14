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

* Copy extracted firmware to the root folder of a SD card.
* Insert SD card
* Boot while press `R`
* Release `R` when "Firmware upgrading..." message appears

> If "Bootloader was updated" message appears repeat boot procedure.
> The message "Firmware Upgrade Complete" turns up as soon as upgrade is complete.

## Kernel

The kernel source for kernel 2.6.24 is available at [openhandhelds.org](https://dl.openhandhelds.org/cgi-bin/caanoo.cgi?0,0,0,0,42)
but at least for me I had some weird character issues therefore I cleaned up the source and applied
all changes to the upstream linux-stable repository on [github](https://github.com/esno/linux-gp2x-caanoo).
