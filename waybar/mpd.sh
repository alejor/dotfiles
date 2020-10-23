#!/bin/zsh
echo 'currentsong\nstatus' | ncat localhost 6600 | grep : | sed  's/: /=/' | jc --env -r | jq '. | if .state != "play" then "mpd", .state else .Artist, ":", .Title, "\n" ,.file, .audio, .bitrate, "kbps"  end' | xargs echo -e

