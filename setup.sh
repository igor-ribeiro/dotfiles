#!/bin/sh

# --
# UTILS
# --
# sudo dnf install -y htop xclip vim

# --
# FONTS
# --
# ln -s $(pwd)/fonts/iosevka/* $HOME/.fonts
# sudo fc-cache

# --
# BASH
# --
ln -sf $(pwd)/.bashrc $HOME/
ln -sf $(pwd)/.git-completion.bash $HOME/

# --
# VIM
# --
mkdir -p $HOME/.vim

# Dependencies
# npm i -g import-js import-sort-cli import-sort-parser-babylon import-sort-parser-typescript import-sort-style-module

# Link files
ln -sf $(pwd)/vim/autoload $HOME/.vim/
ln -sf $(pwd)/.vimrc $HOME/
# ln -sf $(pwd)/.importsortrc $HOME/
# ln -sf $(pwd)/.importjs.js $HOME/

# Install vimx to enable system clipboard support
# sudo dnf install vim-X11 -y

# --
# TMUX
# --
ln -sf $(pwd)/.tmux.conf $HOME/

# --
# GIT
# --
# Sets the pager to behave like `man`
# git config --global core.pager 'less -+X'

# --
# VPN
# --
# sudo dnf install wireguard-tools

# --
# NEO VIM
# --

# BUILD SOURCE
# sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch

# Clone
# cd ~/code/Ribeiro && git clone git@github.com:neovim/neovim.git

sudo apt install ripgrep -y

mkdir -p $HOME/.config/nvim
ln -sf $(pwd)/nvim/init.vim $HOME/.config/nvim

# Install Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins
nvim -c 'PlugInstall | qa'

# --
# RUST
# --
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

