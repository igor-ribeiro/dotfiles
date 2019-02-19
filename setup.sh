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
npm i -g import-js import-sort-cli import-sort-parser-babylon import-sort-parser-typescript

ln -sf $(pwd)/vim/autoload $HOME/.vim/
ln -sf $(pwd)/.vimrc $HOME/

# --
# TMUX
# --
ln -sf $(pwd)/.tmux.conf $HOME/
