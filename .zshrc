#
# R B E N V
#

eval "$(rbenv init - zsh)"


#
# E N V I R O N M E N T
#

# ENVIRONMENT: PATHS

## ENVIRONMENT: PATHS: GENERAL
export SCRIPTS_PATH="$HOME/.scripts"


#
# M I S C E L L A N E O U S
#

# MISCELLANEOUS: COMMON
alias c="clear"
machinename() {
  sudo scutil --set HostName $1
  sudo scutil --set LocalHostName $1
  sudo scutil --set ComputerName $1
}
alias lsa="ls -la"
cdlsa() {
  cd $1
  lsa
}
alias cl="cdlsa"
alias rmdd="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias update="brew update && brew upgrade && gem update"

# MISCELLANEOUS: COMMON: POWER
alias s="pmset sleepnow"

# MISCELLANEOUS: COMMON: NETWORKING
alias flushdns="sudo killall -HUP mDNSResponder"
alias ip-local="ipconfig getifaddr en0"
alias ip-public="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/\"//g'"
ip-of-domain() {
  echo $(dscacheutil -q host -a name $1 | awk -F': ' 'NR==2 { print $2 } ')
}

# MISCELLANEOUS: COMMON: SSH
alias ssh-new="eval `ssh-agent -s`"
ssh-ed25519() {
  ssh-keygen -o -a 100 -t ed25519 -f $1 -C $2
}
ssh-rsa4096() {
  ssh-keygen -b 4096 -o -a 100 -t rsa -f $1 -C $2
}
ssh-public() {
  ssh-keygen -y -f $1 > "$1.pub"
}
ssh-add-github() {
  ssh-keyscan github.com >> ~/.ssh/known_hosts
}

# MISCELLANEOUS: COMMON: PERMISSIONS
op() {
  stat -f '%A %N' $1
}
perms() {
  for file in $(find . -type f -maxdepth 1); do stat -f '%A %N' $file; done
}
permissions-ssh() {
  sudo $SCRIPTS_PATH/common/permissions-ssh-mac.sh
}
permissions-scripts() {
  $SCRIPTS_PATH/common/permissions-scripts.sh
}

# MISCELLANEOUS: COMMON: GIT
gs() {
  git pull --recurse-submodules && git submodule update --recursive
}

# MISCELLANEOUS: COMMON: DOCKER
docker-stop-containers() {
  docker stop $(docker ps -a -q)
}
alias ds="docker-stop-containers"
docker-clean() {
  docker system prune -a -f
}
alias dc="docker-clean"
docker-nginx-logs-colorful() {
  docker logs --follow $1 | awk '
    /" 2/ {print "\033[32m" $0 "\033[39m"; next;}
    /" 3/ {print "\033[37m" $0 "\033[39m"; next;}
    /" 4/ {print "\033[33m" $0 "\033[39m"; next;}
    /" 5/ {print "\033[31m" $0 "\033[39m"}
  '
}
alias dnl="docker-nginx-logs-colorful"

# MISCELLANEOUS: COMMON: ICLOUD
alias cd-icloud="cd ~/Library/Mobile\ Documents"
alias cd-icloud-containers="cd ~/Library/Application\ Support/CloudDocs/session/containers"
alias icloud-reset="killall bird"

# MISCELLANEOUS: COMMON: ENCRYPTION
alias e-d="$SCRIPTS_PATH/common/encrypt-decrypt.sh"


#
# B O O T S T R A P
#

c


#
# I N B O X
#
