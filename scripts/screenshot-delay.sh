#!/bin/bash

maim -d 2 -s -u | xclip -selection clipboard -t image/png -i && notify-send "Screenshot copied to clipboard"
