#!/bin/bash

source $HOME/.bashrc

EXTERNAL=$(get_external_monitor)
INTERNAL=$(get_internal_monitor)

if [[ $EXTERNAL ]]; then
  echo "Setting external monitor as primary"
  xrandr --output $EXTERNAL --auto --primary
  xrandr --output $INTERNAL --left-of $EXTERNAL --auto
else
  echo "Setting internal monitor as primary"
  xrandr --output $INTERNAL --auto --primary
fi
