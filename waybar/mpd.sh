#!/bin/bash

PLAYER=$(playerctl -l | head -n 1)
status () {
  cat /tmp/status.txt
  if [ "$( pgrep -c playerctl )" == "1" ]; then
    if [ -n "$( playerctl metadata --format '{{title}}')" ]; then
      playerctl metadata --format '{"text":"{{artist}} - {{title}}", "tooltip":"{{playerName}}:{{lc(status)}}"}' -p "$PLAYER"  > /tmp/status_new.txt
    else
      FILENAME=$( playerctl metadata --format '"{{xesam:url}}"' | xargs basename )
      playerctl metadata --format "{\"text\":\"$FILENAME\", \"tooltip\":\"{{playerName}}:{{lc(status)}}\"}" -p "$PLAYER"  > /tmp/status_new.txt
    fi
    mv /tmp/status_new.txt /tmp/status.txt 2>&1 > /dev/null || true
  fi
}

player () {
  echo "$PLAYER"
  if [[ "$PLAYER" == "spotifyd"* ]]; then
    foot -T Spotify-TUI -e spt &
  elif [ "$PLAYER" == "mpd" ]; then
    foot -T MPD -e ncmpc &
  elif [ "$PLAYER" == "Spot" ]; then
    spot &
  elif [[ "$PLAYER" == "ncspot"* ]]; then
    foot -T ncSpot -e tmux attach-session -t 'ncSpotify'  &
  else
    playerctl -a pause &
  fi 
}

FUNC_CALL="$1"
"$FUNC_CALL"
