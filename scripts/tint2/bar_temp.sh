#/bash/bin

# Dependencies: os_sensors, notify-send, ttf-fork-awesome

temptint2 () {
	BARTEMP=$(sensors acpitz-acpi-0 | grep "temp1:" | awk '{print $2}')
	TEMPVALUE=$(awk '{print $1/1000}' /sys/class/thermal/thermal_zone0/temp)
	
		if [ "$TEMPVALUE" -le 50 ]; then TEMPICON=""
			elif [ "$TEMPVALUE" -gt 50 ] && [ "$TEMPVALUE" -le 60 ]; then TEMPICON=""
			elif [ "$TEMPVALUE" -gt 60 ] && [ "$TEMPVALUE" -le 70 ]; then TEMPICON=""
			elif [ "$TEMPVALUE" -gt 80 ];
				then
					if [ "$TEMPVALUE" -gt 87 ];
						then TEMPICON="🔥" && notify-send -u critical -t 3000 \
						"The temperature is '$(sensors acpitz-acpi-0 | grep "temp1:" | awk '{print $2}')'" \
						"It's time to calm down" \
						-i /home/ed/.local/share/icons/status/sensors-temperature-symbolic.svg
						else TEMPICON="\U0001F6A9"
					fi
	        else TEMPICON="🌡️"
		fi
		echo -e "$TEMPICON$BARTEMP"
}

temptint2
