#
# ~/.bashrc
#
# ver 2.04 Jul.08, 2021
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

### Exports
[ -d "$HOME/scripts" ] && PATH="$HOME/scripts:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# export PATH=$PATH:$HOME/scripts
# export PATH=$PATH:$HOME/bin
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

# eval "$(starship init bash)"

### ALIASES ###
alias grep='grep --color=auto'
alias ls='exa -al --color=always --group-directories-first' # my preferred listing

# mount cloud drives
# alias mountod='rclone --vfs-cache-mode writes mount "onedrive": ~/onedrive &'	# One Drive
# alias mountgd='rclone --vfs-cache-mode writes mount "gdrive": ~/gdrive &'		# Google Drive

# Autostart X at login
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
# exec startx
#fi
