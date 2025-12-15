#!/usr/bin/bash

# Print the logo
print_logo() {
    cat << "EOF"
    ______                _ __    __     
   / ____/______  _______(_) /_  / /__   
  / /   / ___/ / / / ___/ / __ \/ / _ \  
 / /___/ /  / /_/ / /__/ / /_/ / /  __/  Fedora/Ubuntu Linux System Crafting Tool
 \____/_/   \__,_/\___/_/_.___/_/\___/   by: mngste

EOF
}

# Clear screen and show logo
clear
print_logo

# Exit on any error
set -e

# Update the system first
echo "Updating system..."
sudo apt update

# Function to install software
echo "Installing Software"
if [ -f ./packages.txt ]; then
  sudo apt install -y $(cat ./packages.txt)
  echo "Software has been installed"
else
  log_action "packages.txt not found"
fi
  
# Install gnome specific things to make it like a tiling WM
echo "Installing Gnome extensions..."
. gnome/gnome-extensions.sh
echo "Setting Gnome hotkeys..."
. gnome/gnome-hotkeys.sh
echo "Configuring Gnome..."
. gnome/gnome-settings.sh
  
# Some programs just run better as flatpaks. Like discord/spotify
echo "Installing flatpaks (like discord)"
. install-flatpaks.sh

# Install dotfiles
echo "Installing dotfiles/configurations..."
. ./dotfiles-setup.sh

# Making fish default shell
echo "Running sudo chsh -s /usr/bin/fish && chsh -s /usr/bin/fish to change default shell"
sudo chsh -s /usr/bin/fish $(whoami)

# disable version check only for switcher and gnome 48 (to remove when working)
#echo "disable version check only for switcher and gnome 48 (to remove when working)"
#gsettings set org.gnome.shell disable-extension-version-validation "true"

echo "Setup complete! You may want to reboot your system."

