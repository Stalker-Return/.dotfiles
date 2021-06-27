#!/bin/bash

sudo reflector -f 10 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
exitcode=$?
#sudo reflector -c Slovakia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
echo "The mirrorlist updated: $(date), , exit code: $exitcode" >> $HOME/.local/share/log-files/mirrorlist.log
