#!/bin/bash
#
# Check if root
if [ "$EUID" -ne 0 ]
  then	echo "Permission denied ..."
		echo "Please run as root"
		sleep 2
  exit
fi
#1 Ful system information
inxifull () {
clear
echo -e "\e[1;15mOption 1: Ful system information\e[0m"
echo -e "\n"
inxi -c 24 -F
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#2 Basic system information
inxibasic () {
clear
echo -e "\e[1;15mOption 2: Basic system information\e[0m"
echo -e "\n"
inxi -c 24 --basic
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#3 Processes
inxiproc () {
clear
echo -e "\e[1;15mOption 3: Processes\e[0m"
echo -e "\n"
inxi -c 24 -t cm10 -pu
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#C CPU information
inxicpu () {
clear
echo -e "\e[1;15mOption <C>: CPU Info\e[0m"
echo -e "\n"
inxi -c 24 --cpu
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#R Memory (RAM) data
inxiram () {
clear
echo -e "\e[1;15mOption <R>: RAM data\e[0m"
echo -e "\n"
inxi -c 24 --memory
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#6 full disk information
inxidisk () {
clear
echo -e "\e[1;15mOption 6: Full disk information\e[0m"
echo -e "\n"
inxi -c 24 --disk-full
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#7 partition + uuids
inxiuuid () {
clear
echo -e "\e[1;15mOption 7: Partition + UUIDs\e[0m"
echo -e "\n"
inxi -c 24 -u -pu
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#8 machine data
inximach () {
clear
echo -e "\e[1;15mOption 8: Machine data\e[0m"
echo -e "\n"
inxi -c 24 --machine
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#9 Advanced Network device info
inxinet () {
clear
echo -e "\e[1;15mOption 9: Network device information\e[0m"
echo -e "\n"
inxi -c 24 --network-advanced
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#4 Graphics info
inxigraph () {
clear
echo -e "\e[1;15mOption 4: Graphics infon\e[0m"
echo -e "\n"
inxi -c 24 --graphics
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#5 WAN IP address and local interfaces
inxiip () {
clear
echo -e "\e[1;15mOption 5: WAN IP address and local interfacesn\e[0m"
echo -e "\n"
inxi -c 24 --ip
echo -e "\n"
read -rsn1 -p "Press any key to continue... "; echo
}
#
makeyourchoice () { while true
do
  clear
  echo ""
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
  echo "                                          /mount/mnt/        +cat|mkdir    "
  echo "  (c) CPU                               '/fuck_ms+/:-        -:/+nano#o+-    "
  echo "  (r) RAM                              '+vim+:-'                 '.-/\feh:    "
  echo "                                      'i3:.                           '-/+/     "
  echo "  (x) Exit                           '.'                                  ' \    "
  echo -e "\n"
  read -n 1 -r -p "  Enter your choice (1-9), 'C', 'R' or 'X' for exit: " optionA
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
    c|C ) inxicpu;;
    r|R ) inxiram;;
    x|X ) exit;;
    * ) invalid ;;
  esac
done
}
# read the argument
while getopts :f: opt; do
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
			"menu") 	makeyourchoice ;;
			*) echo "invalid option $REPLY";;
		esac
		;;
    \?) echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
    :)	echo "Option -$OPTARG requires an argument." >&2
		exit 1
		;;
  esac
#
done
