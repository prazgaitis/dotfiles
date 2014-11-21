alias sleepybear="osascript -e 'tell application \"System Events\" to sleep'"

alias e='open -a MacVim'
alias gitx='open -a GitX .'
alias ff='open -a Firefox'

alias pingo='ping -o 74.125.225.36 | grep time'
alias flushdns='sudo killall -HUP mDNSResponder'

sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent' # flush downloads list

z_path=`brew --prefix`/etc/profile.d/z.sh
if [ -e "$z_path" ]; then
  source "$z_path"
fi

nvm_path=$(brew --prefix nvm)/nvm.sh
if [ -e "$nvm_path" ]; then
  export NVM_DIR=~/.nvm
  source "$nvm_path"
fi
