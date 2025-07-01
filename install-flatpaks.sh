FLATPAKS=(
  "brave"
  "discord"
  "zen"
)

sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

for pak in "${FLATPAKS[@]}"; do
  if ! flatpak list | grep -i "$pak" &> /dev/null; then
    echo "Installing Flatpak: $pak"
    sudo flatpak install --noninteractive "$pak"
  else
    echo "Flatpak already installed: $pak"
  fi
done
