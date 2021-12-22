#!/bin/bash
# xterm -bg blue4 -fg snow -T Wi-Fi -geometry 43x20+1103+479 -e 'tput civis; echo -e "\033[5mAvailable Wi-Fi\033[0m"; tput setaf 10; sudo iw dev wlp3s0 scan | grep SSID; echo -e "\n"; tput setaf 15; read -rsn1 -p "Press any key to exit... "'

tput civis
echo -e "\033[5mAvailable Wi-Fi\033[0m"
tput setaf 10
sudo iw dev wlp3s0 scan | grep SSID
echo -e "\n"
tput setaf 15
#read -rsn1 -p "Press any key to exit... "
read -n 1 -r -p "'w' to run nmtui or 'x | ESC' for exit: " optionA
  case $optionA in
    w|W ) runreflector ;;
    $'\e' ) clear; tput cvvis; exit;;		# Exit on ESC - button
    x|X ) clear; tput cvvis; exit;;
    * ) invalid ;;
  esac
