#!/bin/bash

# Install curl if it's not already installed
if ! command -v curl &>/dev/null; then
  sudo apt update
  sudo apt install curl -y
fi

# Download and install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Source NVM in this script
source ~/.nvm/nvm.sh

# Install the latest LTS version of Node.js
nvm install --lts

# Set the installed Node.js version as the default
nvm alias default node

# Display Node.js and NVM version
node -v
nvm --version
