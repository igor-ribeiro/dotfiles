#!/bin/sh

# --
# BASH
# --
ln -sf $(pwd)/.bashrc $HOME/

# --
# VIM
# --
mkdir -p $HOME/.vim

# Dependencies
npm i -g import-js import-sort-cli import-sort-parser-babylon import-sort-parser-typescript import-sort-style-module

# Link files
ln -sf $(pwd)/vim/autoload $HOME/.vim/
ln -sf $(pwd)/.vimrc $HOME/
ln -sf $(pwd)/.importsortrc $HOME/
ln -sf $(pwd)/.importjs.js $HOME/

# Install vimx to enable system clipboard support
sudo dnf install vim-X11 -y

# --
# TMUX
# --
ln -sf $(pwd)/.tmux.conf $HOME/

# --
# GIT
# --
# Sets the pager to behave like `man`
git config --global core.pager 'less -+X'

