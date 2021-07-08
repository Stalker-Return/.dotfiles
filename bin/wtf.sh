#!/bin/bash
#
# Ver 1.03 Lul.08, 2021
#
function exitcontrol()
{
	case $exitcode in
		"0" )
		codedescription="'Success'"
		;;
		"1" )
		codedescription="'Catchall for general errors'"
		;;
		"2" )
		codedescription="'Misuse of shell builtins'"
		;;
		"126" )
		codedescription="'Command invoked cannot execute'"
		;;
		"127" )
		codedescription="'Command not found'"
		;;
		"128" )
		codedescription="'Invalid argument to exit command'"
		;;
		"130" )
		codedescription="'Bash script terminated by Control-C'"
		;;
		* )
		codedescription="'Unknown exit code'"
		;;
	esac

}
#
checherror () {
  clear
  set -uo pipefail
  trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
}
#
#
welcomer () {
  clear
  echo "==================================================="
  echo "=                                                 ="
  echo "=     <What-The-Fuck> Script                      ="
  echo "=                                                 ="
  echo "=     A simle helper for maintenance              ="
  echo "=     Arch based system                           ="
  echo "=                                                 ="
  echo -e "=================================================== \n"
  sleep 2
}
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
  sleep 3
  clear
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
  sleep 3
  clear
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
  sleep 3
  clear
}
#4 cvlean orphan packages
orphancln () {
  clear
  pacman -Rns $(pacman -Qtdq)
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "Orphan packages cleaned: $(date)"
  echo "Exit Code = :$exitcode:, Result = $codedescription"
  sleep 3
  clear
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
  sleep 3
}
#6 check journal logs
journalchk () {
  clear
  journalctl -p 3 -xb > /tmp/journalchk
  nano /tmp/journalchk
  clear
  echo -e "\n"
  rm /tmp/journalchk
  clear
}
#7 chech failed systemd services
failedsrvs () {
  clear
  systemctl --failed > /tmp/failedsrvs
  nano /tmp/failedsrvs
  clear
  echo -e "\n"
  rm /tmp/failedsrvs
  clear
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
  sleep 3
  clear
}
#
wtfuw () { while true
do
  clear
  echo "-------------------------------------"
  echo "  <What the fuck> Script"
  echo "-------------------------------------"
  echo ""
  echo "  1) Run system update (oficial repository + AUR)"
  echo "  2) Clean package cache"
  echo "  3) Clean cache in /home directory"
  echo "  4) Remove orphan packages"
  echo "  5) Cleanup journal space"
  echo "  6) Check journal logs"  
  echo "  7) Failed systemd services"
  echo "  8) Regenerate mirrorlist"
  echo ""
  echo "  X) Exit"
  echo -e "\n"
  read -p "Enter your choice: " optionA
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
ROOTUSER () {
  if [[ "$EUID" = 0 ]]; then
    continue
  else
    echo "Please Run As Root"
    sleep 2
    exit
  fi
}
#
ROOTUSER
checherror
welcomer
wtfuw
#
done
