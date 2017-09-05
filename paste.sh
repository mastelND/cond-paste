#!/bin/sh

function pastetond {
	local seed="$1"
	local delay=${2:-50}
	local window='^Crypt of the NecroDancer$'
	echo "$seed" | xargs xdotool search --name "$window" key --delay $delay
}

function clearinput {
	pastetond "$(printf 'BackSpace %.0s' {1..10})" 30
}

function pasteclipboard {
	local clipboard=$(xclip -o)
	local onlydigits=$(echo $clipboard | tr -dc '0-9')
	local input=$(echo $onlydigits | sed 's/./& /g')
	pastetond "$input"
}

clearinput
pasteclipboard
