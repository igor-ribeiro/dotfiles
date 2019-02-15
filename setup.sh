#!/bin/sh

# --
# VIM
mkdir -p $HOME/.vim

ln -sf $(pwd)/vim/autoload $HOME/.vim/
ln -sf $(pwd)/.vimrc $HOME/

# --
# TMUX
ln -sf $(pwd)/.tmux.conf $HOME/
