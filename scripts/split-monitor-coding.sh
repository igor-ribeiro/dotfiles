#!/bin/bash

source $HOME/.bashrc

set -o pipefail

DP=$(get_displayport_monitor)
HDMI=$(get_hdmi_monitor)
INTERNAL=$(get_internal_monitor)
DP_VIRTUAL=$(get_virtual_monitors ${DP:=none} | join-lines ",")
HDMI_VIRTUAL=$(get_virtual_monitors ${HDMI:=none} | join-lines ",")
MODE="virtual"

# 3 monitors setup
if [ -n "$DP" ] && [ -n "$HDMI" ]; then
  echo "split-coding for 3 monitors not configured"
  exit
# 1 monitor (HDMI)
elif [ -z "$DP" ] && [ -n "$HDMI" ]; then
  echo "Using HDMI monitor"
  EXTERNAL=$HDMI
# 1 monitor (DP)
elif [ -n "$DP" ] && [ -z "$HDMI" ]; then
  echo "Using DP monitor"
  EXTERNAL=$DP
fi

if [ -z "$DP_VIRTUAL" ] && [ -z "$HDMI_VIRTUAL" ]; then
    echo "Generating virtual monitors for $EXTERNAL"

    #                           w    h    x   y     mmw   mmh
    # HDMI-0 connected primary 2560x1080+1920+0     798 x 334
    #
    # w/mmwxh/mmh+x+y where  w, h, x, y are in pixels and mmw, mmh are the
    # physical dimensions of the monitor.
    #
    #                                    w  mmw   h  mmh   x  y
    xrandr --verbose --setmonitor "$EXTERNAL-2" 1706/594x1080/334+854+0 $EXTERNAL
    xrandr --verbose --setmonitor "$EXTERNAL-1" 854/204x1080/334+0+0 none
    xrandr --verbose --fb 2560x1080 
else
    echo "Removing virtual monitors"

    xrandr --verbose --delmonitor "$EXTERNAL-1"
    xrandr --verbose --delmonitor "$EXTERNAL-2"
    
    MODE="regular"
fi

$HOME/scripts/fix-monitor.sh
$HOME/scripts/generate-i3-config.sh $MODE $EXTERNAL $INTERNAL
