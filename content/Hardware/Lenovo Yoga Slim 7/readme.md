# Lenovo Yoga Slim 7

    CPU: AMD Ryzen 7 4800U - Renoir (Zen 2)
         8x1.8GHz (max. 4.2GHz) - 16 Threads
         4MB L2-Cache
         8MB L3-Cache
         10-25W cTDP
    GPU: AMD Radeon RX Vega 8 (integrated)
         8x1.75GHz
    RAM: 16GB LPDDR4X

    Display: 14" IPS (1920x1080px)
             300 Nits
    Camera:  HD infrared

    Wifi: Intel Corporation Wi-Fi 6 AX200
          802.11ax

    Battery: 1mAh (Li-Polymer 60.7Wh)
             up to 17.5 hours

    Weight: 1.4kg

## Boot interrupt keys

    | Key | Description  |
    | --- | ------------ |
    | F2  | Enter BIOS   |
    | F12 | Boot-Manager |

## Journey to BIOS

### Official Download

You can download the bios firmwares from the official lenovo servers:

 - [dmcn32ww](https://download.lenovo.com/consumer/mobiles/dmcn32ww.exe)
 - [dmcn34ww](https://download.lenovo.com/consumer/mobiles/dmcn34ww.exe)

Those files can be extracted with `innoextract`

    $ innoextract dmcn32ww.exe 
    Extracting "Lenovo BIOS Update Utility" - setup data version 5.5.7 (unicode)
     - "code$GetExtractPath/Win64.bat"
     - "code$GetExtractPath/WIN64.exe"
    Done.

    # cd code\$GetExtractPath 
    # 7z x WIN64.exe -o bios
    
    7-Zip [64] 16.02 : Copyright (c) 1999-2016 Igor Pavlov : 2016-05-21
    p7zip Version 16.02 (locale=en_US.UTF-8,Utf16=on,HugeFiles=on,64 bits,16 CPUs AMD Ryzen 7 2700X Eight-Core Processor          (800F82),ASM,AES-NI)
    
    Scanning the drive for archives:
    1 file, 6429646 bytes (6279 KiB)
    
    Extracting archive: WIN64.exe
    WARNING:
    WIN64.exe
    Can not open the file as [PE] archive
    The file is open as [7z] archive
    
    --
    Path = WIN64.exe
    Open WARNING: Can not open the file as [PE] archive
    Type = 7z
    Offset = 590965
    Physical Size = 5838681
    Headers Size = 508
    Method = LZMA:24 BCJ
    Solid = +
    Blocks = 2
    
    Everything is Ok    
    
    Archives with Warnings: 1
    Files: 15
    Size:       23024732
    Compressed: 6429646

### Reverse engineering

We need to discover what kind of BIOS is in place for our Yoga device.
Linux kernel provides a DMI interface in sysfs that shows some manufacturer specific strings.
Let's check `/sys/class/dmi/id/bios_*`

    # cat /sys/class/dmi/id/bios_date 
    07/14/2020
    # cat /sys/class/dmi/id/bios_release 
    1.32
    # cat /sys/class/dmi/id/bios_vendor 
    LENOVO
    # cat /sys/class/dmi/id/bios_version 
    DMCN32WW

So kernel says it's from lenovo itself. Maybe we're lucky and Lenovo changed the vendor string while customizing a well known BIOS firmware.

### Extract BIOS

It seems like the downloaded BIOS archive is full of unknown stuff but it shows files called `H2OFFT-Wx64.exe` - the Flash Firmware Tool of [Insyde Software](https://en.wikipedia.org/wiki/Insyde_Software).
Wait, didn't I saw an `insyde-tools` directory in [coreboot/bios_extract](https://github.com/coreboot/bios_extract)? Yarp but narp.
That repo wasn't updated for a long time and ironically the necessary `insyde-tools` are depending on old, outdated, orphaned and long time replaced [lzma utils](https://tukaani.org/lzma/).

#### Fix lzma-utils dependency

    # cd bios_extract/insyde-tools
    # python2 main.py                                                                                                                                                                                                     master
    Traceback (most recent call last):
      File "main.py", line 35, in <module>
        from lzma import get_lzma_chunks
      File "/tmp/bios_extract/insyde-tools/lzma.py", line 89, in <module>
        "Couldn't find `liblzmadec.so`. Please install lzma_utils.\n"
    AssertionError: Couldn't find `liblzmadec.so`. Please install lzma_utils.

I prepared a [PKGBUILD](../../distfiles/lzma-utils/PKGBUILD) to package the last version in [this arch package](../../distfiles/lzma-utils/lzma-utils-4.32.7-1-x86_64.pkg.tar.zst)

    pacman -U lzma-utils-4.32.7-1-x86_64.pkg.tar.zst

#### A lot more issues

    # python2 main.py 
    Reading BIOS data..
    [ --------------------------------------------------------------------------> ] 
    Saving BIOS to 'data/original_bios_backup1.fd' md5:fa2fe61392c18d19ec8407fc642394ea
    Operating on BIOS data/original_bios_backup1.fd size = 0x200000
    Loading compressed sections
     .. found 0 compressed sections
    Locating Firmware Volumes
      .. found 2 FirmwareVolumes (0 compressed)
    Traceback (most recent call last):
      File "main.py", line 473, in <module>
        main()
      File "main.py", line 468, in main
        bios = BIOS()
      File "main.py", line 259, in __init__
        setup_utility = self.locate_setup_utility(vol_compr)
      File "main.py", line 408, in locate_setup_utility
        raise RuntimeError("Shouldn't get here, seems we couldn't "
    RuntimeError: Shouldn't get here, seems we couldn't find the SetupUtility :/

OK, accepted - as for now. Tools are quiet old and things changed - probably the fact that laptops are badly supported in all bios related things
will be a point here as well.

The journey ends here with a dumped bios file that looks good but needs further investigation and understanding of the file format.
