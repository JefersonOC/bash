#!/usr/bin/env bash

set -e # Exit immediately if a command exits with a non-zero status
set -o pipefail # Exit if any command in a pipeline fails

echo "Installing and configuring Python 3..."

# Update package list
echo "Updating package list..."
sudo apt-get update

# Install Python 3 and necessary development tools and libraries
echo "Installing Python 3 and required development dependencies..."
sudo apt-get install -y \
    python3 \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    pkg-config \
    wget

echo "Python 3 and development dependencies have been successfully installed."

