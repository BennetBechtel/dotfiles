#!/usr/bin/env bash

swaymsg '[app_id="proton.vpn.app.gtk"] kill'

protonvpn-app &

# Wait until the window actually appears instead of a fixed sleep
sleep 1
while ! swaymsg -t get_tree | grep -q "proton.vpn.app.gtk"; do
  sleep 0.5
done

swaymsg '[app_id="proton.vpn.app.gtk"] kill'
