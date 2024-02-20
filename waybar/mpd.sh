#!/bin/bash

PLAYER=$(playerctl -l | head -n 1)
status () {
  cat /tmp/status.txt
  if [ "$( pgrep -c playerctl )" == "1" ]; then
    playerctl metadata --format '{"text":"{{artist}} - {{title}}", "tooltip":"{{playerName}}:{{lc(status)}}"}' -p "$PLAYER"  > /tmp/status_new.txt && mv /tmp/status_new.txt /tmp/status.txt &
  fi
}

player () {
  echo "$PLAYER"
  if [ "$PLAYER" == "spotifyd" ]; then
    foot -e spt &
  elif [ "$PLAYER" == "mpd" ]; then
    foot -e ncmpc &
  elif [ "$PLAYER" == "ncspot" ]; then
    foot -e tmux attach-session -t 'ncSpotify'  &
  else
    playerctl -a pause &
  fi 
}

FUNC_CALL="$1"
"$FUNC_CALL"
