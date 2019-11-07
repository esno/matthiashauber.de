# general

connect to a whois server by using `telnet`.
Response of whois requests is *not* standardized!

## examples

    # telnet whois.denic.de 43
    Trying 81.91.170.6...
    Connected to whois.denic.de.
    Escape character is '^]'.
    -T dn denic.de
    % Copyright (c) 2010 by DENIC
    % Version: 2.0
    % 
    % Restricted rights.
    % 
    % Terms and Conditions of Use
    % 
    % The data in this record is provided by DENIC for informational purposes only.
    % DENIC does not guarantee its accuracy and cannot, under any circumstances,
    % be held liable in case the stored information would prove to be wrong,
    % incomplete or not accurate in any sense.
    % 
    % All the domain data that is visible in the whois service is protected by law.
    % It is not permitted to use it for any purpose other than technical or
    % administrative requirements associated with the operation of the Internet.
    % It is explicitly forbidden to extract, copy and/or use or re-utilise in any
    % form and by any means (electronically or not) the whole or a quantitatively
    % or qualitatively substantial part of the contents of the whois database
    % without prior and explicit written permission by DENIC.
    % It is prohibited, in particular, to use it for transmission of unsolicited
    % and/or commercial and/or advertising by phone, fax, e-mail or for any similar
    % purposes.
    % 
    % By maintaining the connection you assure that you have a legitimate interest
    % in the data and that you will only use it for the stated purposes. You are
    % aware that DENIC maintains the right to initiate legal proceedings against
    % you in the event of any breach of this assurance and to bar you from using
    % its whois service.
    % 
    % The DENIC whois service on port 43 never discloses any information concerning
    % the domain holder/administrative contact. Information concerning the domain
    % holder/administrative contact can be obtained through use of our web-based
    % whois service available at the DENIC website:
    % http://www.denic.de/en/domains/whois-service/web-whois.html
    % 

    Domain: denic.de
    Nserver: ns1.denic.de 2001:668:1f:11:0:0:0:106 77.67.63.106
    Nserver: ns2.denic.de 78.104.145.26
    Nserver: ns3.denic.de 81.91.173.19
    Dnskey: 257 3 8 AwEAAb/xrM2MD+xm84YNYby6TxkMaC6PtzF2bB9WBB7ux7iqzhViob4GKvQ6L7CkXjyAxfKbTzrdvXoAPpsAPW4pkThReDAVp3QxvUKrkBM8/uWRF3wpaUoPsAHm1dbcL9aiW3lqlLMZjDEwDfU6lxLcPg9d14fq4dc44FvPx6aYcymkgJoYvR6P1wECpxqlEAR2K1cvMtqCqvVESBQV/EUtWiALNuwR2PbhwtBWJd+e8BdFI7OLkit4uYYux6Yu35uyGQ==
    Status: connect
    Changed: 2017-07-17T17:04:03+02:00

    [Tech-C]
    ...

    [Zone-C]
    ...
    Connection closed by foreign host.
