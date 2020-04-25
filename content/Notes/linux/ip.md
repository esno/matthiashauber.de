# ip utils

## rename interfaces on the fly

    ip link set <iface> down
    ip link set <iface> name new0
    ip link set <iface> up

# bond interfaces

## add interface to bond

    ifenslave bond0 eth0

## drop interface from bond

    ifenslave -d bond0 eth0
