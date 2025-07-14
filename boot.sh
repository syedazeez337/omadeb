#!/usr/bin/env bash
set -euo pipefail

ascii_art='
   ___  ___   __  ________  ________
  |\  \|\  \|\  \|\   __  \|\   __  \
  \ \  \\\  \ \  \ \  \|\  \ \  \|\  \
   \ \   __  \ \  \ \  \\\  \ \   _  _\
    \ \  \ \  \ \  \ \  \\\  \ \  \\  \|
     \ \__\ \__\ \__\ \_______\ \__\\ _\
      \|__|\|__|\|__|\|_______|\|__|\|__|

       OMADEB: Debian Made Beautiful
'

echo "$ascii_art"
echo "Welcome to OmaDeb! A project to turn Debian into an awesome OS."
echo

# Check OS
if ! grep -qi "debian" /etc/os-release; then
    echo "[ERROR] This installer only works on Debian." >&2
    exit 1
fi

# Check for git
if ! command -v git >/dev/null 2>&1; then
    echo "📦 'git' not found. Installing it first..."
    sudo apt update
    sudo apt install -y git
fi

# Clone full repo
TMP_DIR="$(mktemp -d)"
echo "📥 Cloning OmaDeb repo into $TMP_DIR"
git clone --depth=1 https://github.com/syedazeez337/omadeb.git "$TMP_DIR"

cd "$TMP_DIR"
bash install.sh
