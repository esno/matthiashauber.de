# tp-link tapo c100

the tapo c100 is a cheap IP camera - simply said a piece of shit.
let's call it out to be garbage - it is _the_ bad example of an IoT device.

but first things first...

## hardware

the device itself is exists in different variants.
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
* GND
* RX
* TX (oscilator shows typical bootup pattern)


