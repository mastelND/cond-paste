#!/bin/sh

function normalize {
	echo "$1" | tr -dc '0-9'
}

function split {
	# N E C R O D A N C E R
	echo $1 | sed 's/./& /g'
}

function paste {
	window="^Crypt of the NecroDancer$"
	delay=50
	windowid=$(xdotool search --name "$window")
	input=$(split $(normalize "$1"))
	echo $input | xargs xdotool key --window $windowid --delay $delay
}

paste "$(xclip -o)"
