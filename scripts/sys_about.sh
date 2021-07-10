#!/bin/bash
#
hellobro () {
  clear
  echo "---------------------------------------------------"
  echo "|     EZArcher Maintenance Script                 |"
  echo "|                                                 |"
  echo "|     Version 2  (Release)                        |"
  echo "|                                                 |"
  echo "|     Brought to you by eznix                     |"
  echo "|     https://sourceforge.net/projects/ezarch/    |"
  echo "|                                                 |"
  echo -e "--------------------------------------------------- \n"
  sleep 2
}
#1 Ful system information
inxifull () {
clear
echo -e "\e[1;32mFul system information\e[0m"
inxi -c 31 -F
echo -e "\n"
read -p "Press Enter to continue..."
}
#2 Basic system information
inxibasic () {
clear
echo -e "\e[1;32mBasic system information\e[0m"
inxi -c 31 --basic
echo -e "\n"
read -p "Press Enter to continue..."
}
#3 CPU information
inxicpu () {
clear
echo -e "\e[1;32mCPU Info\e[0m"
inxi -c 24 --cpu
echo -e "\n"
read -p "Press Enter to continue..."
}
#4 full partition information
inxipart () {
clear
echo -e "\e[1;32mFull partition information\e[0m"
inxi -c 24 --partitions-full
echo -e "\n"
read -p "Press Enter to continue..."
}
#
#4 Memory (RAM) data
inxiram () {
clear
echo -e "\e[1;32mRAM data\e[0m"
inxi -c 24 --partitions-full
echo -e "\n"
read -p "Press Enter to continue..."
}
#
makeyourchoice () { while true
do
  clear
  echo ""
  echo "  (1) Ful system information"
  echo "  (2) Basic system information"
  echo "  (3) CPU information"
  echo "  (4) Full partition information"
  echo "  (5) RAM data"
  echo ""
  echo "  (X) Exit"
  echo -e "\n"
  read -p "Enter your choice: " optionA
  case $optionA in
    1 ) inxifull ;;
    2 ) inxibasic ;;
    3 ) inxicpu ;;
    4 ) inxipart ;;
    5 ) inxiram ;;
    x|X ) exit;;
    * ) invalid ;;
  esac
done
}
# Check root user
checkroot () {
  if [[ "$EUID" = 0 ]]; then
    continue
  else
    echo "Permission denied ..."
    echo "Please Run As Root"
    sleep 2
    exit
  fi
}
#
checkroot
# read the argument
while getopts :f: opt; do
  case $opt in
    f)	case $OPTARG in
         "full") 	echo "Full System Info" >&2 ;;
         "basic") 	echo "Basic System Info" >&2 ;;
         "cpu") 	echo "CPU Info" >&2 ;;
         "part") 	echo "Full partition information" >&2 ;;
         "ram") 	echo "RAM data" >&2 ;;
		 "menu") 	echo "Menu" >&2 ;;
		 *) 		echo "invalid option $REPLY";;
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
      case $OPTARG in
        "full") 	inxifull ;;
        "basic") 	inxibasic ;;
        "cpu") 		inxicpu ;;
        "part")		inxipart ;;
        "ram")		inxiram ;;
		"menu") 	hellobro
					makeyourchoice
					;;
		*) echo "invalid option $REPLY";;
	  esac

done
