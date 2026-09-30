#!/bin/zsh
# Set up the Mac: install Homebrew, everything in the Brewfile, Starship, Git identity, then the Dock.
set -euo pipefail

cd "${0:A:h}"

if ! command -v brew >/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add Homebrew to PATH
if ! grep -qs 'brew shellenv' ~/.zprofile; then
  echo "Adding Homebrew to PATH..."
  echo >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
fi
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

echo "Installing Brewfile..."
brew bundle install

# Enable the Starship prompt
if ! grep -qs 'starship init' ~/.zshrc; then
  echo "Enabling Starship..."
  echo >> ~/.zshrc
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

echo "Setting Git name and email..."
git config --global user.name "valentbas"
git config --global user.email "283480750+valentbas@users.noreply.github.com"

echo "Setting up the Dock..."
./dock.zsh
