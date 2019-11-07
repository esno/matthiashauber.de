# xorg

## X composite extension

the protocol specifies that the returned version will never be higher
then the one requested.

    int major = 0, minor = 2;
    XCompositeQueryVersion(dpy, &major, &minor);

### feature matrix

    | version | NameWindowPixmap |
    | ------- | ---------------- |
    | 0.2     | x                |
