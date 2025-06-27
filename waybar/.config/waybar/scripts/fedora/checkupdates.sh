#!/bin/bash

# Check for DNF updates
dnf_updates=$(dnf check-update --quiet 2>/dev/null | grep -E '^[a-zA-Z0-9]' | wc -l)

# You can extend this to include updates from third-party repos if needed

if [[ "$dnf_updates" -eq 0 ]]; then
    echo "<span>✅ No Updates</span>"
else
    echo "<span>🔄 $dnf_updates Updates</span>"
fi
