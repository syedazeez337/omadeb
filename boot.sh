#!/usr/bin/env bash
set -euo pipefail

ascii_art='
   ___  ___   __  ________  ________
  |\  \\  \\  \\|\   __  \\|\   __  \\
  \ \\  \\  \\ \\ \\ \\  \\|\  \\ \\  \\
   \ \\   __  \\ \\ \\ \\  \\ \\  \\ \\  \\
    \ \\  \\ \\  \\ \\ \\ \\  \\ \\  \\ \\  \\
     \ \\__\\ \\__\\ \\__\\_______\\ \\__\\ \\__\\
      \|__|\|__|\|__|\|_______|\|__|\|__|

       OMADEB: Debian Made Beautiful
'

echo "$ascii_art"
echo "Welcome to OmaDeb! A project to turn Debian into an awesome OS."
echo

if ! grep -qi "debian" /etc/os-release; then
    echo "[ERROR] This installer only works on Debian." >&2
    exit 1
fi

INSTALL_SCRIPT="./install.sh"

if [ ! -f "$INSTALL_SCRIPT" ]; then
    echo "[ERROR] install.sh not found!" >&2
    exit 2
fi

read -rp "Proceed with installation? [Y/n]: " confirm
confirm="${confirm:-Y}"
if [[ "$confirm" =~ ^[Nn]$ ]]; then
    echo "Aborted."
    exit 0
fi

bash "$INSTALL_SCRIPT"
