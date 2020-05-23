#!/bin/sh

link() {
    echo Linking $2 to $1
    rm -f $2 || true
    ln -s $(pwd)/$1 $2
}

link vimrc ~/.vimrc
link vimrc ~/.config/nvim/init.vim
link tmux.conf ~/.tmux.conf
