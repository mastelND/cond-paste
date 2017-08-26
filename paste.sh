#!/bin/sh

window="^Crypt of the NecroDancer$"
windowid=$(xdotool search --name "$window")
delay=50

function clearinput {
	printf "BackSpace %.0s" {1..10} | xargs xdotool key --window $windowid --delay $delay
}

function keepdigits {
	echo "$1" | tr -dc '0-9'
}

function pasteclipboard {
	local input=$(keepdigits "$(xclip -o)")
	echo $input | xargs xdotool type --window $windowid --delay $delay
}

clearinput
pasteclipboard
