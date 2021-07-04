#!/bin/bash

source ~/bin/exit_control.sh
sudo journalctl --vacuum-time=2weeks
exitcode=$?
exitcontrol
echo "Journal directory cleaned: $(date), exit code: $exitcode, $codedescription" >> $HOME/.local/share/log-files/clean_journal.log
