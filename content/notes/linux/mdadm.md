# mdadm

## increase sync speed

    cat /proc/sys/dev/raid/speed_limit_min
    1000
    cat /proc/sys/dev/raid/speed_limit_max
    200000
    
    echo 400000 > /proc/sys/dev/raid/speed_limit_min
    echo 400000 > /proc/sys/dev/raid/speed_limit_max
