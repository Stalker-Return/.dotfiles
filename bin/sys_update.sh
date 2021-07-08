#!/bin/bash

source ~/bin/exit_control.sh
yay -Syu --noconfirm
exitcode=$?
exitcontrol
echo "Full system update: $(date), exit code = $exitcode: $codedescription" >> $HOME/.local/share/log-files/sys_update.log

exit

