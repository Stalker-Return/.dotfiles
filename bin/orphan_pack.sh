#!/bin/bash

sudo pacman -Rns --noconfirm $(pacman -Qtdq)
# ( echo "y" ) | sudo pacman -Rns $(pacman -Qtdq)
echo "Orphan packages cleaned: $(date)" >> $HOME/.local/share/log-files/orphan_pac.log
