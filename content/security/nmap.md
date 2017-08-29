# nmap

network scanner

## discover all A/AAAA records of a domain

### command

    nmap -oX - -sn --script=resolveall --script-args=newtargets,resolveall.hosts=example.org
    
### output

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE nmaprun>  
    <?xml-stylesheet href="file:///usr/bin/../share/nmap/nmap.xsl" type="text/xsl"?>
    <!-- Nmap 7.60 scan initiated Tue Aug 29 20:25:44 2017 as: nmap -oX - -sn -&#45;script=resolveall -&#45;script-args=newtargets,resolveall.hosts=example.org -->
    <nmaprun scanner="nmap" args="nmap -oX - -sn -&#45;script=resolveall -&#45;script-args=newtargets,resolveall.hosts=example.org" start="1504031144" startstr="Tue Aug 29 20:25:44 2017" version="7.60" xmloutputversion="1.04">
    <verbose level="0"/>
    <debugging level="0"/>
    <prescript><script id="resolveall" output="&#xa;  Host &apos;example.org&apos; resolves to:&#xa;    93.184.216.34&#xa;  Successfully added 1 new targets&#xa;"><table key="hosts">
    <table key="example.org">
    <elem>93.184.216.34</elem>
    </table>
    </table>
    <elem key="newtargets">1</elem>
    </script></prescript><host starttime="1504031144" endtime="1504031145"><status state="up" reason="syn-ack" reason_ttl="0"/>
    <address addr="93.184.216.34" addrtype="ipv4"/>
    <hostnames>
    </hostnames>
    <times srtt="183038" rttvar="183038" to="915190"/>
    </host>
    <runstats><finished time="1504031145" timestr="Tue Aug 29 20:25:45 2017" elapsed="1.53" summary="Nmap done at Tue Aug 29 20:25:45 2017; 1 IP address (1 host up) scanned in 1.53 seconds" exit="success"/><hosts up="1" down="0" total="1"/>
    </runstats>
    </nmaprun>

## probe all ports and discover service

### command

    nmap -oX - -p- -sV 127.0.0.1

### output

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE nmaprun>
    <?xml-stylesheet href="file:///usr/bin/../share/nmap/nmap.xsl" type="text/xsl"?>
    <!-- Nmap 7.60 scan initiated Tue Aug 29 20:41:58 2017 as: nmap -oX - -p- -sV 127.0.0.1 -->
    <nmaprun scanner="nmap" args="nmap -oX - -p- -sV 127.0.0.1" start="1504032118" startstr="Tue Aug 29 20:41:58 2017" version="7.60" xmloutputversion="1.04">
    <scaninfo type="connect" protocol="tcp" numservices="65535" services="1-65535"/>
    <verbose level="0"/>
    <debugging level="0"/>
    <host starttime="1504032118" endtime="1504032125"><status state="up" reason="conn-refused" reason_ttl="0"/>
    <address addr="127.0.0.1" addrtype="ipv4"/>
    <hostnames>
    <hostname name="localhost.localdomain" type="PTR"/>
    </hostnames>
    <ports><extraports state="closed" count="65532">
    <extrareasons reason="conn-refused" count="65532"/>
    </extraports>
    <port protocol="tcp" portid="22"><state state="open" reason="syn-ack" reason_ttl="0"/><service name="ssh" product="OpenSSH" version="7.5" extrainfo="protocol 2.0" method="probed" conf="10"><cpe>cpe:/a:openbsd:openssh:7.5</cpe></service></port>
    <port protocol="tcp" portid="5432"><state state="open" reason="syn-ack" reason_ttl="0"/><service name="postgresql" product="PostgreSQL DB" version="9.6.0 or later" servicefp="************" method="probed" conf="10"><cpe>cpe:/a:postgresql:postgresql</cpe></service></port>
    <port protocol="tcp" portid="8081"><state state="open" reason="syn-ack" reason_ttl="0"/><service name="http" product="nginx" version="1.12.1" method="probed" conf="10"><cpe>cpe:/a:igor_sysoev:nginx:1.12.1</cpe></service></port>
    </ports>
    <times srtt="23" rttvar="15" to="100000"/>
    </host>
    <runstats><finished time="1504032125" timestr="Tue Aug 29 20:42:05 2017" elapsed="6.79" summary="Nmap done at Tue Aug 29 20:42:05 2017; 1 IP address (1 host up) scanned in 6.79 seconds" exit="success"/><hosts up="1" down="0" total="1"/>
    </runstats>
    </nmaprun>
