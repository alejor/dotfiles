#!/bin/zsh
cat /proc/cpuinfo | grep MHz | cut -d ':' -f 2 | dc -e "0d[?+2z>a]salax8/p" && echo 'CPU Frequency'
