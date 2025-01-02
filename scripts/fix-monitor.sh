#!/bin/bash

source $HOME/.bashrc

EXTERNAL=$(get_hdmi_monitor)
INTERNAL=$(get_internal_monitor)

if [[ $EXTERNAL ]]; then
  echo "Setting external monitor as primary"
  xrandr --output $(get_hdmi_monitor) --auto --primary
  xrandr --output $(get_internal_monitor) --right-of $(get_hdmi_monitor) --auto
else
  echo "Setting internal monitor as primary"
  xrandr --output $(get_internal_monitor) --auto --primary
fi
