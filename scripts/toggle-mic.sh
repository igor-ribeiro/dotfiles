#!/bin/bash
is_on=$(amixer set Capture toggle | rg 'Left: Capture' | rg '\[on\]' | wc -l)


state="off"
icons="/usr/share/icons/Pop/32x32"
icon="$icons/devices/audio-input-microphone-off.svg"

if [ $is_on = "1" ]; then
  amixer set Capture '100%'
  state="on"
  icon="$icons/devices/audio-input-microphone.svg"
fi

notify-send -i $icon  "Mic [$state]" -t 5000 -u low  -h string:x-canonical-private-synchronous:mic-toggle
