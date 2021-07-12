#!/bin/bash

# External source
source /home/ed/scripts/external_func.sh
#
yay -Syu --noconfirm
exitcode=$?
exitcontrol

# log-file record
echo "Full System Update has completed: $(date), exit code = $exitcode: $codedescription" >> $HOME/.local/share/log-files/sys_update.log

# Send notification
notify-send --urgency=critical --expire-time=3000 "Full System Update has completed"

exit
