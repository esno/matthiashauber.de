# KNXnet/IP

KNXnet/IP is a UDP/multicast based protocol. It's default port is `3671`.
It's used to connect and extend KNX lines over IP networks.

Additionally it can be used to add complex logic via applications that are not
directly interfaced with KNX.

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

## Tunnel Protocol

While using a direct connection to a KNXnet/IP device one has to handle connection pools
as well as different channels assigned by the IP router.

Tunnel protocol seems quiet similar to the default protocol except that all messages contain
a channel id that needs to be requested for different purposes.

    | header  | channel | payload |
    | x bytes | 1 byte  | x byte  |
