#!/bin/bash

newsink=$(pacmd list-sinks | grep index | tee /dev/stdout | grep -m1 -A1 "* index" | tail -1 | cut -c12-)

echo "Setting default sink to $newsink"
pacmd set-default-sink $newsink
pacmd list-sink-inputs | grep index | while read line
do
	sinkinput=$(echo $line | cut -f2 -d' ')
	echo "Moving input $sinkinput to $newsink"
	pacmd move-sink-input $sinkinput $newsink
done
