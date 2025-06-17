#!/usr/bin/bash

# Print the logo
print_logo() {
    cat << "EOF"
    ______                _ __    __     
   / ____/______  _______(_) /_  / /__   
  / /   / ___/ / / / ___/ / __ \/ / _ \  
 / /___/ /  / /_/ / /__/ / /_/ / /  __/  Fedora Linux System Crafting Tool
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
read -p "Sur quel OS lancer le script Fedora, Ubuntu? (f/u/q) " ans;

case $ans in
    f)pm='dnf';;
    u)pm='apt';;
    q)exit;;
esac

# Update the system first
echo "Updating system..."
sudo $pm update

# Function to install software
echo "Installing Software"
if [ -f ./packages.txt ]; then
  sudo $pm install -y $(cat ./packages.txt)
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

# fisher plugin for fish
# echo "Installing fisher app"
# . install-fisher.sh

# Install dotfiles
echo "Installing dotfiles/configurations..."
. dotfiles-setup.sh


echo "Setup complete! You may want to reboot your system."
echo "Run sudo chsh -s /usr/bin/fish && chsh -s /usr/bin/fish to change default shell"
