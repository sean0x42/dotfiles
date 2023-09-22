#!/bin/sh

link() {
  rm -f $2 || true
  ln -s $(pwd)/$1 $2
}

echo "Configuring term..."
link tmux.conf ~/.tmux.conf
link starship.toml ~/.config/starship.toml

echo "Configuring ZSH..."
link zsh/zshenv ~/.zshenv
link zsh/zshrc ~/.zshrc

echo "Configuring git..."
link .gitmessage ~/.gitmessage
git config --global commit.template ~/.gitmessage
git config --global core.editor nvim

echo "Done! 🎉"
