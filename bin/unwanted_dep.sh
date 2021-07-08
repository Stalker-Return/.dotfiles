#!/bin/bash

source ~/bin/exit_control.sh
yay -Yc --noconfirm
exitcode=$?
exitcontrol
echo "Unwanted dependancies cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/unwanted_dep.log
