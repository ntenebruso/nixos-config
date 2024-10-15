#!/usr/bin/env bash

function send_notification() {
  brightness=$(brightnessctl -m | awk -F ',' '{print $4+0}')
  notify-send "Brightness: $brightness%" -r 565 -h "int:value:$brightness" -t 2000
}

case $1 in
  up)
    brightnessctl set 5%+
    send_notification
    ;;
  down)
    brightnessctl set 5%-
    send_notification
    ;;
esac

