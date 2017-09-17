#!/bin/bash

extern=DP1

if xrandr | grep "$extern connected"; then
	if xrandr | grep -E "3840x2160[^\*]+\*"; then
		xrandr --output "$extern" --mode 1920x1080
	else
		xrandr --output "$extern" --mode 3840x2160
	fi
fi

