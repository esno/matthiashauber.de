# Kernel

## Useful tools

* [elixir](http://elixir.free-electrons.com/linux/latest/source)

## Writing modules

preparing kernel source:

    git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    git checkout <version>
    git checkout -b <your-branch>

preparing menuconfig:

    # e.g. drivers/hid/Kconfig

    config YOUR_STRING
    tristate "Summary text"
    depends on SOME_OTHER_MODULES
    default n|y|m
    ---help---
    your additional info
    in multiple lines

preparing Makefile:

    # e.g. drivers/hid/Makeconfig

    obj-$(CONFIG_YOUR_STRING)		+= your-cfile.o

## Beating the kernel

### Magic sysrq's

Press `Alt`+`SysRq`

> `SysRq` is often located at `Print`

* `space` = print summary of available SysRq keys
* `m` = print the current memory information to the console

### Unbind/Bind hardware to/from modules

    echo -n "xxxx:yyyy:zzzz.aaaa" > /sys/bus/hid/drivers/generic-usb/unbind
    echo -n "xxxx:yyyy:zzzz.aaaa" > /sys/bus/hid/drivers/hid-foo/bind

### Coredumps

    cat /proc/sys/kernel/core_pattern
    |/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %e

command/location to store coredump files

### Suspend to ram

    echo mem > /sys/power/state

### Networking

Dealing with the limits of too much concurrent connections.

#### Outgoing

    # gather port range for local/dynamic sockets.
    sysctl net.ipv4.ip_local_port_range
    # gather tcp connection timeout. socket is in TIME_WAIT.
    sysctl net.ipv4.tcp_fin_timeout

    ip_local_port_range / tcp_fin_timeout = sockets_per_second

#### Incoming

    # gather the maximum number of requests queued to a listen socket.
    sysctl net.core.somaxconn
