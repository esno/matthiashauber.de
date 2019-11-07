# list content of sqlite file

    $ sqlite3 /tmp/my.db
    sqlite> .databases
    seq  name             file                                                      
    ---  ---------------  ----------------------------------------------------------
    0    main             /tmp/my.sqlite3      
    sqlite> SELECT name FROM main.sqlite_master WHERE type='table';
    sqlite_sequence
    foo
    bla
