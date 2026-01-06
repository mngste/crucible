# Crucible 🛠️

A Mint Linux System Tool that automates the setup and configuration of a Mint Linux system with Gnome (todo). It installs and configures packages, desktop environments, and various utilities to create a fully functional development environment.

## Features

- 🔄 Automated system updates
- 📦 Package installation
- 🖥️ GNOME desktop environment setup with tiling-like features
- 🎮 Flatpak integration for specific applications
- ⚙️ Automatic service configuration
- 🔧 GNOME extensions and hotkey configuration

## Prerequisites

- A fresh Mint Linux installation
- Internet connection
- sudo privileges
- connect shh and github

## Installation

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

5. Install Alacritty
[install alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

6. Run this for fish
```bash
source "$HOME/.cargo/env.fish"
```
```bash
mkdir -p $fish_complete_path[1]
```
```bash
cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish
```

8. Install Jetbrains mono fonts
[jetbrains mono](https://www.jetbrains.com/lp/mono/#how-to-install)

9. After the setup is complete, you can reboot your system to see the changes.
