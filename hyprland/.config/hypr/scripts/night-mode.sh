#!/usr/bin/env bash

if pgrep -x "hyprsunset" > /dev/null; then
	killall -9 hyprsunset
	notify-send "Night Light" "Off" -u "low"
else
	hyprsunset --temperature 6000 &
	notify-send "Night Light" "On" -u "low"
fi
