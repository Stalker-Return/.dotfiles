#!/bin/bash
#
# ezarcher maintenance
# Inspired by EF Tech Made Simple ( https://youtu.be/wwSkFi3h2nI )
# Revision: 2021.01.30 -- by eznix (https://sourceforge.net/projects/ezarch/)
# (GNU/General Public License version 3.0)
#
#
#
# ---------------------------------------
# Define Functions:
# ---------------------------------------
#
#
handlerror () {
  clear
  set -uo pipefail
  trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
}
#
#
welcomer () {
  clear
  echo "==================================================="
  echo "=                                                 ="
  echo "=     EZArcher Maintenance Script                 ="
  echo "=                                                 ="
  echo "=                                                 ="
  echo "=     Version 2  (Release)                        ="
  echo "=                                                 ="
  echo "=     Brought to you by eznix                     ="
  echo "=     https://sourceforge.net/projects/ezarch/    ="
  echo "=                                                 ="
  echo -e "=================================================== \n"
  sleep 4
}
#
failedsrvs () {
  clear
  systemctl --failed > /tmp/failedsrvs
  nano /tmp/failedsrvs
  clear
  echo -e "\n"
  rm /tmp/failedsrvs
  clear
}
#
journalchk () {
  clear
  journalctl -p 3 -xb > /tmp/journalchk
  nano /tmp/journalchk
  clear
  echo -e "\n"
  rm /tmp/journalchk
  clear
}
#
journalcln () {
  clear
  journalctl --vacuum-time=2weeks
  clear
  echo -e "\n"
  echo "Journal directory cleaned"
  sleep 2
  clear
}
#
sysupdate () {
  clear
  pacman -Syu
  clear
  echo -e "\n"
  echo "Full system upgrade finished"
  sleep 2
  clear
}
#
pkgsccache () {
  clear
  pacman -Scc
  clear
  echo -e "\n"
  echo "Package cache cleaned"
  sleep 2
  clear
}
#
orphanchk () {
  clear
  pacman -Qtdq > /tmp/orphanchk
  nano /tmp/orphanchk
  clear
  echo -e "\n"
  rm /tmp/orphanchk
  clear
}
#
orphancln () {
  clear
  pacman -Rns $(pacman -Qtdq)
  clear
  echo -e "\n"
  echo "Orphan packages cleaned"
  sleep 2
  clear
}
#
usercachecln () {
  clear
  echo "[Unit]
Description=Clean primary user cache on boot.

[Service]
Type=simple
ExecStart=/bin/bash /usr/local/bin/clnusercache.sh

[Install]
WantedBy=multi-user.target" > /usr/lib/systemd/system/clnusercache.service
  echo "#!/bin/bash 
rm -r /home/*/.cache/*
rm /etc/systemd/system/multi-user.target.wants/clnusercache.service" > /usr/local/bin/clnusercache.sh
  chmod +x /usr/local/bin/clnusercache.sh
  ln -sf /usr/lib/systemd/system/clnusercache.service /etc/systemd/system/multi-user.target.wants/clnusercache.service
  clear
  echo -e "\n"
  echo "User's cache directory cleaned on next boot"
  sleep 3
  clear
}
#
runreflector () {
  clear
  reflector --country 'Slovakia' --age 6 --protocol https --save /etc/pacman.d/mirrorlist
  clear
  echo -e "\n"
  echo "Mirrorlist regenerated"
  sleep 2
  clear
}
#
mainmenu () { while true
do
  clear
  echo "-------------------------------------"
  echo " EZArcher Maintenance Script"
  echo "-------------------------------------"
  echo ""
  echo "  1) Failed systemd services"
  echo "  2) Check journal logs"
  echo "  3) Cleanup journal space"
  echo "  4) Run system update"
  echo "  5) Clean package cache"
  echo "  6) Check for orphan packages"
  echo "  7) Remove orphan packages"
  echo "  8) Clean user cache on next boot"
  echo "  9) Regenerate mirrorlist"

  echo ""
  echo "  X) Exit"
  echo -e "\n"
  read -p "Enter your choice: " optionA
  case $optionA in
    1 ) failedsrvs ;;
    2 ) journalchk ;;
    3 ) journalcln ;;
    4 ) sysupdate ;;
    5 ) pkgsccache ;;
    6 ) orphanchk ;;
    7 ) orphancln ;;
    8 ) usercachecln ;;
    9 ) runreflector ;;
    x|X ) exit;;
    * ) invalid ;;
  esac
done
}
#
#
ROOTUSER () {
  if [[ "$EUID" = 0 ]]; then
    continue
  else
    echo "Please Run As Root"
    sleep 2
    exit
  fi
}
#
#
ROOTUSER
handlerror
welcomer
mainmenu
#
#
done
#
#
# Disclaimer:
#
# THIS SOFTWARE IS PROVIDED BY EZNIX “AS IS” AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL EZNIX BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# END
#
