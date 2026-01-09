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
    --enable-autoservername \
    --enable-multibyte \
    --enable-nls \
    --enable-terminal \
    --enable-gui=gtk3 \
    --enable-gtk3-check \
    --enable-gnome-check \
    --with-x \
    --with-wayland \
    --with-features=huge

