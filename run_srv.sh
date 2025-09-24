#!/usr/bin/bash

# Print the logo
print_logo() {
    cat << "EOF"
    ______                _ __    __     
   / ____/______  _______(_) /_  / /__   
  / /   / ___/ / / / ___/ / __ \/ / _ \  
 / /___/ /  / /_/ / /__/ / /_/ / /  __/  Fedora/Ubuntu Server Linux System Crafting Tool
 \____/_/   \__,_/\___/_/_.___/_/\___/   by: mngste

EOF
}

# Clear screen and show logo
clear
print_logo

# Exit on any error
set -e

# ask if ubuntu or fedora
pm=''
read -p "On which OS, do you launch the script Fedora, Ubuntu? (f/u/q) " ans;

case $ans in
    f)pm='dnf';;
    u)pm='apt';;
    q)exit;;
esac

# Update the system first
echo "Updating system..."
sudo "$pm" update

# Function to install software
echo "Installing Software"
if [ -f ./packages_srv.txt ]; then
  sudo "$pm" install -y $(cat ./packages_srv.txt)
  echo "Software has been installed"
else
  log_action "packages_srv.txt not found"
fi

# Install dotfiles
echo "Installing dotfiles/configurations..."
. ./dotfiles-setup.sh

# Making fish default shell
echo "Running sudo chsh -s /usr/bin/fish && chsh -s /usr/bin/fish to change default shell"
sudo chsh -s /usr/bin/fish $(whoami)

# Install Rust and Eza
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
source "$HOME/.cargo/env.fish"

echo "Setup complete! You may want to reboot your system."
