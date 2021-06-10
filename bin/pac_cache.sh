#!/bin/bash

# sudo pacman -Scc --noconfirm
( echo "y"; echo "y" ) | sudo pacman -Scc
echo "Package cache cleaned: $(date)" >> $HOME/.local/share/log-files/pac_cache.log
