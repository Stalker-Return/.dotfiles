#!/bin/bash

source ~/bin/exit_control.sh
( echo "y"; echo "y"; echo "y" ) | yay -Scc
exitcode=$?
exitcontrol
echo "Package cache cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/pac_cache.log
