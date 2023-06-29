#!/bin/bash

config_path=$HOME/.config/i3

cat $config_path/base.i3config > $config_path/config 

function add_label() {
  echo -e "\n# ======================" >> $config_path/config 
  echo -e "# ${1^^} MONITOR CONFIG" >> $config_path/config 
  echo -e "# ======================" >> $config_path/config 
}

mode="virtual"

if [ -z "$(xrandr --listactivemonitors | grep 'HDMI-0-1')" ]; then
  mode="regular"
fi

add_label $mode
cat $config_path/$mode-monitor.i3config >> $config_path/config 

i3-msg reload
i3-msg restart
