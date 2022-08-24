# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

force_color_prompt=yes
color_prompt=yes

# Bash files
. ~/.config/bash/exports.bash
. ~/.config/bash/git.bash
. ~/.config/bash/git-completion.bash
. ~/.config/bash/status.bash
. ~/.config/bash/docker.bash
. ~/.config/bash/tmux.bash
. ~/.config/bash/utils.bash
. ~/.config/bash/galley.bash

# Bash
alias ebash="nvim ~/.bashrc"
alias sbash="source ~/.bashrc"

# Vim
alias i3config="nvim ~/.config/i3/config"
alias evim="nvim ~/.config/nvim/init.vim"
alias svim="sudo -E -s nvim"

alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"

alias open="xdg-open"

alias x-www-browser="firefox"

alias eapps="svim /usr/share/applications"

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"
