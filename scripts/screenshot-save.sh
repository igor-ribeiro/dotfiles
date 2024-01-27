#!/bin/bash

maim -s -u ~/Pictures/Screenshots/$(date +%s).png && notify-send "Screenshot saved"
