#! /bin/bash
# a dmenu prompt to mount usb drivers
# Dependancies: dmenu, pgrep, notify-send
#
pgrep -x dnenu && exit
mountable=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')
[[ -z $mountable ]] && exit 1
#
chosen=$(echo "$mountable" | dmenu -i -p "Choose the Drive" |awk '{print $1}')
[[ -z $chosen ]] && exit 1
#
dirs=$(find /run/media/ed -maxdepth 1 -type d 2>/dev/null)
mountpoint=$(echo "$dirs" | dmenu -i -p "Mount to:" |awk '{print $1}')
[[ -z $mountpoint ]] && exit 1
#
sudo mount $chosen $mountpoint && pgrep -x dunst && notify-send -u low "$chosen has mounted" "to $mountpoint" -i /home/ed/.local/share/icons/status/trophy-silver.svg
