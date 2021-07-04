#!/bin/bash

source ~/bin/exit_control.sh
rm -rf ~/.cache/*
exitcode=$?
exitcontrol
echo "Cache in the home directory cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/del_cache.log
