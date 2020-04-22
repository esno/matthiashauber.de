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
    su -l steam

Now you're ready to fetch the dedicated server software

    mkdir /var/lib/steam/server
    steamcmd.sh +login anonymous \
      +force_install_dir /var/lib/steam/server/css_27015 \
      +app_update 232330 +quit
