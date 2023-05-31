#!/bin/bash

hdmi_output=$(xrandr | rg 'HDMI-0 connected')

if [[ $hdmi_output ]]; then
  hdmi=$(echo $hdmi_output | cut -d ' ' -f1)
  xrandr --output $hdmi --auto --primary
  xrandr --output eDP-1-1 --left-of $hdmi --auto
else
  xrandr --output eDP-1-1 --auto --primary
fi
