#/bash/bin

# Dependencies: ttf-fork-awesome

battery_info () {
	CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT1/status)
	MANUFACTURER=$(cat /sys/class/power_supply/BAT1/manufacturer)
	MODEL=$(cat /sys/class/power_supply/BAT1/model_name)
	SERIAL=$(cat /sys/class/power_supply/BAT1/serial_number)
	TECHNOLOGY=$(cat /sys/class/power_supply/BAT1/technology)
	BATTNAME="BAT1"
	clear
	echo -e ""
	echo -e "\033[5m Battery Information\033[0m"
	echo -e ""
	tput setaf 10
	echo -e " Name:		$BATTNAME"
	echo -e " Status:	$STATUS"
	echo -e " Capacity:	$CAPACITY%"
	echo -e " Manufacturer:	$MANUFACTURER"
	echo -e " Model Name:	$MODEL"
	echo -e " Serial Number:	$SERIAL"
	echo -e " Technology:	$TECHNOLOGY"
	tput setaf 15
	echo -e "\n"
	read -rsn1 -p " Press any key to exit... "; echo
}

titn_battery () {
	CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT1/status)
	
		case $STATUS in
			"Charging") 	BATICON="⚡️" ;;
			"Unknown")		BATICON="⚡️" ;;
			"Full")			BATICON="⚡️" ;;			
			"Discharging")	if [ "$CHARGE" -eq 0 ]; then BATICON=""
							  elif [ "$CHARGE" -gt 0 ] && [ "$CHARGE" -le 30 ];	then BATICON=""
							  elif [ "$CHARGE" -gt 30 ] && [ "$CHARGE" -le 60 ]; then BATICON=""
							  elif [ "$CHARGE" -gt 60 ] && [ "$CHARGE" -le 90 ]; then BATICON=""
																				 else BATICON=""
							fi ;;
			*)				BATICON="N/A" ;;
		esac
		
		echo -e "$BATICON $CHARGE%"
}

# read the argument
while getopts :f: opt; do

  case ${opt} in
    f)	case $OPTARG in
			"info") 	battery_info ;;
			"tintexe") 	titn_battery ;;
			*) echo "Invalid option: $OPTARG" && exit 1;;
		esac
		;;
    \?) echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
    :)	echo "Option -$OPTARG requires an argument." >&2
		exit 1
		;;
  esac

done
