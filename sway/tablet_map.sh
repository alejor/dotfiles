#!/bin/bash

monitor=`swaymsg -t get_outputs --raw | jq '. | map(select(.serial == "V1W184604799")) | .[0].name' -r`

if [ -n $monitor ]; then
  if [ -e /tmp/tablet_flag ]; then
    swaymsg input "1386:890:Wacom_One_by_Wacom_S_Pen" map_to_region 0 0 1920 1200
    rm -f /tmp/tablet_flag
  else
    swaymsg input "1386:890:Wacom_One_by_Wacom_S_Pen" map_to_region 240 1080 1440 900
    touch /tmp/tablet_flag
  fi
else
  swaymsg input "1386:890:Wacom_One_by_Wacom_S_Pen" map_to_region 0 0 1440 900 
fi
