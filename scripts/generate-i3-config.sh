#!/bin/bash

source ~/.bashrc

MODE=$1
EXTERNAL=$2
INTERNAL=$3

CONFIG_PATH=$HOME/.config/i3
CONFIG_FILE=$CONFIG_PATH/config

function show_usage() {
  echo -e "
Usage:
  $> generate-i3-config.sh <virtual|regular> <EXTERNAL> <INTERNAL>"
}

function show_error() {
  echo "ERROR: $1"
  show_usage
  exit 1
}

function add_label() {
  echo -e "\n" >> $CONFIG_FILE
  echo -e "# ======================" >> $CONFIG_FILE
  echo -e "# ${MODE^^} MONITOR CONFIG" >> $CONFIG_FILE
  echo -e "# ======================" >> $CONFIG_FILE
}

function setup_config() {
  cat $CONFIG_PATH/base.i3config > $CONFIG_FILE
  add_label
  cat $CONFIG_PATH/$MODE-monitor.i3config >> $CONFIG_FILE
}

if [ -z "$MODE" ]; then
  echo $@
  show_error "Mising mode"
fi

if [ "$MODE" != "3" ]; then
  if [ -z "$EXTERNAL" ]; then
    show_error "Mising external monitor"
  fi

  if [ -z "$INTERNAL" ]; then
    show_error "Mising internal monitor"
  fi
fi

setup_config

if [ "$MODE" = "3" ]; then
  sed -i -e "s/<HDMI>/$(get_hdmi_monitor)/" $CONFIG_FILE
  sed -i -e "s/<DP>/$(get_displayport_monitor)/" $CONFIG_FILE
  sed -i -e "s/<INTERNAL>/$(get_internal_monitor)/" $CONFIG_FILE
else
  sed -i -e "s/<EXTERNAL>/$EXTERNAL/" $CONFIG_FILE
  sed -i -e "s/<VIRTUAL_1>/$EXTERNAL-1/" $CONFIG_FILE
  sed -i -e "s/<VIRTUAL_2>/$EXTERNAL-2/" $CONFIG_FILE
  sed -i -e "s/<INTERNAL>/$INTERNAL/" $CONFIG_FILE
fi

i3-msg reload > /dev/null
i3-msg restart > /dev/null
