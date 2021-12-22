#/bash/bin
# Upload tint2 config
configfile=$HOME/scripts/tint2/tint2_bar.conf
[[ ! -f $configfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$configfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $configfile;
#
# SWAP size
function swapsize () {
	usedsize=$(swapon -s | awk '$1 == "/dev/sda3"' | awk '{print $4}')
	fullsize=$(swapon -s | awk '$1 == "/dev/sda3"' | awk '{print $3}')
	[[ "$usedsize" -eq 0 ]] && swapvar=0 || let "swapvar = $usedsize / $fullsize"
}
#
# Change the partition
function chdisk () {
		case $diskspace in
			1)	sed -i 's+diskspace=1+diskspace=2+g' $configfile ;;
			2)	sed -i 's+diskspace=2+diskspace=3+g' $configfile ;;
			3)	sed -i 's+diskspace=3+diskspace=4+g' $configfile ;;
			4)	sed -i 's+diskspace=4+diskspace=1+g' $configfile ;;
		esac
}
#
# Print info
function printdisk () {
		case $diskspace in
			1)	echo -e "\U0001F5B4""$(df | awk '$1 == "/dev/sda1"' | awk '{print " boot:", $5}')" ;;
			2)	echo -e "\U0001F5B4""$(df | awk '$1 == "/dev/sda2"' | awk '{print " root:", $5}')" ;;
			3)	swapsize; echo -e "\U0001F5B4"" swap:" "$swapvar%" ;;
			4)	echo -e "\U0001F5B4""$(df | awk '$1 == "/dev/sda4"' | awk '{print " home:", $5}')" ;;
		esac
}
#
chdisk
printdisk
