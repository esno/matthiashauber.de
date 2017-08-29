# nmap

network scanner

## commands

### discover all A/AAAA records of a domain

    nmap -oX - -sn --script=resolveall --script-args=newtargets,resolveall.hosts=example.org
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
