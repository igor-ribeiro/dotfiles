#!/bin/bash

source ~/.bashrc

session_name='bbrands'

function test () {
  echo 'TEST'
}

tmux new -s $session_name -d \; \
  rename-window 'Terminal' \; \
  send-keys 'clear' C-m \; \
  send-keys 'bb-vpn' \; \
  split-window -v \; \
  send-keys 'clear' C-m \; \
  send-keys 'consul' \; \
  select-pane -t 1 \; \
  split-window -h \; \
  send-keys 'htop' C-m \; \
  resize-pane -U 40 \; \
  resize-pane -D 6

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
