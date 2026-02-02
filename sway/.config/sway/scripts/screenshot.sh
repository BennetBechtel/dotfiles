#!/usr/bin/env bash

# Screenshot directory from argument or default
SCREENSHOT_DIR="${1:-$HOME/.Screenshots}"

# Create directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Generate filename with timestamp
FILENAME="$SCREENSHOT_DIR/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

# Check if we're doing a region capture (second argument)
if [ "$2" = "region" ]; then
    grim -g "$(slurp)" "$FILENAME"
else
    grim "$FILENAME"
fi

# Check if screenshot was successful
if [ $? -eq 0 ]; then
    notify-send "Screenshot saved" "$FILENAME"
else
    notify-send "Screenshot failed" "Error saving screenshot"
fi
