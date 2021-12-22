#/bash/bin

#echo -e "\U0001F5B4""$(df | awk '$1 == "/dev/sda1"' | awk '{print $6,$5}')"

df -h | grep "Filesystem"
df -h | grep "/dev/sda2"
df -h | grep "/dev/sda4"
df -h | grep "/dev/sda1"
