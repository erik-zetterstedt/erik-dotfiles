#!/bin/bash

SINK="$(pactl list sinks short | grep RUNNING | sed -e 's,^\([0-9]*\)[^0-9].*,\1,')"
pactl set-sink-volume $SINK $1

