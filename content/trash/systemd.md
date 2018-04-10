# systemd

## setup dhcp on interface

    # /etc/systemd/network/50-dhcp.network

    [Match]
    Name=enp1s0

    [Network]
    DHCP=ipv4

## start network services

    systemctl start systemd-networkd.service
    systemctl start systemd-resolved.service

## systemd daemon-reexec

when systemd service-restart stucks on `systemd-tty-ask-password-agent`

    systemctl daemon-reexec

## coredumps

    # coredump config
    /etc/systemd/coredump.conf.d/
    
    # destination
    /var/lib/systemd/coredump

## lid close event handling

    # /etc/systemd/logind.conf
    HandleLidSwitch=ignore

    systemctl restart systemd-logind.service
