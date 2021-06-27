#!/bin/bash

# sudo pacman -Scc --noconfirm
( echo "y"; echo "y" ) | sudo pacman -Scc
exitcode=$?
echo "Package cache cleaned: $(date), exit code: $exitcode" >> $HOME/.local/share/log-files/pac_cache.log
