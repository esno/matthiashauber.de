# install graylog

    apt-get install apt-transport-https uuid-runtime pwgen dirmngr gnupg wget

## install java

    apt-get install openjdk-11-jre-headless

    cat > /etc/security/limits.d/java.conf <<EOF
    *   soft    nofile          65536
    *   hard    nofile          65536
    EOF

## install mongodb

    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

    echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" > /etc/apt/sources.list.d/mongodb-org-4.2.list
    apt-get update
    apt-get install mongodb-org

    systemctl enable mongod.service

    # required for graylog to work
    mongo --eval " db.adminCommand( { setFeatureCompatibilityVersion: \"4.0\" } ) "

## install elasticsearch

    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
    echo "deb https://artifacts.elastic.co/packages/oss-6.x/apt stable main" > /etc/apt/sources.list.d/elastic-6.x.list
    apt-get update

    apt-get install elasticsearch-oss

configure elasticsearch

    vim /etc/elasticsearch/elasticsearch.yml
    cluster.name: graylog
    action.auto_create_index: false

## install graylog

    wget https://packages.graylog2.org/repo/packages/graylog-3.2-repository_latest.deb
    dpkg -i graylog-3.2-repository_latest.deb
    apt-get update

    # install plugins if necessary
    apt-get install graylog-server \
      graylog-enterprise-plugins \
      graylog-integrations-plugins \
      graylog-enterprise-integrations-plugins

    systemctl enable graylog-server.service
    systemctl start graylog-server.service

# journald remote logging

## receiving server

    apt-get install systemd-journal-remote
    systemctl enable systemd-journal-remote.socket
    systemctl start systemd-journal-remote.socket

    cp /lib/systemd/system/systemd-journal-remote.service /etc/systemd/system/systemd-journal-remote.service
    sed -i "s/https/http/" /etc/systemd/system/systemd-journal-remote.service

## sending server

    apt-get install systemd-journal-remote
    systemctl enable systemd-journal-upload
    systemctl start systemd-journal-upload

/etc/systemd/journal-upload.conf:

    [Upload]
    URL=http://a.b.c.d:19532
