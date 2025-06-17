# Crucible 🛠️

A Fedora/Ubuntu Linux System Tool that automates the setup and configuration of a Fedora/Ubuntu Linux system with Gnome. It installs and configures packages, desktop environments, and various utilities to create a fully functional development environment.

## Features

- 🔄 Automated system updates
- 📦 Package installation
- 🖥️ GNOME desktop environment setup with tiling-like features
- 🎮 Flatpak integration for specific applications
- ⚙️ Automatic service configuration
- 🔧 GNOME extensions and hotkey configuration

## Prerequisites

- A fresh Fedora Linux installation
- Internet connection
- sudo privileges
- connect shh and giihub

## Installation

1. Clone this repository:

```bash
git clone https://github.com/mngste/crucible.git
```

2. Run the setup script:
```bash
./run.sh
```

3. Follow the prompts to select the packages you want to install.

4. The script will handle the rest of the setup process.

5. After the setup is complete, you can reboot your system to see the changes.

### Install eza

<details>
  <summary>fedora</summary>
  
  ```bash
  wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
  ```
  ```bash
  sudo chmod +x eza
  ```
  ```bash
  sudo chown root:root eza
  ```
  ```bash
  sudo mv eza /usr/bin/eza
  ```
</details>

<details>
  <summary>ubuntu</summary>
  
  Eza is available from [deb.gierens.de](http://deb.gierens.de). The GPG public
  key is in this repo under [deb.asc](/deb.asc).

  First make sure you have the `gpg` command, and otherwise install it via:
  
  ```bash
  sudo apt update
  sudo apt install -y gpg
  ```
  
  Then install eza via:
  
  ```bash
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
  sudo apt update
  sudo apt install -y eza
  ```
</details>

