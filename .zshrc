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
alias update="brew update && brew upgrade && gem update"
alias rmdd="rm -rf ~/Library/Developer/Xcode/DerivedData"

# MISCELLANEOUS: COMMON: NETWORKING
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
ssh-public() {
  ssh-keygen -y -f $1 > "$1.pub"
}

# MISCELLANEOUS: COMMON: PERMISSIONS
op() {
  stat -f '%A %N' $1
}
perms() {
  for file in $(find . -type f -maxdepth 1); do stat -f '%A %N' $file; done
}
permissions-ssh() {
  $SCRIPTS_PATH/common/permissions-ssh-mac.sh
}
permissions-scripts() {
  $SCRIPTS_PATH/common/permissions-scripts-mac.sh
}

# MISCELLANEOUS: COMMON: ICLOUD
alias cd-icloud="cd ~/Library/Mobile\ Documents"
alias cd-icloud-containers="cd ~/Library/Application\ Support/CloudDocs/session/containers"
alias icloud-reset="killall bird"


#
# B O O T S T R A P
#

c


#
# I N B O X
#
