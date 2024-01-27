#!/bin/bash

source $HOME/.bashrc

set -o pipefail

EXTERNAL=$(get_external_monitor)
INTERNAL=$(get_internal_monitor)
VIRTUAL=$(get_virtual_monitors $EXTERNAL | join-lines ",")
MODE="virtual"

if [ -z "$VIRTUAL" ]; then
    echo "Generating virtual monitors for $EXTERNAL"

    xrandr --setmonitor "$EXTERNAL-2"  1280/399x1080/334+3200+0 $EXTERNAL
    xrandr --setmonitor "$EXTERNAL-1"  1280/399x1080/334+1920+0 none
else
    echo "Removing virtual monitors"

    xrandr --delmonitor "$EXTERNAL-1"
    xrandr --delmonitor "$EXTERNAL-2"
    
    MODE="regular"
fi

$HOME/scripts/fix-monitor.sh
$HOME/scripts/generate-i3-config.sh $MODE $EXTERNAL $INTERNAL
