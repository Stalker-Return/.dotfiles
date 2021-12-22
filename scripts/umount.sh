#! /bin/bash
# a dmenu prompt to umount usb drives
# Dependancies: dmenu, pgrep, notify-send
#
exlusionregex="\(/boot\|/home\|/\)$"
drives=$(lsblk -lp | grep "t /" | grep -v "$exlusionregex" | awk '{print $1, "(" $4 ")", "on", $7}')
[[ -z $drives ]] && exit 1
#
chosen=$(echo "$drives" | dmenu -i -p "Choose the Drive to umount" | awk '{print $1}')
[[ -z $chosen ]] && exit 1
#
sudo umount $chosen && pgrep -x dunst && notify-send -u low "$chosen has unmounted" -i /home/ed/.local/share/icons/status/trophy-silver.svg
