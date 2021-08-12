#!/bin/bash

# Battery
#btState=$(cat /sys/class/power_supply/BAT0/status)
#btPercent=$(cat /sys/class/power_supply/BAT0/capacity)

# Date
date=$(date +"%A %B %d %Y ");
hour=$(date +"%I:%M %p");

# BTC->USD Value
btc=$(curl rate.sx/1BTC | awk '{printf ("%'\''d\n", $0)}')

output="| BTC \$$btc | $date | $hour"

xsetroot -name "$output"
