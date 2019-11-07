# analyze memory leaks

    valgrind --leak-check=full \
      --show-leak-kinds=all \
      --track-origins=yes \
      --verbose \
      --log-file=/tmp/memleak.log \
      ./binary [args]
