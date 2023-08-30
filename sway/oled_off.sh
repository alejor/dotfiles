#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No arguments supplied"
else
  if [ $1 == 'timeout' ]; then
    echo "Timeout"
    if [ $2 == 'off' ]; then
      if [ ! -f /tmp/oled_off ]; then
        light -O
        light -S 0
      fi
    else
      if [ ! -f /tmp/oled_off ]; then
        light -I
      fi
    fi
  elif [ $1 == 'command' ]; then
    echo "Command"
    if [ $2 == 'off' ]; then
      if [ ! -f /tmp/oled_off ]; then
        light -O
        light -S 0
        touch /tmp/oled_off
      fi
    else
      if [ -f /tmp/oled_off ]; then
        light -I
        rm /tmp/oled_off
      fi
    fi
  elif [ $1 == 'toggle' ]; then
    if [ ! -f /tmp/oled_off ]; then
      light -O
      light -S 0
      touch /tmp/oled_off
    elif [ -f /tmp/oled_off ]; then
      light -I
      rm /tmp/oled_off
    fi
  fi
fi


