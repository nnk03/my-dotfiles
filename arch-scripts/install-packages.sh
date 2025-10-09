#!/usr/bin/env bash
# install.sh - Safe Arch package installer with system update (supports multiple packages)

set -e  # Exit on any error

# Check if at least one package name is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <package1> [package2 ...]"
    exit 1
fi

PACKAGES="$@"

# Check Arch news for important announcements
echo "Checking Arch Linux news..."
NEWS=$(curl -s https://archlinux.org/news/)
IMPORTANT=$(echo "$NEWS" | grep -i "important")

if [ -n "$IMPORTANT" ]; then
    echo "⚠️  Important Arch news found! Review before updating:"
    echo "$IMPORTANT"
    read -p "Press Enter to continue updating and installing, or Ctrl+C to cancel..."
fi

# Update system with confirmation
echo "Updating system..."
if command -v yay >/dev/null 2>&1; then
    echo "Using yay (official + AUR packages)"
    yay -Syu
else
    echo "Using pacman (official packages only)"
    sudo pacman -Syu
fi

# Prompt for installing requested packages
echo "Ready to install packages: $PACKAGES"
read -p "Do you want to proceed? [y/N]: " CONFIRM
if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
    if command -v yay >/dev/null 2>&1; then
        yay -S $PACKAGES
    else
        sudo pacman -S $PACKAGES
    fi
    echo "✅ Done! Packages installed successfully."
else
    echo "❌ Installation canceled by user."
fi

