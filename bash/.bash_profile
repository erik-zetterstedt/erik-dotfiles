#
# ~/.bash_profile
#

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
