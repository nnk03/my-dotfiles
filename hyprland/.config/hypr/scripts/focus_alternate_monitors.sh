#!/usr/bin/env bash

# File to store last focused monitor
STATE_FILE="$HOME/.last_focused_monitor"

# Get all monitor IDs
monitors=($(hyprctl monitors -j | jq -r '.[].id'))

# Get current active monitor
current=$(hyprctl activeworkspace -j | jq -r '.monitorID')

# Read last focused monitor from file
if [[ -f "$STATE_FILE" ]]; then
    last=$(<"$STATE_FILE")
else
    last=""
fi

# Determine next monitor
if [[ "$last" != "" && "$last" != "$current" ]]; then
    # Switch back to the last monitor
    next_monitor="$last"
else
    # Pick the next monitor in list (wrap around)
    for i in "${!monitors[@]}"; do
        if [[ "${monitors[$i]}" == "$current" ]]; then
            next_index=$(( (i + 1) % ${#monitors[@]} ))
            next_monitor=${monitors[$next_index]}
            break
        fi
    done
fi

# Focus the next monitor
hyprctl dispatch focusmonitor "$next_monitor"

# Save current monitor as last
echo "$current" > "$STATE_FILE"

