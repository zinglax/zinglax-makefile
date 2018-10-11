#!/bin/bash
# Wal background and theme switcher
while true
do
 # Set Wal
 wal -i $WALLPAPER_IMAGES > /dev/null 2>&1
 sleep $WALLPAPER_INTERVAL
done
