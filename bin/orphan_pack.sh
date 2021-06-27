#!/bin/bash

sudo pacman -Rns --noconfirm $(pacman -Qtdq)
exitcode=$?
# ( echo "y" ) | sudo pacman -Rns $(pacman -Qtdq)
echo "Orphan packages cleaned: $(date), exit code: $exitcode" >> $HOME/.local/share/log-files/orphan_pac.log
