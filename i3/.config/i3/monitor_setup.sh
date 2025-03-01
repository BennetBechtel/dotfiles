#!/bin/bash

# Identify the displays
INTERNAL_DISPLAY="eDP-1"
MAIN_MONITOR="DP-2-8"
LEFT_MONITOR="DP-2-1-8"
RIGHT_MONITOR="DP-2-1-1-8"

# Check if the external monitors are connected
if xrandr | grep "$MAIN_MONITOR connected"; then
    # External monitors are connected, configure them and disable internal display
    xrandr --output $INTERNAL_DISPLAY --off \
        --output $MAIN_MONITOR --primary --mode 1920x1080 --pos 1080x420 --rotate normal \
        --output $LEFT_MONITOR --mode 1920x1080 --pos 0x0 --rotate left \
        --output $RIGHT_MONITOR --mode 1920x1080 --pos 3000x0 --rotate right
else
    # External monitors are disconnected, enable the laptop screen
    xrandr --output $INTERNAL_DISPLAY --auto --primary \
        --output $MAIN_MONITOR --off \
        --output $LEFT_MONITOR --off \
        --output $RIGHT_MONITOR --off
fi

# Call feh for wallpaper
feh --bg-fill ~/.config/Lighthouse.png
