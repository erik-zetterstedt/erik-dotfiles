#!/bin/bash

if setxkbmap -query | grep 'se' &>/dev/null ; then
	setxkbmap -layout us -option 'caps:hyper'
else
	setxkbmap -layout se -option 'caps:hyper'
fi
