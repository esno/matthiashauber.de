# Oculus Quest

## Facebook

At the time of purchase the Oculus Quest it was not required to own a facebook account.
Meanwhile it's - unfortunatelly - required to have one. Since that decision were made
some may cry and remember to promises made by Oculus founder Palmer Luckey.
But all I found was a guarantee on [reddit](https://www.reddit.com/r/oculus/comments/21cy9n/the_future_of_vr/cgbz2vw?utm_source=share&utm_medium=web2x&context=3)
only related to Oculus Rift. Beside of that, facebook changed the game and theres nothing to add.

## Hardware

    Processor       : AArch64 Processor rev 4 (aarch64)
    processor       : 0
    BogoMIPS        : 38.40
    Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32
    CPU implementer : 0x51
    CPU architecture: 8
    CPU variant     : 0xa
    CPU part        : 0x801
    CPU revision    : 4

    Hardware        : Qualcomm Technologies, Inc APQ8998

## First steps

Install the Oculus smartphone app and pair the device via bluetooth.

### Developer mode

The Oculus Quest provides a developer mode for developing applications.
To enable the developer mode browse to [Oculus Dashboard](https://dashboard.oculus.com/organizations/create/)
and create a new organization.

> facebook's NDA is a nightmare. Think about it.

Open the app, select the Oculus Quest, go to settings and enable "Developer mode"

In some place of the agreements there was a note about potential account locking
based on non-defined activities. As for now I'm pretty not sure what may end in a account lock
and how they're monitoring such things.
Maybe it's only related to online activities like cheating. Maybe it's based on an stuff you wrote that becomes popular.

## Android Debug Bridge

    # adb devices
    * daemon not running; starting now at tcp:5037
    * daemon started successfully
    List of devices attached
    XXXXXXXXXXXXXX  unauthorized

If your device is listed as unauthorized you need to allow usb debugging.
Put on your headset and allow debugging

    Allow USB debugging?

    The computers RSA key fingerprint is:
    [...]

    [] Always allow from this computer
    [cancel] [ok]

Now your Oculus Quest should be listed as device

    [root@abacus crito]# adb devices
    List of devices attached
    XXXXXXXXXXXXX  device
