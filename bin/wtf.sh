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
source exit_control.sh
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
  echo "=     <What the fuck> Script                      ="
  echo "=                                                 ="
  echo "=     A simle helper for maintenance              ="
  echo "=     Arch based system                           ="
  echo "=                                                 ="
  echo -e "=================================================== \n"
  sleep 1
}
#1
sysupdate () {
  clear
  yay -Syu --noconfirm
  exitcode=$?
  exitcontrol
  clear
  echo -e "\n"
  echo "Full system update: $(date)"
  echo "Exit Code = :$exitcode: Result = $codedescription"
  sleep 2
  clear
}
#2
pkgsccache () {
  clear
  pacman -Scc
  clear
  echo -e "\n"
  echo "Package cache cleaned"
  sleep 1
  clear
}
#3
clnhomecache () {
  clear
  rm -rf ~/.cache/*
  clear
  echo -e "\n"
  echo "HOME directory cache cleaned"
  sleep 1
}
#4
orphancln () {
  clear
  pacman -Rns $(pacman -Qtdq)
  clear
  echo -e "\n"
  echo "Orphan packages cleaned"
  sleep 1
  clear
}
#5
journalcln () {
  clear
  journalctl --vacuum-time=2weeks
  clear
  echo -e "\n"
  echo "Journal directory cleaned"
  sleep 1
  clear
}
#6
journalchk () {
  clear
  journalctl -p 3 -xb > /tmp/journalchk
  nano /tmp/journalchk
  clear
  echo -e "\n"
  rm /tmp/journalchk
  clear
}
#7
failedsrvs () {
  clear
  systemctl --failed > /tmp/failedsrvs
  nano /tmp/failedsrvs
  clear
  echo -e "\n"
  rm /tmp/failedsrvs
  clear
}
#8
runreflector () {
  clear
  reflector --country 'Russia' --age 6 --protocol https --save /etc/pacman.d/mirrorlist
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
  echo "  <What the fuck> Script"
  echo "-------------------------------------"
  echo ""
  echo "  1) Run system update (oficial repository + AUR)"
  echo "  2) Clean package cache"
  echo "  3) Clean cache in /home directory"
  echo "  4) Remove orphan packages"
  echo "  5) Cleanup journal space"
  echo "  6) Check journal logs"  
  echo "  7) Failed systemd services"
  echo "  8) Regenerate mirrorlist"
  echo ""
  echo "  X) Exit"
  echo -e "\n"
  read -p "Enter your choice: " optionA
  case $optionA in
    1 ) sysupdate ;;
    2 ) pkgsccache ;;
    3 ) clnhomecache ;;
    4 ) orphancln ;;
    5 ) journalcln ;;
    6 ) journalchk ;;
    7 ) failedsrvs ;;
    8 ) runreflector ;;
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
