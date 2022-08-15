#!/bin/bash

source ~/.bashrc

session_name='galley/frontend'

galley
cd jelly-frontend

tmux new -s $session_name -d
tmux send-keys 'nvim .' C-m
tmux new-window
tmux select-window -t 2
tmux send-keys 'yarn start' C-m
tmux select-window -t 1

tmux attach -t $session_name
