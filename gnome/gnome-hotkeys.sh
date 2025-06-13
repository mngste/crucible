# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Unset super+number becuase for some reason gnome silenty changes them?
gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "[]"

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>code10']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>code11']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>code12']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>code13']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>code14']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>code15']"

# Alt+F4 is very cumbersome
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"
