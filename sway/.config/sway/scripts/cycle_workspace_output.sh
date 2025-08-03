#!/bin/bash

# Get outputs in order
outputs=($(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name'))

# Get the current workspace's output
current_output=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')

# Find index of current output
for i in "${!outputs[@]}"; do
	if [[ "${outputs[$i]}" == "$current_output" ]]; then
		current_index=$i
		break
	fi
done

# Compute next output (wrap around)
next_index=$(((current_index + 1) % ${#outputs[@]}))
next_output="${outputs[$next_index]}"

# Move current workspace to the next output
swaymsg move workspace to output "$next_output"
