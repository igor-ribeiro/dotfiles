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
alias consul="bb && cd consul && dcd && ./start.sh && cd -"

# System
alias dnf-update="sudo dnf clean packages && sudo dnf update --skip-broken -y"

# Postaman
alias postman="/home/iribeiro/Downloads/Postman-linux-x64-6.0.10/Postman/Postman > /dev/null 2>&1 &"

# Git
alias gst="git status"
alias ga="git add"
alias ggp="git push"
alias ggl="git pull"
alias gco="git checkout"
alias gc="git commit"
alias gd="git diff"

# Dotfiles
alias dotfiles="cd ~/dotfiles"
alias ebash="vim ~/.bashrc"
alias sbash="source ~/.bashrc"
alias evim="vim ~/.vimrc"

# --
# FUNCTIONS
# --

# Kill all tmux sessions starting by name
function tmux-kill-session () {
  eval $(tmux ls | grep -Po "^$1(-(\d)+)*" | sed -e 's/^/tmux kill-session -t /' | sed -e 's/$/ \&\& /g' | xargs | sed -e 's/\&\&$//')
}

# Enter a docker container by name
function container () {
  docker exec -it $(docker ps -aqf "name=$1") su docker
}
