#!/bin/bash

# Find DE / WM
initfile=$HOME/.xinitrc
[[ ! -f $initfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$initfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || { [[ -z "$XDG_CURRENT_DESKTOP" ]] && dewm=$(wmctrl -m | grep 'Name:' |  awk '{print $2}') || dewm=$XDG_CURRENT_DESKTOP; };

echo "i3 / openbox / lxde"
read newdewm

	case $newdewm in
		"lxde")		case $dewm in "LXDE") sed -i 's/exec startlxde/exec startlxde/g' $initfile ;; "Openbox") sed -i 's/exec openbox-session/exec startlxde/g' $initfile ;; "i3") sed -i 's/exec i3/exec startlxde/g' $initfile ;; *) echo "FUCK" ;; esac ;;
		"openbox")	case $dewm in "LXDE") sed -i 's/exec startlxde/exec openbox-session/g' $initfile ;; "Openbox") sed -i 's/exec openbox-session/exec openbox-session/g' $initfile ;; "i3") sed -i 's/exec i3/exec openbox-session/g' $initfile ;; *) echo "FUCK" ;; esac ;;
		"i3")		case $dewm in "LXDE") sed -i 's/exec startlxde/exec i3/g' $initfile ;; "Openbox") sed -i 's/exec openbox-session/exec i3/g' $initfile ;; "i3") sed -i 's/exec i3/exec i3/g' $initfile ;; *) echo "FUCK" ;; esac ;;
		*)			newexec="FUCK" ;;
	esac
