#!/bin/bash

source $HOME/.bashrc

HDMI=$(xrandr | rg connected | rg HDMI | cut -d' ' -f1)
VIRTUAL_HDMI=$(xrandr --listactivemonitors | rg HDMI-0 | cut -d' ' -f6)

if [ -z "$VIRTUAL_HDMI" ]; then
    echo "No virtual monitor"
    xrandr --setmonitor HDMI-0-2 1280/399x1080/334+3200+0 $HDMI
    xrandr --setmonitor HDMI-0-1 1280/399x1080/334+1920+0 none
else
    echo "Has virtual monitor"
    xrandr --delmonitor HDMI-0-1
    xrandr --delmonitor HDMI-0-2
    $HOME/scripts/fix-monitor.sh
fi

$HOME/scripts/generate-i3-config.sh 

