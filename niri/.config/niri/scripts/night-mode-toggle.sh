#!/usr/bin/env bash

dms ipc call night toggle
STATUS=$(dms ipc call night status 2> /dev/null | tr -d '\n' | tr -d '\r')

if echo $STATUS | grep -qi "enabled"; then
	notify-send "Night Mode enabled"
elif echo $STATUS | grep -qi "disabled"; then
	notify-send "Night Mode disabled"
else
	notify-send "Night Mode Toggled"
fi
