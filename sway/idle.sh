#!/bin/bash

if [ $# -eq 0 ]; then
  echo "no arguments supplied"
else
  if [ $1 == 'catnap' ]; then
    echo "catnap:$(date +%s)" >> /home/neko/tmp/activity.log
  elif [ $1 == 'kick' ]; then
    echo "kick  :$(date +%s)" >> /home/neko/tmp/activity.log
  elif [ $1 == 'reset' ]; then
    echo "catnap:$(date +%s)" >> /home/neko/tmp/activity.log
    mv /home/neko/tmp/activity.log /home/neko/tmp/activity-$(date +%s).log
    touch /home/neko/tmp/activity.log
  fi
fi
