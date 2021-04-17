#!/bin/bash

source ~/.bashrc

session_name='beyoung'

tmux new -s $session_name -d \; \
  rename-window 'Terminal' \; \
  send-keys 'clear' C-m \; \
  send-keys 'dev-proxy' C-m \; \
  send-keys 'clear' C-m \; \
  send-keys 'cd' C-m

window=1

for project in $@; do
  ((++window))

  bb && cd $project

  tmux new-window
  tmux select-window -t $window
  bb-open $project
done

tmux select-window -t 1
tmux select-pane -t 3

tmux attach -t $session_name
