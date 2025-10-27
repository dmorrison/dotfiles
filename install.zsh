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
  if [[ $? -ne 0 ]]; then
    echo
    echo "☠️ Error installing Homebrew. Please check the output above."
    exit 1
  fi
  echo

  echo "Adding Homebrew to PATH for the current shell that is running the install script..."
  eval "$(/opt/homebrew/bin/brew shellenv)"
  if [[ $? -ne 0 ]]; then
    echo
    echo "☠️ Error adding Homebrew to the current shell's PATH. Please check the output above."
    exit 1
  fi
  echo
fi

echo "Updating Homebrew..."
brew update
if [[ $? -ne 0 ]]; then
  echo
  echo "☠️ Error updating Homebrew. Please check the output above."
  exit 1
fi
echo

echo "Checking if Chezmoi is installed..."
if brew list --versions chezmoi &> /dev/null; then
  echo "Chezmoi is already installed (via Homebrew)."
else
  echo "Chezmoi not found. Installing Chezmoi via Homebrew..."
  brew install chezmoi
  if [[ $? -ne 0 ]]; then
    echo
    echo "☠️ Error installing Chezmoi via Homebrew. Please check the output above."
    exit 1
  fi
fi
echo

echo "Initializing Chezmoi (if needed)..."
chezmoi init https://github.com/dmorrison/dotfiles.git
if [[ $? -ne 0 ]]; then
  echo
  echo "☠️ Error initializing Chezmoi. Please check the output above."
  exit 1
fi
echo

echo "Pulling down my latest dotfiles..."
cd "$(chezmoi source-path)"
git pull
if [[ $? -ne 0 ]]; then
  echo
  echo "☠️ Error pulling down my latest dotfiles. Please check the output above."
  exit 1
fi
echo

echo "Applying dotfiles via Chezmoi..."
chezmoi apply
if [[ $? -ne 0 ]]; then
  echo
  echo "☠️ Error applying dotfiles via Chezmoi. Please check the output above."
  exit 1
fi
echo

echo "Sourcing .zshrc (to initialize Oh My Zsh, etc)..."
source ~/.zshrc
if [[ $? -ne 0 ]]; then
  echo
  echo "☠️ Error sourcing .zshrc. Please check the output above."
  exit 1
fi
echo

echo "Running Homebrew cleanup to remove unlisted packages in Brewfile..."
brew bundle cleanup --global --force
if [[ $? -ne 0 ]]; then
    echo
    echo "☠️ Error during Brewfile cleanup. Please check the output above."
    exit 1
fi
echo

echo "Installing Rosetta 2 (for the \"fujitsu-scansnap-home\" cask, etc)..."
softwareupdate --install-rosetta --agree-to-license
if [[ $? -ne 0 ]]; then
  echo
  echo "☠️ Error install Rosetta 2. Please check the output above."
  exit 1
fi
echo

echo "Installing/upgrading Homebrew items..."
brew bundle install --global
if [[ $? -ne 0 ]]; then
  echo
  echo "☠️ Error running brew bundle. Please check the output above."
  exit 1
fi
echo

echo "Setup complete!"
echo
echo "👋 If this is your first time running this script, execute this manually:"
echo "source ~/.zshrc"
echo
echo "👋👋 If macOS preferences were modified, then you probably need to restart."
echo
