#!/bin/bash

THRESHOLD=20 # Set your low battery threshold percentage

# Get the battery percentage
BATTERY_LEVEL=$(acpi -b | grep "Battery 1" | grep -P -o '[0-9]+(?=%)')

# Get the battery charging status
STATUS=$(acpi -b | grep "Battery 1" | grep -o "Charging\|Discharging")

# Send notification if the battery level is below the threshold and discharging
if [ "$STATUS" == "Discharging" ] && [ "$BATTERY_LEVEL" -le "$THRESHOLD" ]; then
	notify-send -u critical "Low Battery" "Battery level is at ${BATTERY_LEVEL}%"
fi

# notify-send "HELLO"

# notify-send "HELLOWORLD"
#
# # Get current battery percentage
# battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
#
# # Set threshold values
# warning_level=30
# critical_level=15
#
# # Send notification if battery level is below warning or critical levels
# if [ "$battery_level" -le "$critical_level" ]; then
# 	notify-send -u critical "Battery Critical" "Battery is at ${battery_level}%! Please plug in your charger."
# elif [ "$battery_level" -le "$warning_level" ]; then
# 	notify-send -u normal "Battery Low" "Battery is at ${battery_level}%. Consider charging soon."
# fi
