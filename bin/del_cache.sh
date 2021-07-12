#!/bin/bash

# External source
source /home/ed/scripts/external_func.sh
#
rm -rf ~/.cache/*
exitcode=$?
exitcontrol
#
# log-file record
echo "Cache in the home directory has cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/del_cache.log
#
# Send notification
notify-send --urgency=critical --expire-time=3000 "Cache in the home directory has cleaned"

exit
