#!/bin/bash

source ~/.bashrc

session_name='bbrands'

tmux new -s $session_name \; \
  rename-window 'Optimus' \; \
  send-keys 'bb && cd optimus && vim .' C-m \; \
  split-window -h \; \
  send-keys 'bb && cd optimus && docker-compose up' C-m \; \
  split-window -v \; \
  send-keys 'clear && container optimus' C-m \; \
  split-window -v \; \
  send-keys 'bb && cd optimus && clear' C-m \; \
  select-pane -t 1 \; \
  split-window -v \; \
  send-keys 'yarn hot-reload:container' \; \
  resize-pane -D 10 \; \
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
  new-window \; \
  rename-window 'Terminal' \; \
  send-keys 'bb-vpn' \; \
  split-window -v \; \
  send-keys 'consul' C-m \; \
  select-pane -t 1 \; \
  split-window -h \; \
  send-keys 'htop' C-m \; \
  resize-pane -U 10 \; \
  select-pane -t 3
