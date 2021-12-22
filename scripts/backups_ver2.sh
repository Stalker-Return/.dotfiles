#!/bin/bash
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Upload parameters
checkfile=/home/ed/scripts/backups.conf
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || backup_list=$checkfile;
#
function savefiles() {
	rsync -ar --delete /home/ed/Clouds "/run/media/ed/DATA"
	while read filename
		do
			rsync -ar --delete $filename "/run/media/ed/DATA/Storage/Linux"
		done < $backup_list
}
echo -ne "\033[5mBackup in progress... \e[0m"
savefiles
