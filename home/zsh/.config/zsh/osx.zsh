export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_ANALYTICS=1
export BROWSER=open
unset DISPLAY

sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent' # flush downloads list

alias shred='srm'