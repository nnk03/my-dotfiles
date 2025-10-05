#!/usr/bin/env bash

# get all monitor IDs
monitors=($(hyprctl monitors -j | jq -r '.[].id'))
current=$(hyprctl activeworkspace -j | jq '.monitorID')

# find index of current monitor in list
for i in "${!monitors[@]}"; do
    if [[ "${monitors[$i]}" == "$current" ]]; then
        next_index=$(( (i + 1) % ${#monitors[@]} ))
        next_monitor=${monitors[$next_index]}
        hyprctl dispatch movecurrentworkspacetomonitor "$next_monitor"
        exit 0
    fi
done

