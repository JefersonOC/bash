#!/usr/bin/env bash

echo "Installing Node.js and common frontend development tools..."

# Update package list and install prerequisites
echo "Updating package list and installing prerequisites..."
sudo apt-get update && sudo apt-get install -y \
    yarn \
    ca-certificates \
    curl \
    gnupg

# Add Node.js repository
echo "Setting up Node.js repository..."
NODE_MAJOR=20
NODE_REPO="https://deb.nodesource.com/node_$NODE_MAJOR.x"
NODE_KEY_URL="https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key"
NODE_KEYRING="/etc/apt/keyrings/nodesource.gpg"

curl -fsSL "$NODE_KEY_URL" | sudo gpg --dearmor -o "$NODE_KEYRING"
echo "deb [signed-by=$NODE_KEYRING] $NODE_REPO nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Update package list and install Node.js
echo "Installing Node.js..."
sudo apt-get update && sudo apt-get install -y nodejs

# Install global NPM packages
echo "Installing global NPM packages..."
npm install -g @angular/cli http-server

# Final message
echo "Node.js, NPM, Angular CLI, and Yarn have been successfully installed."
