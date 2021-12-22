#!/bin/bash
fuckdial=(dialog --keep-tite --menu "Select options:" 15 55 16)

options=(1 "Shutdown"
         2 "Reboot"
         3 "Suspend"
         4 "Exit")

choices=$("${fuckdial[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            shutdown now
            ;;
        2)
            reboot
            ;;
        3)
            xterm -e top
            ;;
        4)
            openbox --exit
            ;;
    esac
done
