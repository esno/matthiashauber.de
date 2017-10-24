# usb device reverse engineering

    modprobe usbmon

    # determine usbmon interface and device address
    lsusb | grep "<vendorId>:<productId>" | awk -F ':' '{ print $1 }'

## wireshark

Capture traffic on `usbmonX` where X is the busId. Set the filter for your device
via `usb.bus_id == <busId> and usb.device_address == <deviceAddr>`

Setup windows virtual machine, passthrough usb device and install driver and corresponding software.
Now trigger actions while `wireshark` is capturing traffic at linux level.
