# aliases & functions

    # usage: eol <file>
    function eol() {
      if [ -n "$(tail -c1 ${1})" ]; then echo "file has no eol"; return 1; fi
    }

    # usage: lxenter <lxc> [<user>]
    function lxenter() {
      if [ "${1}" = "" ]; then echo "USAGE: lxenter <lxc> [<user>]"; return 1; fi
      RUN="lxc-attach -n ${1} -- /bin/su -l ${2}"
      if (( EUID != 0 )); then RUN="su -c '${RUN}'"; fi
      eval ${RUN}
    }

    # usage: pwgen [<len>]
    function pwgen() {
      < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32}; echo;
    }
