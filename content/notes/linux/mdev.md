# mdev

## autoload

    /usr/bin/find /sys -name 'modalias' -type f -exec /usr/bin/sort -u {} \; \
        | /usr/bin/xargs /sbin/modprobe -b -a 2>/dev/null
