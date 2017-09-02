# avahi

## disable broadcasting

    # /etc/avahi/avahi-daemon.conf
    # If enabled, no user service will ever be published
    disable-user-service-publishing=yes
 
    # The safest option, puts Avahi in a browse-only mode
    disable-publishing=yes
