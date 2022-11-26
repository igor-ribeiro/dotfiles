#!/bin/bash
is_on=$(amixer sset Capture toggle | rg 'Left: Capture' | rg '\[on\]' | wc -l)

icons="~/.local/icons"

if [ $is_on = "1" ]; then
  amixer set Capture 100%
  notify-send -i "$icons/audio-input-microphone.svg" "Mic [on]" -t 4000 -u low -h string:x-canonical-private-synchronous:toggle-mic
  exit
fi

notify-send -i "$icons/audio-input-microphone-off.svg" "Mic [muted]" -u critical -h string:x-canonical-private-synchronous:toggle-mic
