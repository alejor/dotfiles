#!/bin/bash
until (swww query | grep -q eDP-1)
do
  echo "Waiting for swww to be ready..."
  echo "Waiting for eDP-1 to be ready..."
  sleep 1
done

monitors=`swaymsg -t get_outputs --raw | jq '.[].name' -r`

for m in $monitors
do
  echo "Changing wallpaper in $m" && find ~/wallpapers -type f | shuf -n 1 | xargs swww img -o $m --transition-step 16 --transition-fps 16 &
done
