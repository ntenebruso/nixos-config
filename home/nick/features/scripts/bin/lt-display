#!/usr/bin/env bash

case $1 in
  off)
    hyprctl keyword monitor "eDP-1, disable"
    ;;
  on)
    monitor_state=$(grep "eDP-1" ~/.config/hypr/monitors.conf | cut -d "=" -f2)
    hyprctl keyword monitor "$monitor_state"
    ;;
esac

