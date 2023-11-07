#!/bin/bash

HDMI=$(xrandr | rg connected | rg HDMI | cut -d' ' -f1)
INTERNAL=$(xrandr | rg connected | rg eDP | cut -d' ' -f1)

xrandr --output $HDMI --right-of $INTERNAL --auto --primary
