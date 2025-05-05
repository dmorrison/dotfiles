#!/bin/zsh

clear

echo "Starting install script..."

echo "Installing Homebrew..."
# Note: The Homebrew installation script installs the Command Line Developer Tools
# if they're not already installed.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Setup complete!"
echo
echo
