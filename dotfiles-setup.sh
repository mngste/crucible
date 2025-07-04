#!/usr/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="git@github.com:mngste/dotfiles.git"
REPO_NAME="dotfiles"


is_stow_installed() {
  if [[$pm = "pacman"]]; then
    $pm -Qi "stow" &> /dev/null
  else
    $pm list installed "stow" &> /dev/null
  fi 
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  cd "$REPO_NAME/config"
  stow -v -t ~ fish
  stow -v -t ~ nvim
  stow -v -t ~ code
  stow -v -t ~ git
  stow -v -t ~ zed
  stow -v -t ~ fonts
  mv ~/gitignore ~/.gitignore
  fc-cache -f -v
else
  echo "Failed to clone the repository."
  exit 1
fi
