# ufw

## enable / disable

    ufw disable
    ufw enable
    
## drop icmp

    # /etc/ufw/before.rules
    # remove this line
    -A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT
    
    # /etc/ufw/before6.rules
    # remove this line
    -A ufw6-before-input -p icmp6 --icmpv6-type echo-request -j ACCEPT
