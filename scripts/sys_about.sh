#!/bin/bash
#
# Losd sources
if [[ -f /home/ed/scripts/standardfunc.sh ]]
	then 	source /home/ed/scripts/standardfunc.sh;
	else 	echo -e "\e[1;31mFile standardfunc.sh doesn't exist. Press any key to exit...\e[0m" && read
			exit;
fi
# Check if root
checkroot
#1 Ful system information
inxifull () {
clear
echo -e "\e[1;15mFul system information\e[0m"
echo -e "\n"
inxi -c 24 -F
echo -e "\n"
read -p "Press Enter to continue..."
}
#2 Basic system information
inxibasic () {
clear
echo -e "\e[1;15mBasic system information\e[0m"
echo -e "\n"
inxi -c 24 --basic
echo -e "\n"
read -p "Press Enter to continue..."
}
#3 Processes
inxiproc () {
clear
echo -e "\e[1;15mProcesses\e[0m"
echo -e "\n"
inxi -c 24 -t cm10 -pu
echo -e "\n"
read -p "Press Enter to continue..."
}
#4 CPU information
inxicpu () {
clear
echo -e "\e[1;15mCPU Info\e[0m"
echo -e "\n"
inxi -c 24 --cpu
echo -e "\n"
read -p "Press Enter to continue..."
}
#5 Memory (RAM) data
inxiram () {
clear
echo -e "\e[1;15mRAM data\e[0m"
echo -e "\n"
inxi -c 24 --memory
echo -e "\n"
read -p "Press Enter to continue..."
}
#6 full disk information
inxidisk () {
clear
echo -e "\e[1;15mFull disk information\e[0m"
echo -e "\n"
inxi -c 24 --disk-full
echo -e "\n"
read -p "Press Enter to continue..."
}
#7 partition + uuids
inxiuuid () {
clear
echo -e "\e[1;15mPartition + UUIDsn\e[0m"
echo -e "\n"
inxi -c 24 -u -pu
echo -e "\n"
read -p "Press Enter to continue..."
}
#8 machine data
inximach () {
clear
echo -e "\e[1;15mMachine data\e[0m"
echo -e "\n"
inxi -c 24 --machine
echo -e "\n"
read -p "Press Enter to continue..."
}
#9 Advanced Network device info
inxinet () {
clear
echo -e "\e[1;15mNetwork device infon\e[0m"
echo -e "\n"
inxi -c 24 --network-advanced
echo -e "\n"
read -p "Press Enter to continue..."
}
#10 Graphics info
inxigraph () {
clear
echo -e "\e[1;15mGraphics infon\e[0m"
echo -e "\n"
inxi -c 24 --graphics
echo -e "\n"
read -p "Press Enter to continue..."
}
#11 WAN IP address and local interfaces
inxiip () {
clear
echo -e "\e[1;15mWAN IP address and local interfacesn\e[0m"
echo -e "\n"
inxi -c 24 --ip
echo -e "\n"
read -p "Press Enter to continue..."
}
#
makeyourchoice () { while true
do
  clear
  echo ""
  echo ""
  echo "   A simple script to deliver System Information, based on <inxi> options"
  echo ""
  echo "  (1) Ful system information"
  echo "  (2) Basic system information"
  echo "  (3) Processes"
  echo "  (4) CPU"
  echo "  (5) RAM"
  echo "  (6) Full disk information" 
  echo "  (7) Partition + UUIDs"
  echo "  (8) Machine data"
  echo "  (9) Network"
  echo ""
  echo "  (X) Exit"
  echo -e "\n"
  read -p "  Enter your choice: " optionA
  case $optionA in
    1 ) inxifull ;;
    2 ) inxibasic ;;
    3 ) inxiproc ;;
    4 ) inxicpu ;;
    5 ) inxiram ;;
    6 ) inxidisk ;;
    7 ) inxiuuid ;;    
    8 ) inximach ;;
    9 ) inxinet ;;
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
			"ip")	inxiip ;;
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
