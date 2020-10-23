#!/bin/zsh
lscpu | grep 'CPU MHz:' | cut -f 2 -d ':' | tr -d ' ' | cut -f 1 -d '.' && echo 'CPU Frequency'
