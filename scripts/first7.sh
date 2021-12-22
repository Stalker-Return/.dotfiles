#!/bin/bash
notify-send --urgency=normal --expire-time=10000 "The biggest 7 CPU hogs: $(ps axch -o cmd,%cpu --sort=-%cpu | head -7)" && read -t 11
notify-send --urgency=normal --expire-time=10000 "The biggest 7 MEM hogs: $(ps axch -o cmd,%mem --sort=-%mem | head -7)"
