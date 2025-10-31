#!/bin/bash

# File containing package names
PKG_FILE="paru_without_version.txt"

# Check if file exists
if [[ ! -f "$PKG_FILE" ]]; then
    echo "Error: $PKG_FILE not found!"
    exit 1
fi

# Loop through each package in the file
while read -r pkg; do
    # Skip empty lines and comments
    [[ -z "$pkg" || "$pkg" == \#* ]] && continue

    # Check if package is already installed
    if pacman -Qi "$pkg" &>/dev/null; then
        echo "✅ $pkg is already installed."
    else
        echo "📦 Installing $pkg..."
        paru -S --noconfirm "$pkg" || {
            echo "❌ Failed to install $pkg"
        }
    fi
done < "$PKG_FILE"

