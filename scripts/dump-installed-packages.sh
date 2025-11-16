#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------
# Usage check
# -----------------------------------------
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <package-manager> <output-file>"
    exit 1
fi

PACKAGE_MANAGER="$1"
OUT="$2"

# -----------------------------------------
# Supported package managers
# -----------------------------------------
SUPPORTED_PM=("pacman" "paru" "yay" "apt" "dnf" "brew")

# -----------------------------------------
# Validate package manager name
# -----------------------------------------
is_supported=false
for pm in "${SUPPORTED_PM[@]}"; do
    if [[ "$PACKAGE_MANAGER" == "$pm" ]]; then
        is_supported=true
        break
    fi
done

if ! $is_supported; then
    echo "Error: Unsupported package manager '$PACKAGE_MANAGER'"
    echo "Supported managers: ${SUPPORTED_PM[*]}"
    exit 1
fi

# -----------------------------------------
# Validate binary exists
# -----------------------------------------
if ! command -v "$PACKAGE_MANAGER" &>/dev/null; then
    echo "Error: '$PACKAGE_MANAGER' is not installed on this system."
    exit 1
fi

# -----------------------------------------
# Backup file if exists
# -----------------------------------------
if [[ -f "$OUT" ]]; then
    mv "$OUT" "$OUT.bak"
    echo "Backup created → $OUT.bak"
fi

# -----------------------------------------
# Dump installed packages (NO versions)
# -----------------------------------------
echo "Dumping installed packages using '$PACKAGE_MANAGER'..."

case "$PACKAGE_MANAGER" in

    pacman)
        pacman -Qq > "$OUT"
        ;;

    paru)
        paru -Qq > "$OUT"
        ;;

    yay)
        yay -Qq > "$OUT"
        ;;

    apt)
        dpkg-query -W -f='${Package}\n' > "$OUT"
        ;;

    dnf)
        # Remove header line, print only package names
        dnf list installed | awk 'NR>1 {print $1}' | cut -d'.' -f1 > "$OUT"
        ;;

    brew)
        # Print only names of formulae + casks
        {
            brew list --formula
            brew list --cask
        } > "$OUT"
        ;;

esac

echo "Done. Saved → $OUT"
