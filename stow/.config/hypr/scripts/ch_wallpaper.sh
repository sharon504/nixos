#!/bin/sh
trans="--transition-fps 60 --transition-type outer --transition-step 90"
swww img "$(sed -n '2p ~/.cache/swww/eDP-1')" $trans
wal -i $(sed -n '2p' ~/.cache/swww/eDP-1)
pkill waybar
waybar &
