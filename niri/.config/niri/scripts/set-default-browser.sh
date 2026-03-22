#!/usr/bin/env bash

# Define common desktop entry locations
SEARCH_PATHS=(
    "/usr/share/applications"
    "/usr/local/share/applications"
    "$HOME/.local/share/applications"
)

# Find the first firefox desktop file using a regex-like glob
# This handles 'firefox.desktop', 'org.mozilla.firefox.desktop', and 'firefox-esr.desktop'
DESKTOP_FILE=$(find "${SEARCH_PATHS[@]}" -name "*firefox*.desktop" 2>/dev/null | head -n 1 | xargs basename)

if [ -n "$DESKTOP_FILE" ]; then
    echo "Found browser: $DESKTOP_FILE. Setting as default..."
    # xdg-settings set default-web-browser "$DESKTOP_FILE"
    # Optional: Set environment variables for DMS and other apps
	 # Not needed in my case ?
    # export BROWSER="$DESKTOP_FILE"
else
    echo "No Firefox desktop file found."
    exit 1
fi
