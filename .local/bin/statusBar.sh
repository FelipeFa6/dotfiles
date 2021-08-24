#!/bin/bash

# Battery
#btState=$(cat /sys/class/power_supply/BAT0/status)
#btPercent=$(cat /sys/class/power_supply/BAT0/capacity)

# Date
date=$(date +"%A %B %d %Y ");
hour=$(date +"%I:%M %p");

# BTC->USD Value
btc="BTC: $"$(curl rate.sx/1BTC | awk '{printf ("%'\''d\n", $0)}')

# Memory
memory="Memory: "$(free --mebi | sed -n '2{p;q}' | awk '{printf ("%2.2fGb / %2.2fGb\n", ( $3 / 1024), ($2 / 1024))}')

# CPU
cpu="CPU: "$(sensors | awk '/Core 0/ {print $3}')

output="| $btc | $cpu | $memory | $date | $hour"

xsetroot -name "$output"
echo $output
