#!/bin/bash
a=$1
b=$(( a / 2 ))
while [ $(pgrep -c walltimer.sh) -eq 1 ]
do
  sleep $b
  ~/.config/sway/wallpaper.sh
  sleep $b
done

