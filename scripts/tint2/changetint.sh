#!/bin/bash
### tint2 config file
tint2conf=/home/ed/.config/tint2/tint2rc
### Set blue tint2 panel
function setblue() {
sed -i 's/background_color = #010101 96/background_color = #000043 96/g' ${1}	# Background 1: Panel
sed -i 's/border_color = #010101 96/border_color = #000043 96/g' ${1}			# Background 1: Panel
sed -i 's/background_color = #0c0c9c 97/background_color = #010101 97/g' ${1}	# Background 3: Active task
sed -i 's/start_color = #000020 94/start_color = #07060b 94/g' ${1}				# Gradient 2
sed -i 's/end_color = #4282b4 94/end_color = #77767b 94/g' ${1}				
}
### Set black tint2 panel
function setblack() {
sed -i 's/background_color = #000043 96/background_color = #010101 96/g' ${1}	# Background 1: Panel
sed -i 's/border_color = #000043 96/border_color = #010101 96/g' ${1}			# Background 1: Panel
sed -i 's/background_color = #010101 97/background_color = #0c0c9c 97/g' ${1}	# Background 3: Active task
sed -i 's/start_color = #07060b 94/start_color = #000020 94/g' ${1}				# Gradient 2
sed -i 's/end_color = #77767b 94/end_color = #4282b4 94/g' ${1}					# Gradient 2
}
### set tint2
	case $1 in
		"black" )	setblack $tint2conf; killall tint2; tint2 $tint2conf; exit 0 ;;
		"blue" )	setblue $tint2conf; killall tint2; tint2 $tint2conf; exit 0 ;;
		*)			echo -e "Invalid option $OPTARG. Exit in 5 sec."; read -t 5; exit 5 ;;
	esac
