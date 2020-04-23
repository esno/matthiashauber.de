# Setup a dedicated server

This guide depends on ubuntu servers, for other distros it should be similar but package names may differ.
Install prerequirements

    apt-get update
    apt-get install wget lib32gcc1 libc6-i386

Fetch the `steamcmd` runtime for linux

    mkdir /opt/steam && cd /opt/steam
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
    tar xzpf steamcmd_linux.tar.gz

    ln -s /opt/steam/steam.sh /usr/local/bin/
    ln -s /opt/steam/steamcmd.sh /usr/local/bin/
    ln -s /opt/steam/linux32 /usr/local/bin

Create a new user which will run the server processes

    useradd -d /var/lib/steam -m -s /bin/bash -u 99 -U steam

To install a dedicated server you need to find the right steam app id of the dedicated server.
Here's a list of well-known games

    | Name                   | Game    | AppId  |
    | ---------------------- | ------- | ------ |
    | Day of Defeat: Source  | dod     | 232290 |
    | Counter-Strike: Source | cstrike | 232330 |

Now you're ready to fetch the dedicated server software

    su -l steam

    export STEAMAPPID="232330"
    export STEAMPORT="27015"

    mkdir -p /var/lib/steam/server
    steamcmd.sh +login anonymous \
      +force_install_dir /var/lib/steam/server/srcds/${STEAMPORT} \
      +app_update ${STEAMAPPID} +quit

## start srcds server

To run the dedicated server just create a [systemd service file](https://github.com/flakispace/ops/blob/master/steam/srcds%40.service).

    wget https://github.com/flakispace/ops/raw/master/steam/srcds%40.service -O /etc/systemd/system/srcds\@.service

    export STEAMPORT="27015"

    systemctl enable srcds@${STEAMPORT}.service
    systemctl start srcds@${STEAMPORT}.service

Additionally create a file `/etc/default/srcds-${STEAMPORT}` and set the variables to your needs

    OPTIONS="-game cstrike -ip 0.0.0.0"
    CONSOLE="+maxplayers 20 +map de_dust2"

> see the games table above to find proper values for `-game` argument

## server configuration

For the generic server configuration create a new `server.cfg`

    # local or public
    sv_lan 0

    # region (3 = europe)
    sv_region 3

    # name of server
    hostname "my awesome dedicated server"

    # password
    sv_password "hello world"

    # rcon password
    rcon_password "do not share"
