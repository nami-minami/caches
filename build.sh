#!/bin/sh

if [ $(basename $(pwd)) != "vim" ]; then
    echo "Not in the vim source directory."
    exit 0
fi

./configure \
    --enable-fail-if-missing \
    --enable-perlinterp \
    --enable-python3interp \
    --enable-luainterp \
    --enable-rubyinterp \
    --enable-terminal \
    --enable-multibyte \
    --enable-gui=gtk3 \
    --with-wayland

