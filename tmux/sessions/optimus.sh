#!/bin/bash

source .bashrc

if [ $1 == 'clear' ]
then
  tmux-kill-session 'Optimus'
fi

tmux new-session -t Optimus \; \
  rename-window Folder \; \
  send-keys 'bb && cd optimus && docker-compose up' C-m \; \
  split-window -h \; \
  resize -D 10 \; \
  new-window \; \
  rename-window Container \; \
  send-keys 'docker exec -it optimus_web su docker' \; \
  select-window -t 1 \; \
  select-pane -t 2
