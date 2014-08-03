alias open="gnome-open"

alias ls="ls --color"

alias e="gvim"

alias pingo="ping -c 1 74.125.225.36 | grep -v transmitted | grep time"

alias mate="gvim"

alias reboot="sudo reboot"

brew () {
  if [ $1 == "info" ]; then
    apt show $2
  elif [ $1 == "install" ]; then
    sudo apt-get $@ -y
  else
    sudo apt-get $@
  fi
}