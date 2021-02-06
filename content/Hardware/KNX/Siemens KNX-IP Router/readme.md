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

## Reverse Engineering

While watching into the protocol I had access to a Siemens S7-1200
which does not support multicast.

Before we found the direct link interface we had to workaround the missing
multicast layer. Therefore we used a Linux Computer with two network interfaces,
linked them into a network bridge and connected it between the S7 and the IP Router.

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
Additionally I wrote a stupid proxy to translate upd datagrams into
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

## Protocol

### Header

    | length | version | identifier | Total length |
    | 1 byte | 1 byte  | 2 byte     | 2 byte       |

#### Length

Length is the size of the header within the UDP datagram.

#### Version

Describes the protocol version that is used.

Known versions:

    | hex  | version |
    | ---- | ------- |
    | 0x10 | 1.0     |

#### Identifier

The identifier (also known as Service Identifier) defines the message type
that is sent.

Known identifier:

    | hex    | type                          |
    | ------ | ----------------------------- |
    | 0x0201 | Search Request                |
    | 0x0202 | Search Response               |
    | 0x0203 | Description Request           |
    | 0x0204 | Description Response          |
    | 0x0205 | Connect Request               |
    | 0x0206 | Connect Response              |
    | 0x0207 | Connection State Request      |
    | 0x0208 | Connection State Response     |
    | 0x0209 | Disconnect Request            |
    | 0x020a | Disconnect Response           |
    | 0x020b | Search Request Extended       |
    | 0x0310 | Configuration Request         |
    | 0x0311 | Configuration Acknowledgement |
    | 0x0420 | Tunneling Request             |
    | 0x0421 | Tunneling Acknowledgement     |
    | 0x0530 | Routing Indication            |

#### Total length

The total length describes the length of the whole UDP datagram (incl. header).

> payload length = total length - header length
