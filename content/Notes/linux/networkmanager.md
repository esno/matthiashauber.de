# NetworkManager

## Disable connectivity checks

NetworkManager is calling a public webservice on a regular basis to check
whether your network connection has internet connectivity or not.

One may not want to tell people outside about your presence and therefore might
want to disable this check.

    cat >> /var/lib/NetworkManager/NetworkManager-intern.conf <<EOF
    [connectivity]
    .set.enabled=false
    EOF
