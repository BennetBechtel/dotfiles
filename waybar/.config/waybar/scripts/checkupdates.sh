#!/bin/bash

# Count pacman updates
pacman_updates=$(checkupdates 2>/dev/null | wc -l)

# Count AUR updates (non-interactive)
aur_updates=$(yay -Qum 2>/dev/null | wc -l)

total_updates=$((pacman_updates + aur_updates))

if [[ "$total_updates" -eq 0 ]]; then
    echo "<span>✅ No Updates</span>"
else
    echo "<span>🔄 $total_updates Updates</span>"
fi
