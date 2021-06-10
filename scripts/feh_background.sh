#!/bin/bash

while true; do
  for f in /home/ed/.local/share/wallpapers/slideshow/*; do
    feh -z --bg-scale --no-fehbg "$f"
    sleep 180
  done
done
