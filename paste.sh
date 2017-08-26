#!/bin/sh

function normalize {
	echo "$1" | tr -dc '0-9'
}

function paste {
	local window="^Crypt of the NecroDancer$"
	local delay=50
	local windowid=$(xdotool search --name "$window")
	local input=$(normalize "$1")
	echo $input | xargs xdotool type --window $windowid --delay $delay
}

paste "$(xclip -o)"
