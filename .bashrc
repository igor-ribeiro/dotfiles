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

export LESS="-SXF"

# Enable Vim mode
# set -o vi


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
function bb () {
  cd ~/Code/Beyoung
}

function ir () {
  cd ~/Code/Ribeiro
}

function dotfiles () {
  cd ~/dotfiles
}

# VPN
alias bb-vpn="sudo openvpn --config ~/.vpn/igorr.ovpn --askpass ~/.vpn/auth.txt"

# Trigger nodemon reload
alias ntr="touch src/server.ts"

# DataGrip
alias datagrip="cd ~/Code/Ribeiro/docker-datagrip && dcu -d && cd -"

# Clear Swap
alias clear-swap="sudo swapoff -a && sudo swapon -a"

# Redis
alias redis-local="redis-cli -h redis.service.consul $@"
alias redis-local-keys="redis-cli -h redis.service.consul KEYS $1"
alias redis-local-keys-del="redis-cli -h redis.service.consul KEYS $1 | xargs redis-cli -h redis.service.consul DEL"
alias redis-staging="redis-cli -h redis.staging.bbrands.com.br $@"
alias redis-staging-keys="redis-cli -h redis.staging.bbrands.com.br KEYS $1"
alias redis-staging-keys-del="redis-cli -h redis.staging.bbrands.com.br KEYS $1 | xargs redis-cli -h redis.staging.bbrands.com.br DEL"
alias redis-prod-keys="redis-cli -h redis.bbrands.com.br KEYS $1"

# Consul
alias consul="cd ~/Code/Beyoung/consul && dcd && ./start.sh && cd -"

# System
alias dnf-update="sudo dnf clean packages && sudo dnf update --skip-broken -y"

# Postaman
alias postman="/home/iribeiro/Downloads/Postman-linux-x64-6.0.10/Postman/Postman > /dev/null 2>&1 &"

# Git
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gds="git diff --staged"
alias gm="git merge"
alias gl="git log"

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
  ALL_FLAGS=("-f")
  i=0
  session_name=""
  flags=()
  projects=()

  for arg in $@; do
    first_char=$(printf '%s' $arg | cut -c1)

    if [[ " ${ALL_FLAGS[@]} " =~ " ${arg} " ]]; then
      flags+=($arg)
    elif [ -z "$session_name" ]; then
      session_name=$arg
    else
      projects+=($arg)
    fi
    
    ((++i))
  done

  if [[ " ${flags[@]} " =~ " -f " ]]; then
    echo "Killing all $session_name"
    tmux-kill-session $session_name
  fi

  if tmux has -t $session_name; then
    echo "Attaching to $session_name"
    tmux a -t $session_name
  else
    echo "Creating session $session_name"
    ~/dotfiles/tmux/sessions/$session_name.sh "${projects[*]}"
  fi
}

## DOCKER
# Enter a docker container by name
function container () {
  docker exec -it $(docker ps -aqf "name=$1") su docker
}

## GIT
function gco () {
  git checkout $@
  (git fetch -q &>/dev/null &)
}
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

# git pull origin CURRENT_BRANCH
function ggl () {
  git pull origin $(current-git-branch)
}

function get-git-untracked-count () {
  echo $(gst -s | grep -e '^[ ?]' | wc -l)
}

function get-git-tracked-count () {
  echo $(gst -s | grep --invert-match '^ ' | grep --invert-match '^?' | wc -l)
}

function get-git-behind-commits () {
  echo $(gst -b | grep -P 'is behind' | grep -oP '(\d)+ commit' | grep -oP '\d+')
}

function get-git-ahead-commits () {
  echo $(gst -b | grep -P 'is ahead' | grep -oP '(\d)+ commit' | grep -oP '\d+')
}

## BASH
function bash-status-git-branch () {
  if ! has-git; then
    return
  fi

  tracked_files=$(get-git-tracked-count)
  untracked_files=$(get-git-untracked-count)
  behind_commits=$(get-git-behind-commits)
  ahead_commits=$(get-git-ahead-commits)

  echo -n " on "

  if [[ $untracked_files != "0" ]]; then
    echo -ne "\e[38;5;203m"
  elif [[ $tracked_files != "0" ]]; then
    echo -ne "\e[38;5;184m"
  elif [[ $behind_commits ]]; then
    echo -ne "\e[94m"
  elif [[ $ahead_commits ]]; then
    echo -ne "\e[94m"
  else
    echo -ne "\e[92m"
  fi

  echo -ne "$(current-git-branch)\e[0m"
}

