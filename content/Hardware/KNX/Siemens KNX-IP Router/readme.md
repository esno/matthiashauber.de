# Siemens KNX-IP Router

The Siemens KNX-IP Router (`5WG1 146-1AB02`) is a
bridge to KNX networks.

Right now there are two known methods available to
communicate to the IP Router. Either sending UDP messages
via a preconfigured multicast address or sending UDP
directly to a single IP router.

The first requires an endpoint that supports multicast
the latter requires only UDP support.

If you decide for any reason not to use multicast remember
that your application has to handle more complex messages
and "establish" a connection via a handshake instead of
just sending telegrams.

The IP router will translate and forward directly received
messages via multicast to other devices that are available
within your multicast domain. Therefore you don't have to care
much about how to send messages to all members in your network.

## Trivia

The IP router has to be configured to a multicast IP address (e.g. `224.0.23.12`)
and a static IP or DHCP assigned.

The default port for the KNXnet/IP protocol is `3671/udp`.

## Multicast vs direct connection

Since we want to know what's send on the wire I used a Linux machine with two
network interfaces, linked into a network bridge and connected between the
IP Router and the rest of the devices in the network.

    $ brctl addbr knx0
    $ brctl addif knx0 enp3s0f3u1u2u3
    $ brctl addif knx0 enp3s0f3u1u2u1
    $ brctl show
    bridge name   bridge id             STP enabled     interfaces
    knx0          8000.a69caebd4e66     no              enp3s0f3u1u2u1
                                                        enp3s0f3u1u2u3

    $ ip a add 192.168.9.250/24 dev knx0
    $ ip r add to 224.0.23.12 dev knx0

This setup provides the ability to capture the whole network traffic
between the IP Router and other network devices.

While watching into the protocol I had access to a Siemens S7-1200
which does not support multicast.

The IP router did neither respond nor react to telegrams sent
to the device IP directly. To see if the IP Router responds only to
multicast requests I wrote a stupid proxy to translate those udp datagrams into
multicast messages

    #!/usr/bin/python

    import socket

    UDP_ADDR = '192.168.9.250'
    MCAST_GRP = '224.0.23.12'
    MCAST_PORT = 3671
    
    mcast = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
    mcast.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    mcast.bind((MCAST_GRP, MCAST_PORT))
    
    udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
    udp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    udp.bind((UDP_ADDR, MCAST_PORT))
    
    while (True):
      buffer = udp.recvfrom(1024)
      size = mcast.sendto(buffer[0], (MCAST_GRP, MCAST_PORT))
      print("sent: %d" % (size))

This test proved that our first telegram was properly and the IP router seems to only
respond on multicast.

But there's more. The router accepts directly addressed datagrams as well if you deal
properly with the "tunnel interface".
In case you have to use a direct connection to a KNX-IP router your software stack
has to request a tunnel/channel where telegrams can be send and forwwarded/tunneled
by the router within the multicast domain.

Such channel will be assigned on a tunnel request to the IP router and announced in
it's response. There may multiple channels to be handled since a connection request
will use a different channel than a configuration request.

Long story short: Multicast requests are much simpler than connecting directly to an
IP router because direct connections require more logic in your application stack.
