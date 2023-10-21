#!/usr/bin/env bash


if pkill -f 'hkhue redshift -g 1'; then
    redshift -x
    notify-send -t 3500 "Redshift Disabled"
else
    hkhue redshift -g 1 > /dev/null 2>&1 &
    notify-send -t 3500 "Redshift Enabled"
fi
