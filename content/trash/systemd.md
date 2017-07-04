# systemd builtin network

## setup dhcp for interface

    # /etc/systemd/network/50-dhcp.network

    [Match]
    Name=enp1s0

    [Network]
    DHCP=ipv4

## start network services

    systemctl start systemd-networkd.service
    systemctl start systemd-resolved.service
