#!/bin/bash

monitor=`swaymsg -t get_outputs --raw | jq '. | map(select(.serial == "V1W184604799")) | .[0].name' -r`
if [ -n $monitor ]; then
  find ~/wallpapers -type f | shuf -n 1 | xargs swww img -o $monitor
fi
find ~/wallpapers -type f | shuf -n 1 | xargs swww img -o eDP-1
