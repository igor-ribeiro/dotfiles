#!/bin/bash

if [[ $(xrandr | rg 'HDMI-0 connected') ]]; then
  xrandr --output HDMI-0 --auto --primary
  xrandr --output eDP-1-1 --left-of HDMI-0 --auto
else
  xrandr --output eDP-1-1 --auto --primary
fi
