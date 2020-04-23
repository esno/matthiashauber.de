# Setup a linux-based server

This guide depends on ubuntu servers, for other distros it should be similar but package names may differ.
Install prerequirements

    apt-get update
    apt-get install wget lib32gcc1 libc6-i386

Fetch the steam-cli runtime for linux

    mkdir /opt/steam && cd /opt/steam
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
    tar xzpf steamcmd_linux.tar.gz

    ln -s /opt/steam/steam.sh /usr/local/bin/
    ln -s /opt/steam/steamcmd.sh /usr/local/bin/
    ln -s /opt/steam/linux32 /usr/local/bin

Create a new user which will run the server processes

    useradd -d /var/lib/steam -m -s /bin/bash -u 99 -U steam

Now you're ready to fetch the dedicated server software

    su -l steam
    mkdir -p /var/lib/steam/server/counter-strike_source
    steamcmd.sh +login anonymous \
      +force_install_dir /var/lib/steam/server/counter-strike_source/27015 \
      +app_update 232330 +quit

## start server

To run the dedicated server just create a [systemd service file](https://github.com/flakispace/ops/blob/master/steam/css%40.service).

    wget https://github.com/flakispace/ops/raw/master/steam/css%40.service -O /etc/systemd/system/css\@.service
    systemctl enable css@27015.service
    systemctl start css@27015.service

If you want to change default map or max players just create `/etc/default/counter-strike_source` and set the variables to your needs

    CSS_MAP=de_dust2
    CSS_MAXPLAYER=16

## server configuration

For the generic server configuration create `cstrike/cfg/server.cfg`

    # local or public
    sv_lan 0

    # region (3 = europe)
    sv_region 3

    # name of server
    hostname "my awesome cstrike server"

    # password
    sv_password "hello world"

    # rcon password
    rcon_password "do not share"
