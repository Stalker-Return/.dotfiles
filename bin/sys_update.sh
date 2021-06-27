#!/bin/bash

# notify-send --urgency=normal --expire-time=2000 "The system upgrade has begun"
yay -Syu --noconfirm
exitcode=$?
echo "Full system update: $(date), exit code: $exitcode" >> $HOME/.local/share/log-files/sys_update.log
# notify-send --urgency=low --expire-time=2000 "The system upgrade has completed"
