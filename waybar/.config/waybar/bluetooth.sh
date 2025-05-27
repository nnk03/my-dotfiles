#!/bin/bash

status=$(bluetoothctl show | grep "Powered: yes" &> /dev/null && echo "on" || echo "off")
devices=$(bluetoothctl paired-devices | wc -l)
connected_devices=$(bluetoothctl info | grep "Connected: yes" | wc -l)

if [ "$status" = "on" ]; then
    if [ "$connected_devices" -gt 0 ]; then
        status="connected"
    else
        status="on"
    fi
else
    status="off"
fi

echo "{\"status\": \"$status\", \"icon\": \"\"}"

