#!/usr/bin/env bash

protonvpn-app &

# Wait until the window actually appears instead of a fixed sleep
sleep 1
while ! swaymsg -t get_tree | grep -q "protonvpn-app"; do
  sleep 0.5
done

swaymsg '[app_id="protonvpn-app"] kill'
