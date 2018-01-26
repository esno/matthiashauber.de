# lövr - virtual reality for lua

[lövr](https://github.com/bjornbytes/lovr) is based on the löve lua 2d game engine.

## hello world

    function lovr.draw()
      lovr.graphics.print('Hello World!', 0, 1.7, -3, .5)
    end
    
the VR application has to be named 'main.lua'

    $ ./lovr <path/to/project>
