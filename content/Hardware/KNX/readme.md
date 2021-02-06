# KNX (Konnex)

## Devices

Each KNX-device has it's own individual address (unique identifier).
Addresses are represented by two octets:

    | device high octet | device low octet |
    | 1 byte            | 1 byte           |

### Device high octet

    | area code | line code |
    | 4 bit     | 4 bit     |

### Device low octet

The entire device low octet represents the device address.

### Notation

Pattern for an individual device address is `A.L.D`.

Values for `A` (area) and `L` (line) can be 0-15 (`2^4 = 16`)
while value for `D` (device) can be 0-255 (`2^8 = 256`).

> The address `0.0.0` technically possible but not allowed by convention.
