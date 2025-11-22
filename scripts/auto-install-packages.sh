#!/usr/bin/env bash

# usage:
#   ./auto-install-packages.sh <package-manager> <file> [--dryRun]

# -----------------------------
# Help option
# -----------------------------
if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    echo "Usage: $0 <package-manager> <file-with-packages> [--dryRun]"
    echo
    echo "Example:"
    echo "  $0 dnf dnf.packages"
    echo "  $0 pacman arch.packages --dryRun"
    echo
    echo "Supported package managers: apt, brew, pacman, paru, yay, dnf"
    exit 0
fi

PACKAGE_MANAGER="$1"
PKG_FILE="$2"
DRY_RUN=false

# -----------------------------
# Optional dry-run flag
# -----------------------------
if [[ "$3" == "--dryRun" ]]; then
    DRY_RUN=true
fi

# -----------------------------
# Validate arguments
# -----------------------------
if [[ -z "$PACKAGE_MANAGER" || -z "$PKG_FILE" ]]; then
    echo "Usage: $0 <package-manager> <file-with-packages> [--dryRun]"
    exit 1
fi

SUPPORTED_MANAGERS=(
    "apt"
    "brew"
    "pacman"
    "paru"
    "yay"
    "dnf"
)

if [[ ! " ${SUPPORTED_MANAGERS[*]} " =~ " ${PACKAGE_MANAGER} " ]]; then
    echo "Error: Unsupported package manager '$PACKAGE_MANAGER'"
    echo "Supported: ${SUPPORTED_MANAGERS[*]}"
    exit 1
fi

if ! command -v "$PACKAGE_MANAGER" >/dev/null 2>&1; then
    echo "Error: '$PACKAGE_MANAGER' is not installed on this system."
    exit 1
fi

if [[ ! -f "$PKG_FILE" ]]; then
    echo "Error: File '$PKG_FILE' does not exist"
    exit 1
fi

if [[ ! -s "$PKG_FILE" ]]; then
    echo "Error: File '$PKG_FILE' is empty"
    exit 1
fi

if [[ "$DRY_RUN" == true ]]; then
    echo "[dry-run mode ON]"
    echo "Listing missing packages only:"
    echo
fi

# for dnf enabled copr repos if not yet enabled
# File path is assumed to be <input-file>.copr.enabled
enable_coprs_if_needed() {
    local copr_file="${PKG_FILE}.copr.enabled"

    if [[ ! -f "$copr_file" ]]; then
        echo "No COPR list found ($copr_file). Skipping COPR enable step."
        return
    fi

    echo "Checking COPR repos from $copr_file ..."
    echo

    dnf copr list | awk ' {print $1 } ' > /tmp/current_coprs.txt

    while IFS= read -r copr; do
        [[ -z "$copr" || "$copr" =~ ^# ]] && continue

        if grep -q "$copr" /tmp/current_coprs.txt; then
            echo "COPR already enabled: $copr"
            continue
        fi

        if [[ "$DRY_RUN" == true ]]; then
            echo "Would enable COPR: $copr"
        else
            echo "Enabling COPR: $copr"
            sudo dnf copr enable -y "$copr"
        fi

    done < "$copr_file"

    echo
    echo "COPR check complete."
    echo
}

# -----------------------------
# Check if a package is installed
# -----------------------------
is_installed() {
    local pkg="$1"

    case "$PACKAGE_MANAGER" in
        apt)
            dpkg -s "$pkg" &>/dev/null
            ;;
        pacman)
            pacman -Qi "$pkg" &>/dev/null
            ;;
        paru)
            paru -Qi "$pkg" &>/dev/null
            ;;
        yay)
            yay -Qi "$pkg" &>/dev/null
            ;;
        dnf)
            rpm -q "$pkg" &>/dev/null
            ;;
        brew)
            brew list --formula | grep -qx "$pkg"
            ;;
    esac
}

# -----------------------------
# Install a package (skips if dry-run)
# -----------------------------
install_pkg() {
    local pkg="$1"

    case "$PACKAGE_MANAGER" in
        apt)
            sudo apt install -y "$pkg"
            ;;
        pacman)
            sudo pacman -S --noconfirm "$pkg"
            ;;
        paru)
            paru -S --noconfirm "$pkg"
            ;;
        yay)
            yay -S --noconfirm "$pkg"
            ;;
        dnf)
            sudo dnf install -y "$pkg"
            ;;
        brew)
            brew install "$pkg"
            ;;
    esac
}

# -----------------------------
# If using DNF, enable COPR repos first
# -----------------------------
if [[ "$PACKAGE_MANAGER" == "dnf" ]]; then
    enable_coprs_if_needed
fi

# -----------------------------
# Main processing loop
# -----------------------------
while IFS= read -r pkg; do
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

    if is_installed "$pkg"; then
        # dry-run: skip installed packages
        echo "Already installed: $pkg"
        continue
    fi

    if [[ "$DRY_RUN" == true ]]; then
        echo "Would install: $pkg"
    else
        echo "Installing: $pkg"
        install_pkg "$pkg"
        echo
    fi

done < "$PKG_FILE"

if [[ "$DRY_RUN" == true ]]; then
    echo
    echo "[dry-run complete]"
else
    echo "Done!"
fi
