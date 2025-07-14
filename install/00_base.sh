#!/usr/bin/env bash
echo "[00] Installing base packages..."
sudo apt update
sudo apt install -y sudo curl wget git ca-certificates gnupg lsb-release
