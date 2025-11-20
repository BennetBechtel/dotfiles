#!/bin/bash

# Rofi wallpaper selector for Sway with fast preview
# Requires: rofi, imagemagick

WALLPAPER_DIR="$HOME/.config/backgrounds"
CACHE_DIR="$HOME/.cache/rofi-wallpaper"

# Create cache directory for thumbnails
mkdir -p "$CACHE_DIR"

# Get list of images
cd "$WALLPAPER_DIR" || exit 1
wallpapers=$(find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sed 's|^\./||' | sort)

# Generate thumbnails in parallel (much faster!)
generate_thumb() {
    img="$1"
    thumb="$CACHE_DIR/$(echo "$img" | sed 's/[^a-zA-Z0-9]/_/g').png"
    if [ ! -f "$thumb" ]; then
        convert "$WALLPAPER_DIR/$img" -resize 200x200^ -gravity center -extent 200x200 -quality 85 "$thumb" 2>/dev/null
    fi
}

export -f generate_thumb
export WALLPAPER_DIR CACHE_DIR

# Parallel thumbnail generation (way faster)
echo "$wallpapers" | xargs -P 4 -I {} bash -c 'generate_thumb "{}"'

# Create rofi entries with icon paths
entries=""
for img in $wallpapers; do
    thumb="$CACHE_DIR/$(echo "$img" | sed 's/[^a-zA-Z0-9]/_/g').png"
    entries="$entries$img\x00icon\x1f$thumb\n"
done

# Show rofi menu with icons
chosen=$(echo -en "$entries" | rofi -dmenu -i -p "Select Wallpaper" \
    -show-icons \
    -theme-str 'window {width: 70%;} listview {columns: 4; lines: 3;}')

# If user selected something, set it as wallpaper
if [ -n "$chosen" ]; then
    # Save the current wallpaper for next startup
    echo "$WALLPAPER_DIR/$chosen" > "$HOME/.config/current_wallpaper"
    swaymsg reload
fi
