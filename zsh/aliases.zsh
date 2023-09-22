#!/bin/zsh

alias vim="nvim"

alias rqp-auth="rqp auth -z secure -s kaos -r poweruser -e s.bailey@nib.com.au"

# Git
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gl="git log"
alias gp="git push"
alias gs="git status"
alias git-drop-merged="git branch --merged | egrep -v \"(^\*|master|main|dev)\" | xargs git branch -d"

# exa (drop-in alternative for ls)
if [ "$(command -v exa)" ]; then
  unalias -m 'll'
  unalias -m 'l'
  unalias -m 'la'
  unalias -m 'ls'
  alias ls='exa -G --color auto --icons -a -s type'
  alias ll='exa -l --color always --icons -a -s type'
fi

# bat (drop-in alternative for cat)
if [ "$(command -v bat)" ]; then
  unalias -m "cat"
  alias cat="bat --theme=OneHalfDark"
fi

# fd (drop-in alternative for find)
if [ "$(command -v bat)" ]; then
  alias find="fd"
fi
