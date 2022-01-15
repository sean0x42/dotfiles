#!/bin/sh

link() {
  rm -f $2 || true
  ln -s $(pwd)/$1 $2
}

echo "Configuring term..."
link tmux.conf ~/.tmux.conf
link starship.toml ~/.config/starship.toml

echo "Configuring neovim..."
link vimrc ~/.vimrc
link vimrc ~/.config/nvim/init.vim
link coc-settings.json ~/.config/nvim/coc-settings.json

echo "Configuring ZSH..."
link zsh/zshenv ~/.zshenv
link zsh/zshrc ~/.zshrc

echo "Configuring doom emacs..."
doom=${DOOMDIR=~/.doom.d}
link doom/config.el $doom/config.el
link doom/init.el $doom/init.el
link doom/packages.el $doom/packages.el

echo "Configuring git..."
link .gitmessage ~/.gitmessage
git config --global commit.template ~/.gitmessage
git config --global core.editor emacs

echo "Done! 🎉"
