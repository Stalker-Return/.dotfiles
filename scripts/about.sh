#!/bin/bash

sudo clear

echo -e "--------------------------------------------------------------------------------"
echo -e "\e[92mSYSTEM\e[39m"
MANUFACT=$(sudo dmidecode -t system |  grep Manufacturer: |  awk '{print $2}')
echo -e "Manufacturer:\t\t" $MANUFACT
UNAMEO=$(uname -o)
echo -e "Operating-system:\t" $UNAMEO
UNAMEV=$(uname -v)
echo -e "Kernel-version:\t\t" $UNAMEV
PROCTYPE=$(sudo dmidecode -t processor |  grep Family: |  awk '{print $3}')
echo -e "Processor:\t\t" $PROCTYPE
PRODNAME=$(sudo dmidecode -t system |  grep 'Product Name:' |  awk '{print $3}')
echo -e "Product name:\t\t" $PRODNAME
SERIALNUM=$(sudo dmidecode -t system |  grep 'Serial Number:' |  awk '{print $3}')
echo -e "Serial number:\t\t" $SERIALNUM
echo -e "--------------------------------------------------------------------------------"
BASH_VER=$(bash --version | grep 'GNU bash' | awk '{print $4}')
#BASH_VER=$(bash --version | grep 'GNU bash' | sed 's/.*version \([0-9]*\)\..*/\1/')
echo -e "Bash version:\t\t" $BASH_VER
TOTAL_MEM=$(free -h | awk '/^Mem:/{print $2}')
echo -e "RAM:\t\t\t" $TOTAL_MEM
FREE_MEM=`cat /proc/meminfo | grep MemFree | awk '{print $2}'`
echo -e "Free memory:\t\t" $FREE_MEM
SCREEN=`xdpyinfo | awk '/dimensions/{print $2}'`
echo -e "Screen Resolution:\t" $SCREEN
echo -e "--------------------------------------------------------------------------------"
UNAMEN=$(uname -n)
echo -e "Hostname:\t\t" $UNAMEN
UNAMEM=$(uname -m)
echo -e "Architecture:\t\t" $UNAMEM
echo -e "--------------------------------------------------------------------------------"
echo -e "\e[92mBIOS\e[39m"
BIOSVENDOR=$(sudo dmidecode -t bios |  grep Vendor |  awk '{print $2}')
echo -e "Vendor:\t\t\t" $BIOSVENDOR
BIOSVER=$(sudo dmidecode -t bios |  grep Version |  awk '{print $2}')
echo -e "Version:\t\t" $BIOSVER
BIOSDATE=$(sudo dmidecode -t bios |  grep "Release Date" |  awk '{print $3}')
echo -e "Release Date:\t\t" $BIOSDATE
echo -e "--------------------------------------------------------------------------------"
MY_IP_ADD=$(curl -s http://myip.enix.org/REMOTE_ADDR)
echo -e "IP address:\t\t" $MY_IP_ADD
echo -e "Press ENTER to EXIT-------------------------------------------------------------" && read
