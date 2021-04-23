# Novation Launchkey 61 MK3

THe launchkey has a MIDI interface as well as an USB interface providing MIDI.

    $ dmesg
    [172766.911294] usb 1-3: new full-speed USB device number 5 using xhci_hcd
    [172767.250921] usb 1-3: New USB device found, idVendor=1235, idProduct=0137, bcdDevice= 2.00
    [172767.250929] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
    [172767.250932] usb 1-3: Product: Launchkey MK3 61
    [172767.250934] usb 1-3: Manufacturer: Focusrite - Novation
    [172767.250936] usb 1-3: SerialNumber: ****************

    [172767.291001] usb-storage 1-3:1.2: USB Mass Storage device detected
    [172767.291164] scsi host9: usb-storage 1-3:1.2
    [172768.294500] scsi 9:0:0:0: Direct-Access     Novation Onboarding Drive 0.01 PQ: 0 ANSI: 2
    [172768.294776] sd 9:0:0:0: Attached scsi generic sg4 type 0
    [172768.295994] sd 9:0:0:0: [sdd] 384 512-byte logical blocks: (197 kB/192 KiB)
    [172768.296458] sd 9:0:0:0: [sdd] Write Protect is on
    [172768.296462] sd 9:0:0:0: [sdd] Mode Sense: 03 00 80 00
    [172768.297049] sd 9:0:0:0: [sdd] No Caching mode page found
    [172768.297052] sd 9:0:0:0: [sdd] Assuming drive cache: write through
    [172768.341075]  sdd: sdd1
    [172768.344471] sd 9:0:0:0: [sdd] Attached SCSI removable disk

## Bootloader

The bootloader mode allows us to configure and save certain settings.
You can access the bootload by holding `Octave Up` and `Octave Down` while plugging the device in.

As long as the _Easy Start_ is enabled the Launchkey MK3 shows up as a Mass Storage device and provides
a _Getting Started_ guide. This behavior can be disabled in bootloader via pressing `Fixed Chord` button.

### Bootloader version

Press the Scene Launch button `>` (top-right pad) to display the bootloader version.

### Start / Boot

Press Device Select, Device Lock or the Play button to start the application.
