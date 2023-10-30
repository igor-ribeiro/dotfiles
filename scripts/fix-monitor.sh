#!/bin/bash

source $HOME/.bashrc

hdmi=$(get-monitor-by-name HDMI)
internal=$(get-monitor-by-name eDP)

if [[ $hdmi ]]; then
  xrandr --output $hdmi --auto --primary
  xrandr --output $internal --left-of $hdmi --auto
else
  xrandr --output $internal --auto --primary
fi
