#!/bin/zsh

echo "Starting install script..."
echo

echo "Getting sudo access..."
sudo -v
echo

echo "Keeping sudo access until the script is finished..."
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &
echo

echo "Checking for Homebrew..."
if command -v brew &> /dev/null; then
  echo "Homebrew is already installed."
  echo
else
  echo "Homebrew not found. Installing..."

  # Note: The Homebrew installation script installs the Command Line Developer Tools (needed
  # for Git, etc) if they're not already installed.
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo
fi

echo "Checking if Chezmoi is installed..."
if brew list --versions chezmoi &> /dev/null; then
  echo "Chezmoi is already installed (via Homebrew)."
else
  echo "Chezmoi not found. Installing Chezmoi via Homebrew..."
  brew install chezmoi
fi
echo

echo "Setup complete!"
