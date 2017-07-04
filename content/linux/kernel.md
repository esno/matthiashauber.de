# useful tools

* [elixir](http://elixir.free-electrons.com/linux/latest/source)

# writing modules

preparing kernel source:

    git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    git checkout <version>
    git checkout -b <your-feature-branch>

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

# beating the kernel

## unbind/bind hardware to/from modules

    echo -n "xxxx:yyyy:zzzz.aaaa" > /sys/bus/hid/drivers/generic-usb/unbind
    echo -n "xxxx:yyyy:zzzz.aaaa" > /sys/bus/hid/drivers/hid-foo/bind

## suspend to ram

    echo mem > /sys/power/state

## networking

### client-side

    # gather port range for local/dynamic sockets.
    sysctl net.ipv4.ip_local_port_range
    # gather tcp connection timeout. socket is in TIME_WAIT.
    sysctl net.ipv4.tcp_fin_timeout

    local_port_range / tcp_fin_timeout = sockets per second

### server-side

    # gather the maximum number of requests queued to a listen socket.
    sysctl net.core.somaxconn
