# tp-link tapo c100

the tapo c100 is a cheap IP camera - simply said a piece of shit.
let's call it out to be garbage - it is _the_ bad example of an IoT device.

but first things first...

## hardware

the device itself exists in different variants.
here we're talking about the **(EU)/5.0**.

the variant is printed onto the box. close to a barcode and
printed on a sticker at the pcb.

### Ingenic T23

the `Ingenic T23` XBurst-1 is a CPU with 1.2-1.4 GHz and a H.264 encoder.

### WQ9001

the `WQ9001` is a SoC with 2.4 GHz 802.11a/b/g/n wifi and a USB2.0 interface.

> seems to be a RISC-V architecture.

### SPI flash

the `XMC 25QH64C` is a dual/quad SPI flash (64M).
there are many deviations out there. not sure if a change raises a hw rev bump. I guess not since they all seem to be pin compatible.

### UART / serial console

there are 4 remarkable pins in a row close to the `T23` chip (at the edge of the pcb).

* VCC (never tested, should be at 3.3V)
* GND -> yellow cable
* RX -> green cable
* TX -> blue cable (oscilator shows typical bootup pattern)

do not connect Vcc and make sure your serial adaptor is set to 3.3V. baudrate is as usual nowadays `115200`.

## software

let's boot the device and see what's going on. they shipped a sheet of paper with GPL notes so I expect to see u-boot.

we could check the OSS archive they have to provide but let's postpone the paperwork.

first boot and yepp, u-boot shows up :)

### bootloader (u-boot)


    U-Boot SPL 2013.07 (Mar 28 2024 - 20:03:13)
    Board info: T23N
    
    apll_freq = 1200000000
    mpll_freq = 1176000000
    sdram init start
    DDR clk rate 588000000
    DDR_PAR of eFuse: 00000000 00000000
    sdram init finished
    image entry point: 0x80100000

wtf SPL from 2013? how old is this camera? I'd expected to see one from maybe 2018 but ok. it is a factory bootloader, so fine.

    U-Boot 2013.07 (Mar 28 2024 - 20:03:13)
    
    Board: ISVP (Ingenic XBurst T23 SoC)
    DRAM:  64 MiB
    Top of RAM usable for U-Boot at: 84000000
    Reserving 424k for U-Boot at: 83f94000
    Reserving 32784k for malloc() at: 81f90000
    Reserving 32 Bytes for Board Info at: 81f8ffe0
    Reserving 124 Bytes for Global Data at: 81f8ff64
    Reserving 128k for boot params() at: 81f6ff64
    Stack Pointer at: 81f6ff48
    Now running in RAM - U-Boot at: 83f94000
    MMC:   msc: 0
    the manufacturer 20
    SF: Detected XM25QH64C
    
    *** Warning - bad CRC, using default environment
    
    In:    serial
    Out:   serial
    Err:   serial
    gpio_request lable = ir_cut gpio = 57
    Net:   No ethernet found.
    Autobooting in 1 seconds
    Firmware check pass!
    cmd_buf = sf probe;sf read 0x80600000 0x50000 0x20000
    the manufacturer 20
    SF: Detected XM25QH64C
    
    --->probe spend 4 ms
    SF: 131072 bytes @ 0x50000 Read: OK
    --->read spend 47 ms
    ret = 0, dst_len = 167000
    cmd_buf = go 0x820a0000
    ## Starting application at 0x820A0000 ...
    Flush cache all before jump.

