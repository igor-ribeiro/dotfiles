#!/bin/bash
is_on=$(amixer set Master toggle | rg 'Left: Playback' | rg '\[on\]' | wc -l)


state="off"
icons="~/.local/icons"
icon="$icons/audio-input-microphone-off.svg"

if [ $is_on = "1" ]; then
  amixer set Master '100%'
  state="on"
  icon="$icons/audio-input-microphone.svg"
fi

notify-send -i $icon  "Speaker [$state]" -t 5001 -u low  -h string:x-canonical-private-synchronous:toggle-speaker
