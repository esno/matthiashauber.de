# SteamCMD

The SteamCMD is a command-line version of the Steam client.
It's primary used to install and update various dedicated servers that are available on Steam.

## install the SteamCMD

This guide depends on debian/ubuntu servers, for other distros it should be similar but package names may differ.
Install prerequirements:

    apt-get update
    apt-get install wget lib32gcc1 libc6-i386

Create a new user which will run the server processes

    useradd -d /opt/steam -m -s /bin/bash -u 99 -U steam

Fetch the `SteamCMD` runtime for linux

    su -l steam
    mkdir /opt/steam/steamcmd && cd /opt/steam/steamcmd
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
    tar xzf steamcmd_linux.tar.gz
    exit

    ln -s /opt/steamcmd/steam.sh /usr/local/bin/
    ln -s /opt/steamcmd/steamcmd.sh /usr/local/bin/
    ln -s /opt/steamcmd/linux32 /usr/local/bin

To install a dedicated server you need to find the right Steam app id of the dedicated server.
Here's a list of well-known games

    | Name                   | Game    | Engine | AppId  |
    | ---------------------- | ------- | ------ | ------ |
    | Counter-Strike 1.6     | cstrike | hlds   |     90 |
    | Counter-Strike: Source | cstrike | srcds  | 232330 |
    | Day of Defeat: Source  | dod     | srcds  | 232290 |
