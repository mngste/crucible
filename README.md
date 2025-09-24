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

- A fresh Fedora/Ubuntu Linux installation
- Internet connection
- sudo privileges
- connect shh and giihub

## Installation

TODO before
```bash
ssh-keygen -t ed25519 -C "mangouste@mosaurus.com"
```
```bash
eval "$(ssh-agent -s)"
```
```bash
ssh-add ~/.ssh/id_ed25519
```
```bash
cat ~/.ssh/id_ed25519.pub
```

1. Clone this repository:

```bash
git clone git@github.com:mngste/crucible.git
```

2. Run the setup script:
```bash
./run.sh
```

3. Follow the prompts to select the packages you want to install.

4. The script will handle the rest of the setup process.

5. After the setup is complete, you can reboot your system to see the changes.

```fish
source "$HOME/.cargo/env.fish"
```
