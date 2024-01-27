#!/bin/bash

maim -d 5 -s -u | xclip -selection clipboard -t image/png -i && notify-send "Screenshot copied to clipboard"
