# Source Tmux Plugins
if [ -f ~/.config/tmux/tmux.plugins.sh ]; then
	. ~/.config/tmux/tmux.plugins.sh
fi

alias etmux="nvim ~/.tmux.conf"

# Kill all tmux sessions starting by name
function tmux-kill-session () {
  eval $(tmux ls | grep -Po "^$1(-(\d)+)*" | sed -e 's/^/tmux kill-session -t /' | sed -e 's/$/ \&\& /g' | xargs | sed -e 's/\&\&$//')
}

function tmux-kill () {
  tmux kill-session -t $1
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
    ~/code/ribeiro/dotfiles/tmux/sessions/$session_name.sh "${projects[*]}"
  fi
}
