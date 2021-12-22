#/bash/bin

cd ~/
sudo ip link set wlp3s0 up
sudo wpa_passphrase TP-Link_BE1C 90469992 > wpa_TP-Link_BE1C.conf
sudo wpa_supplicant -B -i wlp3s0 -c wpa_TP-Link_BE1C.conf
sudo dhclient wlp3s0
