#!/bin/bash

sudo reflector -c Slovakia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
echo "The mirrorlist updated: $(date)" >> $HOME/.local/share/log-files/mirrorlist.log
