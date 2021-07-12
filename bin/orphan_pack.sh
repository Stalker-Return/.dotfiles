#!/bin/bash

# External source
source /home/ed/scripts/external_func.sh
#
sudo pacman -Rns --noconfirm $(pacman -Qtdq)
exitcode=$?
exitcontrol
# ( echo "y" ) | sudo pacman -Rns $(pacman -Qtdq)
#
# log-file record
echo "Orphan packages has cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/orphan_pac.log
#
# Send notification
notify-send --urgency=critical --expire-time=3000 "Orphan packages has cleaned"

exit
