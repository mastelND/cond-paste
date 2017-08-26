#!/bin/sh

function pastetond {
	local window='^Crypt of the NecroDancer$'
	local delay=50
	echo "$1" | xargs xdotool search --name "$window" key --delay $delay
}

function clearinput {
	pastetond "$(printf 'BackSpace %.0s' {1..10})"
}

function pasteclipboard {
	local clipboard=$(xclip -o)
	local onlydigits=$(echo $clipboard | tr -dc '0-9')
	local input=$(echo $onlydigits | sed 's/./& /g')
	pastetond "$input"
}

clearinput
pasteclipboard
