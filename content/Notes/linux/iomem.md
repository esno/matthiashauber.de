# Dumping BIOS

A short investigation in x86 architecture states out that the very first bytes in memory address are
more or less standardized and linux kernel provides `/proc/iomem` as the systems memory map.

    grep ROM /proc/iomem
    000f0000-000fffff : System ROM

So that map shows that System ROM is located at registers mapped to address space `0x000f0000` to `0x000fffff`
which should be the case for most x86 devices because this seems to be x86 architecture specific.

Well, the address space reserved for System ROM is 64k (65535). Since System ROM starts
at `0x000f0000` we have to skip the first 15 blocks and dump the whole 64k.

    dd if=/dev/mem of=/tmp/pcbios.rom bs=64k skip=15 count=1

One may experience access permission issues like

    dd if=/dev/mem of=/tmp/pcbios.rom bs=64k skip=15 count=1
    dd: reading `/dev/mem': Operation not permitted

which I faced e.g. on Ubuntu 20.04. I'm pretty not sure which subsystem blocked that access and
I was too lazy to dig into it just for the sake. I'm not using Ubuntu that much but it's
perfect when it comes to compatibility tests on new bought hardware. If one figures out whether
it was a kernel lockdown or something else please spot that out and I will come back to it.

As for now I know it's unrelated to `CONFIG_DEVMEM_STRICT` which I already disabled on boot via
appending `strict-devmem=0` to kernel arguments line. Afterwards I noticed that a strict devmem
module should restrict access while reading more than 1MB from `/dev/mem`. We're reading 64k.

Nevertheless I switched over to another live distro that's more - let's say - developer friendly
in that specific case and tried it again.
