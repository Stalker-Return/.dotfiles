#/bash/bin

# echo -e "" " $(top -bn1 | grep Cpu | awk '{print $2}')%"
# echo -e "$(top -bn1 | grep Cpu | awk '{print " "$2}')%"

# Dependencies: os_sensors, notify-send, ttf-fork-awesome

cputint2 () {
#	INTCPU=$(top -bn1 | grep Cpu | awk '{print $2}' | sed 's/[^0-9]//g')
	BARCPU=$(top -bn1 | grep Cpu | awk '{print $2}')
	INTCPU=$(echo "$BARCPU" | sed 's/[^0-9]//g')
	
		if [ "$INTCPU" -eq 0 ]; then CPUICON=" "
			elif [ "$INTCPU" -gt 0 ] && [ "$INTCPU" -le 130 ]; then CPUICON="▁"
			elif [ "$INTCPU" -gt 130 ] && [ "$INTCPU" -le 260 ]; then CPUICON="▂"
			elif [ "$INTCPU" -gt 260 ] && [ "$INTCPU" -le 390 ]; then CPUICON="▃"
			elif [ "$INTCPU" -gt 390 ] && [ "$INTCPU" -le 520 ]; then CPUICON="▄"
			elif [ "$INTCPU" -gt 520 ] && [ "$INTCPU" -le 650 ]; then CPUICON="▅"
			elif [ "$INTCPU" -gt 650 ] && [ "$INTCPU" -le 780 ]; then CPUICON="▆"
			elif [ "$INTCPU" -gt 780 ] && [ "$INTCPU" -le 910 ]; then CPUICON="▇"
	        else CPUICON="█"
		fi
		echo -e "\e[0;31m$CPUICON\e[0m $BARCPU%"
}

cputint2
