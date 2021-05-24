#!/bin/bash

# Date
date=$(date +"%A %B %d %Y ");
hour=$(date +"%I:%M:%S %p");

# BTC->USD Value
btc=$(curl rate.sx/1BTC | awk '{printf ("%'\''d\n", $0)}')

output="| BTC \$$btc | $date | $hour"

xsetroot -name "$output"
