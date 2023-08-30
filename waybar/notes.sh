#!/bin/bash

getnote () {
  tail -n1 ~/notes | cut -d '&' -f 2
}

setnote () {
  previous=$(getnote)
  content=$(zenity --entry --text 'Algo Pendiente?' --entry-text "$previous")
  if [ -n "$content" ]; then
    echo "$(date +%s) &$content" >> ~/notes
  fi
}
nyaaa () {
  echo "$(date +%s) &nyaaa~" >> ~/notes
}
FUNC_CALL="$1"
"$FUNC_CALL"
echo "Notitas!"
