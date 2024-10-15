#!/bin/bash

ULTRA=DP-0 
INTERNAL=eDP-1-1
HDMI=HDMI-0

xrandr --output $ULTRA --auto --left-of $INTERNAL
xrandr --output $HDMI --auto --left-of $ULTRA

