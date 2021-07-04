#!/bin/bash

source ~/bin/exit_control.sh
sudo pacman -Rns --noconfirm $(pacman -Qtdq)
exitcode=$?
exitcontrol
# ( echo "y" ) | sudo pacman -Rns $(pacman -Qtdq)
echo "Orphan packages cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/orphan_pac.log
