#!/bin/bash

# Log file for debugging
LOGFILE="/tmp/monitor_switch.log"

# Get initial monitor state
LAST_STATE=""

while true; do
    # Check connected monitors
    CURRENT_STATE=$(xrandr | grep " connected" | awk '{print $1}' | sort | tr '\n' ' ')

    # If the state has changed, reapply the setup
    if [ "$CURRENT_STATE" != "$LAST_STATE" ]; then
        echo "$(date) - Monitor configuration changed. Running monitor setup..." | tee -a "$LOGFILE"
        ~/.config/i3/monitor_setup.sh
        LAST_STATE="$CURRENT_STATE"
    fi

    # Wait before checking again (adjust if needed)
    sleep 2
done
