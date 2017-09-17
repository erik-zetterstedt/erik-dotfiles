POINTERS=$(xinput | sed -n -r -e '/Virtual/d' -e '/pointer/p' | cut -f 2 | cut -d "=" -f 2)
set -- $POINTERS

xinput list-props $1 | grep -E "Device Enabled \([0-9]+\):.+1" > /dev/null
DISABLE=$?

if [ $DISABLE -eq 0 ]; then
	xdotool mousemove 10000 10000
fi

for pointer in $POINTERS; do
	if [ $DISABLE -eq 0 ]; then
		xinput --disable $pointer
	else
		xinput --enable $pointer
	fi
done

