#!/bin/sh

# --
# UTILS
# --
sudo dnf install -y htop xclip vim

# --
# FONTS
# --
ln -s $(pwd)/fonts/iosevka/* $HOME/.fonts
sudo fc-cache

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

# Install plugins
vim -c 'PlugInstall | qa'

# --
# TMUX
# --
ln -sf $(pwd)/.tmux.conf $HOME/

# --
# GIT
# --
# Sets the pager to behave like `man`
git config --global core.pager 'less -+X'

# --
# VPN
# --
sudo dnf install wireguard-tools

