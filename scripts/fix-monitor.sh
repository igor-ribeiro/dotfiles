#!/bin/bash

source $HOME/.bashrc

HDMI=$(xrandr | rg connected | rg HDMI | cut -d' ' -f1)
INTERNAL=$(xrandr | rg connected | rg eDP | cut -d' ' -f1)

if [[ $HDMI ]]; then
  echo "setting HDMI"
  xrandr --output $HDMI --auto --primary
  xrandr --output $INTERNAL --left-of $HDMI --auto
else
  echo "setting internal"
  xrandr --output $INTERNAL --auto --primary
fi

$HOME/scripts/generate-i3-config.sh
