#!/bin/sh

while true
do
	grep "POWER_SUPPLY_CAPACITY=\(1[0-9]\|[0-9]\)$" /sys/class/power_supply/BAT0/uevent >/dev/null && notify-send -u critical "Battery!"
	sleep 5m
done
