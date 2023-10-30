#!/bin/bash

source $HOME/.bashrc

HDMI=$(get-monitor-by-name HDMI)
VIRTUAL_HDMI=$(get-monitor-by-name HDMI-0-1)

if [ -z "$VIRTUAL_HDMI" ]; then
    xrandr --setmonitor HDMI-0-2 1280/399x1080/334+3200+0 $HDMI
    xrandr --setmonitor HDMI-0-1 1280/399x1080/334+1920+0 none
else
    xrandr --delmonitor HDMI-0-1
    xrandr --delmonitor HDMI-0-2
    $HOME/scripts/fix-monitor.sh
fi

$HOME/scripts/generate-i3-config.sh 

