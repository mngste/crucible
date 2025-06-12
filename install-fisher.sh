FISHERS=(
  "PatrickF1/fzf.fish"
  "joseluisq/gitnow@2.13.0"
)

for fisher in "${FISHERS[@]}"; do
  if ! fisher list | grep -i "$fisher" &> /dev/null; then
    echo "Installing fisher plugin: $fisher"
    fisher install "$fisher"
  else
    echo "Fisher plugin already installed: $fisher"
  fi
done
