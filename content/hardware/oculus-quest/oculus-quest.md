# oculus quest

## hardware

    Processor	: AArch64 Processor rev 4 (aarch64)
    processor	: 0
    BogoMIPS	: 38.40
    Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32
    CPU implementer	: 0x51
    CPU architecture: 8
    CPU variant	: 0xa
    CPU part	: 0x801
    CPU revision	: 4

    Hardware	: Qualcomm Technologies, Inc APQ8998

## first steps

install the oculus smartphone app and pair the oculus via bluetooth.

> oculus app requires access to location services. wtf why?!

## developer mode

browse to [oculus website](https://dashboard.oculus.com/organizations/create/) and create a new organization.

> facebook NDA is a nightmare. think about it.

open the app, select the oculus quest, go to settings and enable developer mode

> pro's/con's of devmode?! when/why could be an account locked?


## adb

    # adb devices
    * daemon not running; starting now at tcp:5037
    * daemon started successfully
    List of devices attached
    XXXXXXXXXXXXXX  unauthorized

if your device is listed as unauthorized you need to allow usb debugging.
Put on your headset and allow debugging

    Allow USB debugging?

    The computers RSA key fingerprint is:
    [...]

    [] Always allow from this computer
    [cancel] [ok]

now your oculus should be listed as device

    [root@abacus crito]# adb devices
    List of devices attached
    XXXXXXXXXXXXX  device
