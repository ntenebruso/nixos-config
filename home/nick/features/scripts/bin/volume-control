#!/usr/bin/env bash

function get_volume() {
  echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F ': ' '{print $2 * 100}')
}

function send_notification() {
  volume=$(get_volume)
  notify-send "Volume: $volume%" -r 555 -h "int:value:$volume" -t 2000
}

case $1 in
  up)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.0
    send_notification
    ;;
  down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
    send_notification
    ;;
  mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
esac

