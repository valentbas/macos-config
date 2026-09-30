#!/bin/zsh
# Set up the Dock: replace all items with the apps and folders listed below.
set -euo pipefail

if ! command -v dockutil >/dev/null; then
  echo "dockutil not found, run 'brew bundle install' first" >&2
  exit 1
fi

apps=(
  "/Applications/KeePassXC.app"
  "/System/Applications/Utilities/Terminal.app"
  "/Applications/Firefox.app"
  "/Applications/Visual Studio Code.app"
  "/System/Applications/Apps.app"
)

folders=(
  #"$HOME/Downloads"
)

dockutil --remove all --no-restart

for app in "${apps[@]}"; do
  if [[ -e "$app" ]]; then
    dockutil --add "$app" --no-restart
  else
    echo "Skipping missing app: $app" >&2
  fi
done

for folder in "${folders[@]}"; do
  dockutil --add "$folder" --view grid --display folder --no-restart
done

# Don't show recently used apps
defaults write com.apple.dock show-recents -bool false

killall Dock
