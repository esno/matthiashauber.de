# Setup a dedicated server

This guide depends on ubuntu servers, for other distros it should be similar but package names may differ.
Install prerequirements

    apt-get update
    apt-get install wget lib32gcc1 libc6-i386

Create a new user which will run the server processes

    useradd -d /opt/steam -m -s /bin/bash -u 99 -U steam

Fetch the `steamcmd` runtime for linux

    su -l steam
    mkdir /opt/steam/steamcmd && cd /opt/steam/steamcmd
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
    tar xzf steamcmd_linux.tar.gz
    exit

    ln -s /opt/steamcmd/steam.sh /usr/local/bin/
    ln -s /opt/steamcmd/steamcmd.sh /usr/local/bin/
    ln -s /opt/steamcmd/linux32 /usr/local/bin

To install a dedicated server you need to find the right steam app id of the dedicated server.
Here's a list of well-known games

    | Name                   | Game    | Engine | AppId  |
    | ---------------------- | ------- | ------ | ------ |
    | Counter-Strike 1.6     | cstrike | hlds   |     90 |
    | Counter-Strike: Source | cstrike | srcds  | 232330 |
    | Day of Defeat: Source  | dod     | srcds  | 232290 |

Now you're ready to fetch the dedicated server software

    mkdir -p /opt/{hlds,srcds}
    chown steam:steam /opt/{hlds,srcds}
    su -l steam

    export STEAMAPPID="232330"
    export STEAMPORT="27015"
    export STEAMENGINE="srcds"

    steamcmd.sh +login anonymous \
      +force_install_dir /opt/${STEAMENGINE}/${STEAMPORT} \
      +app_update ${STEAMAPPID} +quit

## start hlds server

To run the dedicated server just create a [systemd service file](https://github.com/flakispace/ops/blob/master/steam/hlds%40.service).

    wget https://github.com/flakispace/ops/raw/master/steam/hlds%40.service -O /etc/systemd/system/hlds\@.service

    export STEAMPORT="27015"

    systemctl enable hlds@${STEAMPORT}.service
    systemctl start hlds@${STEAMPORT}.service

Additionally create a file `/etc/default/hlds-${STEAMPORT}` and set the variables to your needs

    OPTIONS="-game cstrike -maxplayers 20"
    CONSOLE="+map de_dust2"

> see the games table above to find proper values for `-game` argument

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

## hlds server configuration

For the generic server configuration create a new `server.cfg`

    # region (3 = europe)
    sv_region 3

    # name of server
    hostname "my awesome dedicated server"

    # password
    sv_password "hello world"

    # rcon password
    rcon_password "do not share"

## srcds server configuration

For the generic server configuration create a new `cfg/server.cfg`

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
