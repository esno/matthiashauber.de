# Setup a dedicated server

To run a CS or DoD server ensure that SteamCMD is installed.
A installation guide can be found [here](../SteamCMD).

## Steam App IDs

    | Name                   | Game    | Engine | AppId  |
    | ---------------------- | ------- | ------ | ------ |
    | Counter-Strike 1.6     | cstrike | hlds   |     90 |
    | Counter-Strike: Source | cstrike | srcds  | 232330 |
    | Day of Defeat: Source  | dod     | srcds  | 232290 |

## fetch dedicated server software

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

To run the dedicated server just create a [systemd service file](https://github.com/flakispace/ops/blob/master/applications/steam/hlds%40.service).

    wget https://github.com/flakispace/ops/raw/master/applications/steam/hlds%40.service -O /etc/systemd/system/hlds\@.service

    export STEAMPORT="27015"

    systemctl enable hlds@${STEAMPORT}.service
    systemctl start hlds@${STEAMPORT}.service

Additionally create a file `/etc/default/hlds-${STEAMPORT}` and set the variables to your needs

    OPTIONS="-game cstrike -maxplayers 20"
    CONSOLE="+map de_dust2"

> see the games table above to find proper values for `-game` argument

## start srcds server

To run the dedicated server just create a [systemd service file](https://github.com/flakispace/ops/blob/master/applications/steam/srcds%40.service).

    wget https://github.com/flakispace/ops/raw/master/applications/steam/srcds%40.service -O /etc/systemd/system/srcds\@.service

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
