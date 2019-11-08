# link layer discovery protocol

    tcpdump -nnvi eth0 -s 1500 -XX -c 1 'ether proto 0x88cc'

# cisco discovery protocol

    tcpdump -nnvi eth0 -s 1500 -c 1 'ether[20:2] == 0x2000'

# scanning lldp and cdp

    tcpdump -nnvi eth0 -s 1500 -c 1 '(ether[20:2] = 0x2000 or ether[12:2] = 0x88cc)'
