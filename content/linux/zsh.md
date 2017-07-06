# aliases & functions

    # usage: pwgen [<len>]
    function pwgen() {
      < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32}; echo;
    }

    # usage: eol <file>
    function eol() {
      if [ -n "$(tail -c1 ${1})" ]; then echo "file has no eol"; return 1; fi
    }
