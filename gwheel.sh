#!/bin/bash

avrlights 0 #blank the current pattern
i=1

#a BASH array for various shades of green plus buffer LEDs (first and last)
colors=( 0 0x2200 0x8800 0x8800 0x8800 0x8800 0x8800 0x2200 0 )
arr_size=9 #the number of elements in the above array
led_count=32
while true; do
	left=$(( led_count - i ))
	count=$arr_size
	j=0
	if [[ $left -le $arr_size ]]; then
		count=$left
		j=$(( arr_size - left ))
		avrlights 1 $(( arr_size - left )) ${colors[@]:left:$(( arr_size - left ))}
	fi

	avrlights $(( i + 1)) $count ${colors[@]}
	i=$(( ( i + 1 ) % led_count ))
	usleep 15000
done
