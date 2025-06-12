FISHERS=(
  "PatrickF1/fzf.fish"
  "joseluisq/gitnow@2.13.0"
)

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

if ! fisher list | grep -i "jorgebucaran/fisher" &> /dev/null; then
    echo "fisher not installed"
    echo "try to reinstall it"
    exit 1
    else 
      for fisher in "${FISHERS[@]}"; do
        if ! fisher list | grep -i "$fisher" &> /dev/null; then
          echo "Installing fisher plugin: $fisher"
          fisher install "$fisher"
        else
          echo "Fisher plugin already installed: $fisher"
        fi
      done
fi



