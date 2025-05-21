#!/bin/zsh

# Thanks to: https://github.com/donnybrilliant/install.sh/blob/f659cf869273f39bd839b0ca2ff0ba2a101ebade/install.sh

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
  if [[ $? -ne 0 ]]; then
    echo
    echo "Error installing Chezmoi via Homebrew. Please check the output above."
    exit 1
  fi
fi
echo

echo "Initializing Chezmoi (if needed)..."
chezmoi init https://github.com/dmorrison/dotfiles.git
if [[ $? -ne 0 ]]; then
  echo
  echo "Error initializing Chezmoi. Please check the output above."
  exit 1
fi
echo

echo "Applying dotfiles via Chezmoi..."
chezmoi apply -v
if [[ $? -ne 0 ]]; then
  echo
  echo "Error applying dotfiles via Chezmoi. Please check the output above."
  exit 1
fi
echo

echo "Installing/updating Homebrew items..."
brew bundle install --global
if [[ $? -ne 0 ]]; then
  echo
  echo "Error running brew bundle. Please check the output above."
  exit 1
fi
echo

echo "Setup complete!"
