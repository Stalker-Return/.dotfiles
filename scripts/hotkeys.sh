#!/bin/bash
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ -e $checkfile ]] && source $checkfile || echo -ne "$checkfile doesn't exist";
[[ ! -e $checkfile ]] && exist 3 || clear;
# Set Colors from 'colorsmane-function'
colorsname
#
function table_key() {
	echo -e ""
	echo -e " |---------------------------------------|---------------------------------------|"
	echo -e " |          ${Yellow}SUPER KEY SECTION${White}            |         ${Yellow}CTRL+ALT KEY SECTION${White}          |"
	echo -e " |---------------|-----------------------|---------------|-----------------------|"
	echo -e " | Super+1" "\t" "| go to desktop 1" "\t"		"| Ctrl+Alt+f" "\t" "| mozilla Firefox" "\t" "|"
	echo -e " | Super+2" "\t" "| go to desktop 2" "\t"		"| Ctrl+Alt+h" "\t" "| tHunderbird" "\t" "\t" "|"
	echo -e " | Super+d" "\t" "| show Desktop" "\t"			"| Ctrl+Alt+g" "\t" "| Google chrom" "\t" "|"
	echo -e " | Super+o" "\t" "| shOw root menu" "\t"			"| Ctrl+Alt+e" "\t" "| bravE" "\t" "\t" "|"
	echo -e " | Super+t" "\t" "| lxTerminal" "\t" "\t"		"| Ctrl+Alt+b" "\t" "| douBlecmd" "\t" "\t" "|"
	echo -e " | Super+w" "\t" "| Weather monitor" "\t"			"| Ctrl+Alt+t" "\t" "| Task manager" "\t" "|"
	echo -e " | Super+x" "\t" "| Xterm" "\t" "\t"				"| Ctrl+Alt+d" "\t" "| pcmanfm Desktop" "\t" "|"
	echo -e " | Super+p" "\t" "| Pcmanfm" "\t" "\t"			"| Ctrl+Alt+k" "\t" "| sKype" "\t" "\t" "|"
	echo -e " | Super+i" "\t" "| Iconify the windows" "\t"	"| Ctrl+Alt+l" "\t" "| teLegramm" "\t" "\t" "|"
	echo -e " | Super+m" "\t" "| Maximize the windows "		"| Ctrl+Alt+v" "\t" "| Viber" "\t" "\t" "|"
	echo -e " | Super+g" "\t" "| Geany" "\t" "\t"				"| Ctrl+Alt+n" "\t" "| whatsapp-for-liNux" "\t" "|"
	echo -e " | Super+r" "\t" "| Rofi" "\t" "\t"				"| Ctrl+Alt+i" "\t" "| mount google drIve" "\t" "|"
	echo -e " | Super+c" "\t" "| Conky on" "\t" "\t"			"| Ctrl+Alt+o" "\t" "| mount Onedrive" "\t" "|"
	echo -e " | Super+k" "\t" "| Kill conky" "\t" "\t"		"| Ctrl+Alt+r" "\t" "| gmRun" "\t" "\t" "|"
	echo -e " | Super+s" "\t" "| System Info" "\t" "\t"		"| Ctrl+Alt+p" "\t" "| coPy frame" "\t" "\t" "|"
	echo -e " | Super+f" "\t" "| wtF script" "\t" "\t"		"| Ctrl+Alt+w" "\t" "| copy Window" "\t" "\t" "|"
	echo -e " | Super+n" "\t" "| recoNfigure openbox""\t"		"| Ctrl+Alt+s" "\t" "| copy Screen" "\t" "\t" "|"
	echo -e " | Super+a" "\t" "| fAvorites-menu" "\t"	"| Ctrl+Alt+m   " "| Mount usb drivers" "\t" "|"
	echo -e " | Super+q" "\t" "| Quit the session" "\t"		"| Ctrl+Alt+u   " "| Unmount usb drivers" "\t" "|"
	echo -e " | Super+e" "\t" "| sEtting menu" "\t"		"| Ctrl+Alt+2   " "| tint2 left" "\t" "\t" "|"
	echo -e " | Super+u" "\t" "| tools menU" "\t" "\t"		"| Ctrl+Alt+3   " "| tint3 top" "\t" "\t" "|"
	echo -e " |---------------------------------------|---------------------------------------|"
}

table_key
