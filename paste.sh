#!/bin/sh

function split {
	# N E C R O D A N C E R
	echo $1 | sed 's/./& /g'
}

function paste {
	window="^Crypt of the NecroDancer$"
	delay=50
	windowid=$(xdotool search --name "$window")
	echo $(split $1) | xargs xdotool key --window $windowid --delay $delay
}

paste $(xclip -o)
