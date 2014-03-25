#!/bin/bash

#Usage: bash carebearstare <NUMBER OF COLORS>#

avrlights 0 #blank the current pattern
i=1
DEPTH=360
if [[ -n "$1" ]]; then
    DEPTH="$1"
fi

while true; do
    COLOR=$(hsv2rgb $((i % DEPTH)) $DEPTH 1 1 8 10)
    # the above line converts HSV to RGB with 80% brightness

    avrlights $((i%32+1)) 1 "$COLOR" || break
    i=$((i+1))
done
