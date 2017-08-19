#!/bin/sh

function normalize {
	echo "$1" | tr -dc '0-9'
}

function split {
	# N E C R O D A N C E R
	echo $1 | sed 's/./& /g'
}

function paste {
	local window="^Crypt of the NecroDancer$"
	local delay=50
	local windowid=$(xdotool search --name "$window")
	local input=$(split $(normalize "$1"))
	echo $input | xargs xdotool key --window $windowid --delay $delay
}

paste "$(xclip -o)"
