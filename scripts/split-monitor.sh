#!/bin/bash

if [ -z "$(xrandr --listactivemonitors | grep 'HDMI-0-1')" ]; then
    xrandr --setmonitor HDMI-0-2 1280/399x1080/334+3200+0 HDMI-0
    xrandr --setmonitor HDMI-0-1 1280/399x1080/334+1920+0 none
else
    xrandr --delmonitor HDMI-0-1
    xrandr --delmonitor HDMI-0-2
    xrandr --output HDMI-0 --primary
fi

$HOME/scripts/generate-i3-config.sh 

