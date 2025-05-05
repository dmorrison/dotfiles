#!/bin/zsh

clear

echo "Starting install script..."

echo "Getting sudo access..."
sudo -v

echo "Keeping sudo access until the script is finished..."
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Installing Homebrew..."
# Note: The Homebrew installation script installs the Command Line Developer Tools (needed
# for Git, etc) if they're not already installed.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Setup complete!"
echo
