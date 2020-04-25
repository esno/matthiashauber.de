# ubuntu

## fix output in netkvm/ipmi

the java applet for netkvm/ipmi is not able to print framebuffered console output.
Additionally no current browser supports java except luakit (using webkit)

    # append kernel arguments line to disable framebuffer
    vga=normal fb=false
