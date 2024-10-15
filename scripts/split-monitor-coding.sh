#!/bin/bash

source $HOME/.bashrc

set -o pipefail

DP=$(get_displayport_monitor)
HDMI=$(get_hdmi_monitor)
INTERNAL=$(get_internal_monitor)
DP_VIRTUAL=$(get_virtual_monitors $DP | join-lines ",")
HDMI_VIRTUAL=$(get_virtual_monitors $HDMI | join-lines ",")
MODE="virtual"

# 3 monitors setup
if [ -n "$DP" ] && [ -n "$HDMI" ]; then
  return
# 2 monitors (DP & internal)
elif [ -n "$DP" ] && [ -z "$HDMI" ]; then
  return
# 2 monitors (HDMI & internal)
elif [ -z "$DP" ] && [ -n "$HDMI" ]; then
  return
fi


if [ -z "$VIRTUAL" ]; then
    echo "Generating virtual monitors for $EXTERNAL"

    #                           w    h    x   y     mmw   mmh
    # HDMI-0 connected primary 2560x1080+1920+0     798 x 334
    #
    # w/mmwxh/mmh+x+y where  w, h, x, y are in pixels and mmw, mmh are the
    # physical dimensions of the monitor.
    #
    #                                    w  mmw   h  mmh   x  y
    xrandr --setmonitor "$EXTERNAL-2"  1706/594x1080/334+2774+0 $EXTERNAL
    xrandr --setmonitor "$EXTERNAL-1"  854/204x1080/334+1920+0 none
else
    echo "Removing virtual monitors"

    xrandr --delmonitor "$EXTERNAL-1"
    xrandr --delmonitor "$EXTERNAL-2"
    
    MODE="regular"
fi

$HOME/scripts/fix-monitor.sh
$HOME/scripts/generate-i3-config.sh $MODE $EXTERNAL $INTERNAL
