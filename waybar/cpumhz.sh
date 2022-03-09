#!/bin/zsh
cat /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_cur_freq| dc -e "0d[?+2z>a]salax12000/p" && echo 'CPU Frequency'
