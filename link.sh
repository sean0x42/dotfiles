#!/bin/sh

link() {
  echo Linking $2 to $1
  rm -f $2 || true
  ln -s $(pwd)/$1 $2
}

link vimrc ~/.vimrc
link vimrc ~/.config/nvim/init.vim
link coc-settings.json ~/.config/nvim/coc-settings.json
link tmux.conf ~/.tmux.conf
link starship.toml ~/.config/starship.toml
link zsh/zshenv ~/.zshenv
link zsh/zshrc ~/.zshrc

echo Done! 🎉
