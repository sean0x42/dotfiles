# Dotfiles

This repository contains various configuration and dotfiles. You're welcome to
steal anything you like.

## Usage

Getting started is easy: just run `./link.sh` to symlink the dotfiles to their
appropriate directories.

> **Warning!** `link.sh` will first attempt to remove any existing dotfiles. You
> probably want to back up anything you care about.

## Vim

Vim plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug),
which will need to be installed.

### Language Servers

#### Rust

Great Rust support is enabled by the following package:
<https://github.com/neoclide/coc-rls>. It's powered by the official RLS, so it
should be good quality.

To get started just run (rustup must already be installed):

```
:CocInstall coc-rls
```

#### Typescript

There is a fantastic Typescript language server available here:
<https://github.com/neoclide/coc-tsserver>

To get started just run:

```
:CocInstall coc-tsserver
```

#### Bash

Support for bash can be installed here:
<https://github.com/bash-lsp/bash-language-server>
