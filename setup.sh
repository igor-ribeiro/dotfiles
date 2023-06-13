#!/bin/sh

# --
# ARCH
# --
# Disable sleep
# setterm -blank 0

# --
# NVM (NODE)
# --
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
nvm use --lts

# --
# PACKAGES
# --
# sudo pacman -Suy htop xclip neovim tmux ripgrep unzip xdg-utils pipewire

# --
# FONTS
# --
mkdir $HOME/.local/share/fonts/
ln -s $(pwd)/fonts/ $HOME/.local/share/fonts/
sudo fc-cache

# --
# ALACRITTY TERMINAL
# --
ln -s $(pwd)/alacritty/ $HOME/.config/

# --
# BASH
# --
ln -sf $(pwd)/.bashrc $HOME/
ln -sf $(pwd)/bash/ $HOME/.config/
ln -sf $(pwd)/assets/ $HOME/.local/

# --
# TMUX
# --
ln -sf $(pwd)/.tmux.conf $HOME/
ln -sf $(pwd)/tmux/ $HOME/.config/

# --
# GIT
# --
# Sets the pager to behave like `man`
# git config --global core.pager 'less -+X'
ln -sf $(pwd)/.gitconfig $HOME/


# --
# NEOVIM
# --
mkdir -p $HOME/.config/nvim
ln -sf $(pwd)/nvim/* $HOME/.config/nvim/

# Install Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins
nvim -c 'PlugInstall | qa'

# --
# RUST
# --
mkdir -p ~/.local/bin
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# --
# i3
# --
mkdir -p $HOME/.config/i3
ln -sf $(pwd)/i3/* $HOME/.config/i3/


# --
# SCRIPTS
# --
mkdir -p $HOME/scripts
ln -sf $(pwd)/scripts/ $HOME/scripts
ln -sf $(pwd)/scripts/ $HOME/.local/bin
