#!/bin/bash

avrlights 0 #blank the current pattern
i=1

#a BASH array for various shades of orange plus buffer LEDs (first and last)
colors=( 0 0x442200 0xbb8800 0xbb8800 0xbb8800 0xbb8800 0xbb8800 0x442200 0 )
arr_size=9 #number of elements in the above array
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
	i=$(( ( i - 1 + led_count ) % led_count )) #NOTE THAT THIS ONE GOES BACKWARDS
	usleep 5000
done
