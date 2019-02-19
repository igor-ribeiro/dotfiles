#!/bin/bash

source ~/.bashrc

session_name='BBrands'

if [ $1 == 'clear' ]
then
  tmux-kill-session $session_name
fi

tmux new-session -t $session_name \; \
  rename-window 'Optimus' \; \
  send-keys 'bb && cd optimus && vim .' C-m \; \
  split-window -h \; \
  send-keys 'bb && cd optimus && docker-compose up' C-m \; \
  split-window -v \; \
  send-keys 'clear && container optimus' C-m \; \
  split-window -v \; \
  send-keys 'bb && cd optimus && clear' C-m \; \
  new-window \; \
  rename-window 'Lucius' \; \
  send-keys 'bb && cd lucius && vim .' C-m \; \
  split-window -h \; \
  send-keys 'bb && cd lucius && docker-compose up' C-m \; \
  split-window -v \; \
  send-keys 'clear && container lucius' C-m \; \
  split-window -v \; \
  send-keys 'bb && cd lucius && clear' C-m \; \
  new-window \; \
  rename-window 'Stark' \; \
  send-keys 'bb && cd stark && vim .' C-m \; \
  split-window -h \; \
  send-keys 'bb && cd stark && docker-compose up' C-m \; \
  split-window -v \; \
  send-keys 'clear && container stark' C-m \; \
  split-window -v \; \
  send-keys 'bb && cd stark && clear' C-m \; \
  select-window -t 1 \; \
  select-pane -t 1
