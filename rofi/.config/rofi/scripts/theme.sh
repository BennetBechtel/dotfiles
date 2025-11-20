#!/bin/bash
# Read themes file into array
readarray -t themes < ~/.dotfiles/themes/themes.txt
declare -A theme_map=()

# Generate list with theme names (after : in themes.txt)
theme_name_list=()
for line in "${themes[@]}"; do
 id="${line%%:*}" 
 name="${line#*:}" 
 theme_map["$name"]="$id"
 theme_name_list+=("$name")
done

# Show pretty names in rofi
selected=$(printf '%s\n' "${theme_name_list[@]}" | rofi -dmenu -i -p "Choose a Theme:")

# Exit if nothing selected
[ -z "$selected" ] && exit

# Lookup the internal theme ID
theme_id="${theme_map[$selected]}"


# Switch Themes:
#
# swaync
if [ ! -f ~/.config/swaync/themes/$theme_id.css ]; 
then
  notify-send "Swaync: Config not found"
else 
  ln -sf ~/.config/swaync/themes/$theme_id.css ~/.config/swaync/style.css
fi

# sway
if [ ! -f ~/.config/sway/themes/$theme_id ]; 
then
  notify-send "Sway: Config not found"
else 
  ln -sf ~/.config/sway/themes/$theme_id ~/.config/sway/current_theme
  swaymsg reload
fi

# kitty
if [ ! -f ~/.config/kitty/themes/$theme_id.conf ]; 
then
  notify-send "Kitty: Config not found"
else 
  ln -sf ~/.config/kitty/themes/$theme_id.conf ~/.config/kitty/current_theme.conf
  kitty +kitten themes --reload-in=all $theme_id
fi

# neovim
if ! cat ~/.config/nvim/lua/config/plugins/colorscheme.lua | grep -q "${theme_id}"; 
then
  notify-send "Neovim: Config not found"
else 
  echo "vim.cmd(\"colorscheme ${theme_id}\")" > ~/.config/nvim/lua/current-theme.lua
fi

# waybar
ln -sf ~/.config/waybar/themes/$theme_id.css ~/.config/waybar/current_theme.css
killall waybar
waybar &

# swaylock
if [ ! -f ~/.config/swaylock/themes/$theme_id ]; 
then
  notify-send "Swaylock: Config not found"
else 
  ln -sf ~/.config/swaylock/themes/$theme_id ~/.config/swaylock/config
  swaync-client -rs
fi

# rofi
if [ ! -f ~/.config/rofi/themes/$theme_id.rasi ]; 
then
  notify-send "Rofi: Config not found"
else 
  ln -sf ~/.config/rofi/themes/$theme_id.rasi ~/.config/rofi/current_theme.rasi
fi

# starship
STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml"
if [ -f "$STARSHIP_CONFIG" ]; then
  # Check if the palette exists in starship.toml
  if grep -q "^\[palettes\.$theme_id\]" "$STARSHIP_CONFIG"; then
    sed -i "s/^palette = '.*'/palette = '$theme_id'/" "$STARSHIP_CONFIG"
  else
    notify-send "Starship: Palette '$theme_id' not found in config"
  fi
else
  notify-send "Starship: Config not found"
fi

# Send theme name as confirmation
notify-send "Theme: ${selected}"
