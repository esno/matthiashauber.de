# lövr - virtual reality for lua

[lövr](https://github.com/bjornbytes/lovr) is based on the löve lua 2d game engine.

## hello world

    function lovr.draw()
      lovr.graphics.print('Hello World!', 0, 1.7, -3, .5)
    end
    
the VR application has to be named 'main.lua'

    $ ./lovr ${LOVR_PROJECT_PATH}

## webvr

### prepare emsdk

    # install the emsdk modified for lovr
    $ wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
    $ tar -xf emsdk-portable.tar.gz
    $ ./emsdk update
    $ ./emsdk install latest
    $ ./emsdk activate latest

    # clone customized emscripten
    $ git clone https://github.com/bjornbytes/emscripten.git -b lovr

### build lovr-webvr

    # official repo
    $ git clone https://github.com/bjornbytes/lovr.git
    # see https://github.com/bjornbytes/lovr/pull/33
    $ git clone https://github.com/esno/lovr.git -b webvr_fix
    $ cd lovr && mkdir build && cd build
    $ ${EMSCRIPTEN_PATH}/emcmake cmake ..
    $ python ${EMSCRIPTEN_PATH}/embuilder.py build binaryen
    $ ${EMSCRIPTEN_PATH}/emmake make -j2

### generate webvr application

    $ python </path/to>/emscripten/tools/file_packager.py \
        game.data \
        --no-heap-copy \
        --preload \
        </path/to/lovr/project> \
        --js-output=game.js