# Add visual if there are staged files
function bash-status-git-stage () {
  if ! has-git; then
    return
  fi

  untracked_files=$(get-git-untracked-count)
  tracked_files=$(get-git-tracked-count)
  behind_commits=$(get-git-behind-commits)
  ahead_commits=$(get-git-ahead-commits)

  if [[ $untracked_files != "0" ]]; then
    echo -ne "\e[38;5;203m ←$untracked_files\e[0m"
  fi

  if [[ $tracked_files != "0" ]]; then
    echo -ne "\e[38;5;184m →$tracked_files\e[0m"
  fi

  if [[ $behind_commits ]]; then
    echo -ne "\e[94m ↓$behind_commits\e[0m"
  fi

  if [[ $ahead_commits ]]; then
    echo -ne "\e[94m ↑$ahead_commits\e[0m"
  fi
}

function get-bash-status () {
  current_dir="\[\e[2m\]\\W\[\e[0m\]"
  git_branch="\[\$(bash-status-git-branch)\]"
  git_status="\[\$(bash-status-git-stage)\]"

  echo -e "$current_dir$git_branch$git_status"
  echo -e "\[\e[2m\]$ \[\e[0m\]"
}

# Show the current folder, git branch and git stage info
export PS1=$(get-bash-status)

## UTILS
# Python HTTP Server
function server() {
  python -m SimpleHTTPServer 8080
}

# Parse JSON
function get-json () {
  python -c "import sys, json; print json.load(sys.stdin)$2" < $1
}

# Find text in files on current folder
function find-in-files () {
  dir='./'

  if [[ $2 ]]; then
    dir=$2
  fi

  grep --exclude-dir={.git,node_modules,dist} -rnw $2 -P "$1"
}

# Copy command to clipboard
function xcopy () {
  xclip -sel c $@
}

# Paste from clipboard
function xpaste () {
  xclip -sel c -o
}

# Copy redis keys from one host to another
function redis-copy-key () {
  key=$1
  from=$2
  to=$3

  redis-cli -h $to SET $key $(redis-cli -h $from GET $key)
}

# Copy redis keys from staging to local
function redis-copy-key-staging-local () {
  redis-copy-key $1 redis.staging.bbrands.com.br redis.service.consul
}

# Display all the IPs from `ifconfig`, asks for one and copy to clipboard
function copy-ip () {
  ips=$(ifconfig | grep -P '^\w' -1 | grep -P 'inet [\d\.]+' -o | grep -P '[\d\.]+' -o)
  array=($(echo "$ips" | tr ',' '\n'))
  i=0

  for ip in $ips; do
    echo "($i) $ip"
    ((++i))
  done

  read -p "Enter your choice and press [ENTER]: " choice

  ip=${array[choice]}
  echo -n $ip | xcopy

  clear
  echo "IP $ip copied to clipboard!"
}

# Create directory recursively and enter the directory
function mkd () {
  mkdir -p $1
  cd $1
}

function bb-open () {
  bb
  cd $1

  name=$(echo $1 | awk '
  BEGIN { ORS="" }; 

  {
    split($0, array, "");

    for (i in array) {
      if (i == 1) {
        print toupper(array[i]);
      } else {
        print array[i];
      }
    }
  }' | xargs )

  tmux split-window -h
  tmux split-window
  tmux send-keys -t 1 vim Enter
  tmux send-keys -t 2 dcu Enter
  tmux rename-window $name
  tmux select-pane -t 1
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/iribeiro/Downloads/google-cloud-sdk-278.0.0-linux-x86_64/google-cloud-sdk/path.bash.inc' ]; then . '/home/iribeiro/Downloads/google-cloud-sdk-278.0.0-linux-x86_64/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/iribeiro/Downloads/google-cloud-sdk-278.0.0-linux-x86_64/google-cloud-sdk/completion.bash.inc' ]; then . '/home/iribeiro/Downloads/google-cloud-sdk-278.0.0-linux-x86_64/google-cloud-sdk/completion.bash.inc'; fi
