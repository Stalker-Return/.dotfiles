#!/bin/bash

# External source
source /home/ed/scripts/external_func.sh
#
sudo journalctl --vacuum-time=2weeks
exitcode=$?
exitcontrol
#
# log-file record
echo "Journal directory gas cleaned: $(date), exit code: $exitcode, $codedescription" >> $HOME/.local/share/log-files/clean_journal.log
#
# Send notification
notify-send --urgency=critical --expire-time=3000 "Journal directory gas cleaned"

exit
