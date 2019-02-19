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

# Link files
ln -sf $(pwd)/vim/autoload $HOME/.vim/
ln -sf $(pwd)/.vimrc $HOME/

# Install vimx to enable system clipboard support
sudo dnf install vim-X11 -y

# --
# TMUX
# --
ln -sf $(pwd)/.tmux.conf $HOME/
