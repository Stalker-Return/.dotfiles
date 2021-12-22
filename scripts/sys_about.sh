#!/bin/bash
# External source
source /home/ed/scripts/external_func.sh
# Check if root (look at external_func.sh)
checkroot
# Liitle help
function usage()
{
    echo "usage: <command> options:<f|h> arguments<>"
    echo "-h for help"
    echo "-f arguments<>"
    echo "	inxifull:	Ful system information"
	echo "	inxibasic:	Basic system information"
}
#1 Ful system information
inxifull () {
xterm -bg black -fg blue -T Sysytem_Info -geometry 90x58+200+1 -e 'tput civis; echo -e "\e[1;15mOption 1: Ful system information\e[0m"; echo -e "\n"; inxi -c 7 -F; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#2 Basic system information
inxibasic () {
xterm -bg black -fg blue -T Basic_Info -geometry 85x37+200+100 -e 'tput civis; echo -e "\e[1;15mOption 2: Basic system information\e[0m"; echo -e "\n"; inxi -c 7 --basic; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#3 Processes
inxiproc () {
xterm -bg black -fg blue -T Processes -geometry 85x42+200+100 -e 'tput civis; echo -e "\e[1;15mOption 3: Processes\e[0m"; echo -e "\n"; inxi -c 7 -t cm10 -pu; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#4 Graphics info
inxigraph () {
xterm -bg black -fg blue -T Graphics -geometry 85x15+200+300 -e 'tput civis; echo -e "\e[1;15mOption 4: Graphics information\e[0m"; echo -e "\n"; inxi -c 7 --graphics; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#6 Full disk information
inxidisk () {
xterm -bg black -fg blue -T Disks_Info -geometry 85x12+200+300 -e 'tput civis; echo -e "\e[1;15mOption 6: Full disk information\e[0m"; echo -e "\n"; inxi -c 7 --disk-full; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#7 partition + uuids
inxiuuid () {
xterm -bg black -fg blue -T Partition -geometry 85x16+200+300 -e 'tput civis; echo -e "\e[1;15mOption 7: Partition + UUIDs\e[0m"; echo -e "\n"; inxi -c 7 -u -pu; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#8 Machine data
inximach () {
xterm -bg black -fg blue -T Machine_Data -geometry 85x12+200+300 -e 'tput civis; echo -e "\e[1;15mOption 8: Machine data\e[0m"; echo -e "\n"; inxi -c 7 --machine; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#9 Advanced Network device info
inxinet () {
xterm -bg black -fg blue -T Network -geometry 85x13+200+300 -e 'tput civis; echo -e "\e[1;15mOption 9: Network device information\e[0m"; echo -e "\n"; inxi -c 7 --network-advanced; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#5 WAN IP address and local interfaces
inxiip () {
xterm -bg black -fg blue -T Network -geometry 85x15+200+300 -e 'tput civis; echo -e "\e[1;15mOption 5: WAN IP address and local interfaces\e[0m"; echo -e "\n"; inxi -c 7 --ip; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#10 Sysytem sensors
inxisens () {
xterm -bg black -fg blue -T Sensors -geometry 85x10+200+300 -e 'tput civis; echo -e "\e[1;15mOption 10: Sysytem sensors\e[0m"; echo -e "\n"; inxi -c 7 --sensors; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#C CPU information
inxicpu () {
xterm -bg black -fg blue -T CPU -geometry 85x12+200+300 -e 'tput civis; echo -e "\e[1;15mOption <C>: CPU Info\e[0m"; echo -e "\n"; inxi -c 7 --cpu; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#R Memory (RAM) data
inxiram () {
xterm -bg black -fg blue -T RAM -geometry 85x12+200+300 -e 'tput civis; echo -e "\e[1;15mOption <R>: RAM data\e[0m"; echo -e "\n"; inxi -c 7 --memory; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#B Battery
inxibatt () {
xterm -bg black -fg blue -T Battery -geometry 85x10+200+300 -e 'tput civis; echo -e "\e[1;15mBattery information\e[0m"; echo -e "\n"; inxi -c 7 --battery; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#F Full partition information
inxifullpart () {
xterm -bg black -fg blue -T Partitions -geometry 85x14+200+300 -e 'tput civis; echo -e "\e[1;15mOption <F>: Full partition information\e[0m"; echo -e "\n"; inxi -c 7 --partitions-full; echo -e "\n"; read -rsn1 -p "Press any key to exit... "; echo'
}
#
makeyourchoice () { while true
do
  clear
  echo ""
  echo "  A simple script to deliver System Information, based on <inxi> options"
  echo ""
  echo "     cfdisk                ip a            alias       -'      "
  echo "         grep                                         'man/     "
  echo " xorg           awk                   systemd        '+arch:     "
  echo "                                                    '+>_sudo:     "
  echo "  (1) Ful system information                       '-openbox+:    "
  echo "  (2) Basic system information                    '/:-:pacman+:    "
  echo "  (3) Processes                                  '/+git/++clone:    "
  echo "  (4) Graphics info                             '/lxde+kde+xfce+:    "
  echo "  (5) WAN IP address                           '/+++ls~/.config+/'    "
  echo "  (6) Full disk information                   ./exit$#cd++whoami+o+'    "
  echo "  (7) Partition + UUIDs                      .neofetch-''''/pcmanfm+'    "
  echo "  (8) Machine data                          -inxi#ssh.      :.bashrc+.    "
  echo "  (9) Network                              :makepkg$/        mkfs.ext2.    "
  echo "  (0) Sensors                             /mount/mnt/        +cat|mkdir    "
  echo "                                        '/fuck_ms+/:-        -:/+nano#o+-    "
  echo "  (c) CPU                              '+vim+:-'                 '.-/\feh:    "
  echo "  (r) RAM                             'i3:.                           '-/+/     "
  echo "  (f) Full Partition                 '.'                                  ' \    "
  echo "  (b) Battery inforbation"

  echo "  (x) Exit"  
  echo -e "\n"
  read -n 1 -r -p "  Enter your choice (1-9), 'C', 'R', 'F', 'B' or 'X / ESC' to exit: " optionA
  case $optionA in
    1 ) inxifull ;;
    2 ) inxibasic ;;
    3 ) inxiproc ;;
    4 ) inxigraph ;;
    5 ) inxiip ;;
    6 ) inxidisk ;;
    7 ) inxiuuid ;;    
    8 ) inximach ;;
    9 ) inxinet ;;
    0 ) inxisens ;;
    c|C ) inxicpu;;
    r|R ) inxiram;;
    b|B ) inxibatt;;
    f|F ) inxifullpart;;
    $'\e' ) exit;;		# Exit on ESC - button
    x|X ) exit;;
    * ) invalid ;;
  esac
done
}
# read the argument
while getopts :f:h: opt; do
  case $opt in
    f)	case $OPTARG in
			"full") 	inxifull ;;
			"basic") 	inxibasic ;;
			"proc") 	inxiproc ;;
			"cpu") 		inxicpu ;;
			"ram")		inxiram ;;
			"disk")		inxidisk ;;
			"mach")		inximach ;;
			"uuid")		inxiuuid ;;
			"net")		inxinet ;;
			"graph")	inxigraph ;;
			"ip")		inxiip ;;
			"sens")		inxisens ;;
			"batt")		inxibatt ;;
			"fullpart")	inxifullpart ;;
			"menu") 	makeyourchoice ;;
			*) echo "$OPTARG is invalid argument";;
		esac
		;;
    h)	usage; exit 1 ;;
    *)	echo "Invalid option: -$OPTARG" >&2
		usage; exit 1 ;;
  esac
#
done
