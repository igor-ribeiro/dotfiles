#!/bin/bash

source ~/.bashrc

session_name='galley/backend'
ALL_FLAGS=("--no-start")
flags=()

for arg in $@; do
  if [[ " ${ALL_FLAGS[@]} " =~ " ${arg} " ]]; then
    flags+=($arg)
  fi
done

galley
cd jelly-backend

tmux new -s $session_name -d
tmux select-window -t 1
tmux send-keys 'nvim .' C-m
tmux new-window

if ! [[ " ${flags[@]} " =~ " --no-start " ]]; then
  tmux select-window -t 2
  tmux send-keys 'yarn start' C-m
fi

tmux select-window -t 1
tmux attach -t $session_name
