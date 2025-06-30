#!/bin/bash

# Script: install-nodejs.sh
# Description: Install Node.js LTS and npm on Debian/Ubuntu-based systems

set -e

echo "🟢 Starting installation of Node.js LTS and npm..."

# 1. Update package index
sudo apt update

# 2. Install curl if it's not already installed
if ! command -v curl &> /dev/null; then
  echo "🔧 Installing curl..."
  sudo apt install -y curl
fi

# 3. Add NodeSource repository for Node.js LTS (v22.x as of June 2025)
echo "🌐 Adding NodeSource repository for Node.js LTS (v22.x)..."
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# 4. Install Node.js (npm is included)
echo "⬇️ Installing Node.js and npm..."
sudo apt install -y nodejs

# 5. Verify installation
echo ""
echo "✅ Installation complete. Installed versions:"
node -v
npm -v
