#!/usr/bin/bash

# Exit on any error
set -e

BLACK="\e[0;30m"
BLUE="\e[1;34m"
CYAN="\e[36m"
RESET="\e[0m"
UNDERLINE="\e[4m"
NO_UNDERLINE="\e[24m"

echo -e "${BLACK}"

# Print the logo
print_logo() {
    cat << "EOF"
    ______                _ __    __     
   / ____/______  _______(_) /_  / /__   
  / /   / ___/ / / / ___/ / __ \/ / _ \  
 / /___/ /  / /_/ / /__/ / /_/ / /  __/  fedora/ubuntu/mint Linux System Crafting Tool
 \____/_/   \__,_/\___/_/_.___/_/\___/   by: mngste

EOF
}

# Clear screen and show logo
clear
print_logo

echo -e "${BLUE}    Sit back while we install your linux software"
echo

pm='dnf'

if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ "$ID" === "fedora" ]; then
        pm='dnf'
        exit 1
    fi
else
    if [ "$ID" === "linuxmint" ] || [ "$ID" === "ubuntu" ]; then
        pm='apt'
        exit 1
    fi
fi

# Update the system first
echo "${CYAN} Updating system..."
sudo $pm update && sudo $pm upgrade --refresh

# Function to install software
echo "Installing Software"
if [[ -f ./packages.txt ]]; then
  sudo $pm install -y $(cat ./packages.txt)
  echo "Software has been installed"
else
  log_action "packages.txt not found"
fi

# make bat by default
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Install dotfiles
echo "${UNDERLINE} Installing dotfiles/configurations..."
. ./dotfiles-setup.sh

# Making fish default shell
echo "Running sudo chsh -s /usr/bin/fish && chsh -s /usr/bin/fish to change default shell"
sudo chsh -s /usr/bin/fish $(whoami)

# install fresh ide terminal
curl https://raw.githubusercontent.com/sinelaw/fresh/refs/heads/master/scripts/install.sh | sh

echo "${CYAN} Setup complete! You may want to reboot your system."

