#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

### Exports
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/bin
# export EDITOR=nano
# export VISUAL=nano

### ARCHIVE EXTRACTION
# usage: ext <file>
ext ()
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

### ALIASES ###
alias grep='grep --color=auto'
alias ls='exa -al --color=always --group-directories-first' # my preferred listing

# crwl() {
#  wget --tries=inf --timestamping --recursive --level=inf --convert-links --page-requisites --no-parent -R '\?C=' "$@"
#}

# bare git repository
# alias gitstor='/usr/bin/git --git-dir=$HOME/.dotstore/ --work-tree=$HOME'
# alias gittls='/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/'

# mount cloud drives
# alias mountod='rclone --vfs-cache-mode writes mount "onedrive": ~/onedrive &'	# One Drive
# alias mountgd='rclone --vfs-cache-mode writes mount "gdrive": ~/gdrive &'		# Google Drive

# Changing "ls" to "exa"
# alias la='exa -a --color=always --group-directories-first'  # all files and dirs
# alias ll='exa -l --color=always --group-directories-first'  # long format
# alias lt='exa -aT --color=always --group-directories-first' # tree listing
# alias l.='exa -a | egrep "^\."'

# pacman and yay
#alias pacsyu='sudo pacman -Syyu'			# update only standard pkgs
#alias yaysua='yay -Sua --noconfirm'			# update only AUR pkgs
#alias yaysyu='yay -Syu --noconfirm'			# update standard pkgs and AUR pkgs
#alias unlock='sudo rm /var/lib/pacman/db.lck'		# remove pacman lock
#alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'	# remove orphaned packages

#picom --config /home/ed/.config/picom.conf &

# ibus-daemon -drx --panel /usr/lib/ibus/ibus-ui-gtk3
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus

# Autostart X at login
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
# exec startx
#fi