eh wait. the bootloader was compiled in 2024? wow! 

    U-Boot 2013.07 (Mar 28 2024 - 20:02:28)
    
    Board: ISVP (Ingenic XBurst T23 SoC)
    DRAM:  64 MiB
    Top of RAM usable for U-Boot at: 84000000
    Reserving 186k for U-Boot at: 83fd0000
    Reserving 32784k for malloc() at: 81fcc000
    Reserving 32 Bytes for Board Info at: 81fcbfe0
    Reserving 124 Bytes for Global Data at: 81fcbf64
    Reserving 128k for boot params() at: 81fabf64
    Stack Pointer at: 81fabf48
    Now running in RAM - U-Boot at: 83fd0000
    MMC:   msc: 0
    the manufacturer 20
    SF: Detected XM25QH64C
    
    *** Warning - bad CRC, using default environment
    
    In:    serial
    Out:   serial
    Err:   serial
    gpio_request lable = ir_cut gpio = 57
    VF: validateFirmwareWithRecover: copying flash to 0x22000000
    the manufacturer 20
    SF: Detected XM25QH64C
    
    --->probe spend 5 ms
    SF: 8388608 bytes @ 0x0 Read: OK
    --->read spend 2742 ms
    VF: validateFirmwareWithRecover: ret=0(81fabe38)
    VF: validateFirmwareWithRecover: validate local firmware...
    TP Header at 22070000
    
    set bootargs to earlyprintk console=ttyS1,115200n8 mem=42M@0x0 rmem=22M@0x2a00000 rootwait nprofile_irq_duration=on rootfstype=squashfs ro mtdparts=spi_nor.0  root=/dev/mtdblock6 rw spdev=/dev/mtdblock7 noinitrd i
    nit=/etc/preinit
    the manufacturer 20
    SF: Detected XM25QH64C
    
    --->probe spend 4 ms
    SF: 2097152 bytes @ 0x70200 Read: OK
    --->read spend 689 ms
    ## Booting kernel from Legacy Image at 80600000 ...
       Image Name:   mips Ingenic Linux-3.10.14
       Image Type:   MIPS Linux Kernel Image (lzma compressed)
       Data Size:    1298460 Bytes = 1.2 MiB
       Load Address: 80010000
       Entry Point:  8031e330
       Verifying Checksum ... OK
       Uncompressing Kernel Image ... OK
    
    Starting kernel ...

why do they load u-boot twice?

### kernel (linux)

    [    0.000000] Linux version 3.10.14 (root@smartlifeci1) (gcc version 5.4.0 (Ingenic Ingenic r3.3.0-gcc540 Smaller Size 2023.05-22) ) #1 PREEMPT Thu Mar 28 20:06:46 CST 2024

I miss the right words to justify this. what the hell...
even the kernel is fucking old. but still compiled in 2024.
seriously here the fun ends.
this is a camera device with integrated microphone.
tapo is advertising it as baby phone.
thounsands of parents installing this in their bedrooms.
I am afraid to expect that all ingenic based cameras are as worse as this...

### vendor firmware updates

the oem firmware mounts a sdcard if attached and tries to load
a file `factory_up_boot.bin`.
don't know yet what the `sys00.bin` might be.

    [2024-03-28 12:07:04] [ERROR] stm_add_disk():6718 - [STM]access sys00.bin fail!
    [2024-03-28 12:07:04] is_firmware_exist():6664 - [STM]no firmware[/tmp/sdcard/factory_up_boot.bin] in sd_card,([2] No such file or directory)

unfortunatelly I wrote the thingino fw to this location and booted the device to see if a easy to use migration exists.
turned out. nope...

    [2024-03-28 20:07:48] [ERROR] fw_file_upgrade():2153 - [UPGRADE]file size: 8388608
    [2024-03-28 20:07:48] [ERROR] check_firmware():1423 - [UPGRADE]Wrong Upgrade Firmware.
    [2024-03-28 20:07:48] [ERROR] fw_file_upgrade():2165 - [UPGRADE]firmware_upgrade add idleworker failed
    [2024-03-28 20:07:48] [ERROR] fw_upgrade_ready_cb():2266 - [UPGRADE]firmware upgrade fail and firmware not changed
    [2024-03-28 20:07:48] ntp_time_update_cb():620 - [SYSTEM]System time is calibrated by SD card.
    [2024-03-28 20:07:48] [ERROR] led_rule_call_handle():112 - [LEDRULE]receive led_state: [12]
    [2024-03-28 20:07:48] [ERROR] sd_upgrade_res_cb():213 - [UPGRADE]sd_upgrade_res_cb, type: 0, id: 359289953
    [2024-03-28 20:07:48] [ERROR] sd_upgrade_res_cb():251 -[UPGRADE]sd firmware upgrade fail, sleep... Please Reboot!

unfortunatelly this seems to brick your device.
so I need to find a new way to free this device.
as of now I need to find a way to factory reset it but there are no official firmware blobs available.
do they hide them behind a weird OTA backend?. I am pretty sure they do.