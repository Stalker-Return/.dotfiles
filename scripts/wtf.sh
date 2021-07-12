#!/bin/bash
# Ver 1.03 Lul.08, 2021
#
# External source
source /home/ed/scripts/external_func.sh
# Check if root (look at external_func.sh)
checkroot
#
# Check error
checherror () {
  clear
  set -uo pipefail
  trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
}
#
#1 full system update
sysupdate () {
  clear
  yay -Syu --noconfirm
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "Full system update: $(date)"
  echo "Exit Code = :$exitcode:, Result = $codedescription"
  echo -e "\n"
  read -rsn1 -p "Press any key to continue... "; echo
}
#2 clean package cache
pkgsccache () {
  clear
  ( echo "y"; echo "y"; echo "y" ) | yay -Scc
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "Package cache cleaned: $(date)"
  echo "Exit Code = :$exitcode:, Result = $codedescription"
  echo -e "\n"
  read -rsn1 -p "Press any key to continue... "; echo
}
#3 clean HOME directory cache
clnhomecache () {
  clear
  rm -rf ~/.cache/*
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "HOME directory cache cleaned: $(date)"
  echo "Exit Code = :$exitcode:, Result = $codedescription"
  echo -e "\n"
  read -rsn1 -p "Press any key to continue... "; echo
}
#4 cvlean orphan packages
orphancln () {
  clear
  ( echo "y" ) | sudo pacman -Rns $(pacman -Qtdq)
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "Orphan packages cleaned: $(date)"
  echo "Exit Code = :$exitcode:, Result = $codedescription"
  echo -e "\n"
  read -rsn1 -p "Press any key to continue... "; echo
}
#5 clean journal directory 
journalcln () {
  clear
  journalctl --vacuum-time=2weeks
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "Journal directory cleaned: $(date)"
  echo "Exit Code = :$exitcode:, Result = $codedescription"
  echo -e "\n"
  read -rsn1 -p "Press any key to continue... "; echo
}
#6 check journal logs
journalchk () {
  clear
  journalctl -p 3 -xb > /tmp/journalchk
  nano /tmp/journalchk
  clear
  echo -e "\n"
  rm /tmp/journalchk
}
#7 chech failed systemd services
failedsrvs () {
  clear
  systemctl --failed > /tmp/failedsrvs
  nano /tmp/failedsrvs
  clear
  echo -e "\n"
  rm /tmp/failedsrvs
}
#8 mirrorlist regeneration
runreflector () {
  clear
  reflector --country 'Russia' --age 6 --protocol https --save /etc/pacman.d/mirrorlist
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "Mirrorlist regenerated: $(date)"
  echo "Exit Code = :$exitcode:, Result = $codedescription"
  echo -e "\n"
  read -rsn1 -p "Press any key to continue... "; echo
}
#
wtfuw () { while true
do
  clear
  echo ""
  echo ""
  echo "  A simple script to deliver System Information, based on <inxi> options"
  echo ""
  echo "     cfdisk                ip a            alias       -'      "
  echo "         grep                    pwd           echo   'man/     "
  echo " xorg           awk                   systemd        '+arch:     "
  echo "           paru               yay                   '+>_sudo:     "
  echo "       fuck             you             bro        '-openbox+:    "
  echo "  ln         systemctl           set              '/:-:pacman+:    "
  echo "                                      touch      '/+git/++clone:    "
  echo "                                                '/lxde+kde+xfce+:    "
  echo "  (1) Run the full system update               '/+++ls~/.config+/'    "
  echo "  (2) Clean package cache                     ./exit$#cd++whoami+o+'    "
  echo "  (3) Clean cache in /home directory         .neofetch-''''/pcmanfm+'    "
  echo "  (4) Remove orphan packages                -inxi#ssh.      :.bashrc+.    "
  echo "  (5) Cleanup journal space                :makepkg$/        mkfs.ext2.    "
  echo "  (6) Check journal logs                  /mount/mnt/        +cat|mkdir    "
  echo "  (7) Failed systemd services            '/fuck_ms+/:-        -:/+nano#o+-    "
  echo "  (8) Regenerate mirrorlist             '+vim+:-'                 '.-/\feh:    "
  echo "                                      'i3:.                           '-/+/     "
  echo "  (x) Exit                           '.'                                  ' \    "
  echo -e "\n"
  read -n 1 -r -p "  Enter your choice (1-8) or 'X' for exit: " optionA
  case $optionA in
    1 ) sysupdate ;;
    2 ) pkgsccache ;;
    3 ) clnhomecache ;;
    4 ) orphancln ;;
    5 ) journalcln ;;
    6 ) journalchk ;;
    7 ) failedsrvs ;;
    8 ) runreflector ;;
    x|X ) exit;;
    * ) invalid ;;
  esac
done
}
#
checherror
wtfuw
#
done
