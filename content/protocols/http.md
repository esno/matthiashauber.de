# general

connect to a http server by using `telnet` or `openssl s_client` (in case of tls-only server)

## examples

    # plaintext
    telnet example.org 80
    
    # on embedded systems
    busybox telnet example.org 80
    
    # tls
    openssl s_client -connect example.org:443

# methods

## get

    GET / HTTP/1.1
    host: example.org

    HTTP/1.1 200 OK
    Cache-Control: max-age=604800
    Content-Type: text/html
    Date: Tue, 11 Jul 2017 14:31:52 GMT
    Etag: "*********+ident"
    Expires: Tue, 18 Jul 2017 14:31:52 GMT
    Last-Modified: Fri, 09 Aug 2013 23:54:35 GMT
    Server: ECS (iad/182A)
    Vary: Accept-Encoding
    X-Cache: HIT
    Content-Length: 1270
    
    [...]
