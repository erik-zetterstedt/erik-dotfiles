#!/bin/sh

feh -B black --bg-center --no-fehbg "$HOME/.bg"
userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

if [ -d $HOME/.config/xinit/xinitrc.d ] ; then
	for f in $HOME/.config/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

nvidia-settings --load-config-only
xrandr --output HDMI1 --left-of HDMI2
xsetroot -cursor_name left_ptr
exec xmonad
