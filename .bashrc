# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export LANG="en_US.utf8"

export TERM=xterm-256color

export PATH=~/.npm-global/bin:$PATH


# ---
# ALIASES
# ---

# Docker
alias dcu="docker-compose up"
alias dcud="docker-compose up -d && docker-compose logs -f"
alias dcl="docker-compose logs -f"
alias dcd="docker-compose down"

# GCloud
alias gcloud-production="gcloud config set project brands-production"
alias gcloud-staging="gcloud config set project staging-203611"

# Directories
alias bb="cd ~/Code/BeautyBrands"
alias ir="cd ~/Code/Ribeiro"
alias dotfiles="cd ~/dotfiles"

# VPN
alias bb-vpn="sudo openvpn --config ~/.vpn/igorr.ovpn --askpass ~/.vpn/auth.txt"

# Trigger nodemon reload
alias ntr="touch src/server.ts"

# DataGrip
alias datagrip="cd ~/Code/Ribeiro/docker-datagrip && dcu -d && cd -"

# Clear Swap
alias clear-swap="sudo swapoff -a && sudo swapon -a"

# Redis
alias redis-local-keys="redis-cli -h redis.service.consul KEYS $1"
alias redis-local-keys-del="redis-cli -h redis.service.consul KEYS $1 | xargs redis-cli -h redis.service.consul DEL"
alias redis-prod-keys="redis-cli -h redis.aws.bbrands.com.br KEYS $1"

# Consul
alias consul="cd ~/Code/BeautyBrands/consul && dcd && ./start.sh && cd -"

# System
alias dnf-update="sudo dnf clean packages && sudo dnf update --skip-broken -y"

# Postaman
alias postman="/home/iribeiro/Downloads/Postman-linux-x64-6.0.10/Postman/Postman > /dev/null 2>&1 &"

# Git
alias gst="git status"
alias ga="git add"
# alias ggp="git push"
alias ggl="git pull"
alias gco="git checkout"
alias gc="git commit"
alias gd="git diff"

# Bash
alias ebash="vim ~/.bashrc"
alias sbash="source ~/.bashrc"

# Vim
alias evim="vim ~/.vimrc"
alias vim="vimx"

# Tmux
alias etmux="vim ~/.tmux.conf"

# --
# FUNCTIONS
# --

## TMUX
# Kill all tmux sessions starting by name
function tmux-kill-session () {
  eval $(tmux ls | grep -Po "^$1(-(\d)+)*" | sed -e 's/^/tmux kill-session -t /' | sed -e 's/$/ \&\& /g' | xargs | sed -e 's/\&\&$//')
}

# Start a session by script attaching or creating a new one
function tmux-start () {
  operation=${2:-''}

  if [ $operation == '-f' ]; then
    echo "Killing all $1"
    tmux-kill-session $1
  fi

  if tmux has -t $1; then
    echo "Attaching to $1"
    tmux a -t $1
  else
    echo "Creating session $1"
    ~/dotfiles/tmux/sessions/$1.sh
  fi
}

## DOCKER
# Enter a docker container by name
function container () {
  docker exec -it $(docker ps -aqf "name=$1") su docker
}

## GIT
# Check if folder has .git
function has-git () {
  if [[ $(find . -maxdepth 1 -name '.git') ]]; then
    true
  else
    false
  fi
}

# Get git branch
function current-git-branch () {
  if ! has-git; then
    return
  fi

  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

# git push origin CURRENT_BRANCH
function ggp () {
  git push origin $(current-git-branch)
}

## BASH
function bash-status-git-branch () {
  if ! has-git; then
    return
  fi

  echo -e "\e[44m $(current-git-branch) \e[0m"
}

# Add visual if there are staged files
function bash-status-git-stage () {
  if ! has-git; then
    return
  fi

  staged_files="$(gst -s | wc -l)"

  if [[ $staged_files == "0" ]]; then
    echo -e "\e[32m●\e[0m"
  else
    echo -e "\e[91m($staged_files)\e[0m"
  fi
}

function get-bash-status () {
  current_dir="\e[2m\\w\e[0m"
  git_branch="\$(bash-status-git-branch)"
  git_status="\$(bash-status-git-stage)"

  echo "$current_dir $git_branch $git_status \n$ "
}

# Show the current folder, git branch and git stage info
export PS1=$(get-bash-status)
