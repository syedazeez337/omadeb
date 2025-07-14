#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Starting OmaDeb installation..."

for script in ./install/*.sh; do
  echo "▶️ Running: $script"
  bash "$script"
done

echo "✅ OmaDeb installation complete!"
