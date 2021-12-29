# ~/.bashrc
#
# ver 2.04 Jul.08, 2021
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#
# BASH PROMPT
#PS1='[\u@\h \W]\$ '
#PS1='[\D{%a, %b-%d} \w]\n\$ '
PS1='\w \> '
printf '\e[4 q'												# blinking underline cursor for Xterm
#
### Exports
# [ -d "$HOME/scripts" ] && PATH="$HOME/scripts:$PATH"
# [ -d "$HOME/scripts/tint2" ] && PATH="$HOME/scripts/tint2:$PATH"
# [ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
export TERM="xterm-256color"								# getting proper colors
export HISTCONTROL=ignoredups:erasedups						# no duplicate entries
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/scripts/tint2
export PATH=$PATH:$HOME/bin
xrdb ~/.Xresources
# export EDITOR=nano
# export VISUAL=nano
#
### ARCHIVE EXTRACTION
# usage: ext <file>
function ext ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
#
# Create a ZIP archive of a file or folder.
function mkzip() { zip -r "${1%%/}.zip" "$1" ; }
#
### FIND function
# find files in $1 with pattern $2 in name
function ff() { find "$1" -type f -name '*'"$2"'*'; }
# find files in $1 with pattern $2 in name and copy them to $HOME/Downloads
function ffcopy() {
	for filename in $(find "$1" -type f -name '*'"$2"'*'); do
		cp $filename $HOME/Downloads
	done
}
#
### ALIASES ###
alias grep='grep --color=auto'
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias lsl='exa -al --color=always --group-directories-first --sort oldest /home/ed/.local/share/log-files'
alias cat='highlight --out-format=ansi'
alias sup='sudo pacman'
alias mv='mv -i'
alias cdd='cd ~/Downloads/'
alias cp='cp -i'
alias ln='ln -i'
alias ..='cd ..'
alias yay='yay --noconfirm'
alias pacman='pacman --noconfirm'
#
### Colors
Red="\e[1;31m"
Green="\e[0;32m"
Yellow="\e[0;33m"
Blue="\e[1;34m"
Pink="\e[1;35m"
Cyan="\e[1;36m"
White="\e[0;37m"
Black="\e[0;30m"
BlinkOn="\033[5m"
BlinkOff="\e[0m"
RedBG="\e[1;41m"
GreenBG="\e[0;42m"
YellowBG="\e[0;43m"
BlueBG="\e[1;44m"
PinkBG="\e[1;45m"
CyanBG="\e[1;46m"
WhiteBG="\e[0;47m"
BlackBG="\e[0;40m"
#
# Autostart X at login
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#	exec startx
#fi
