# Get platform
# ============

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	platform='Linux'
	if [ -f /etc/debian_version ] ; then
		platform='Ubuntu'
	fi
elif [[ "$unamestr" == 'Darwin' ]]; then
	platform='OSX'
fi

# Common stuff
# ============

# Make a ~/Coding directory
mkdir $HOME/Coding 2> log.txt

# Vim aliases (vimrc and vim directory)
ln -s $PWD/resources/vimrc $HOME/.vimrc 2> log.txt
ln -s $PWD/resources/vim $HOME/.vim 2> log.txt

# Git settings
git config --global user.name "Evan Hahn"
git config --global user.email "me@evanhahn.com"
# TODO: http://help.github.com/ignore-files/

# Get GitHub set up 
# TODO: http://help.github.com/linux-set-up-git/

# TODO: Inconsolata

# TODO: install gem, npm

# Ubuntu
# ======

if [[ $platform == 'Ubuntu' ]]; then

	# Common stuff that's different on Ubuntu
	# --------------------------------------- 

	# TODO: gem?

	# NPM
	sudo apt-get install python-software-properties
	sudo apt-add-repository ppa:chris-lea/node.js
	sudo apt-get update
	sudo apt-get install nodejs npm

	# TODO: PIP

	# Install stuff
	# -------------

	# Install updates
	sudo apt-get update
	sudo apt-get upgrade

	# Install restricted extras and stuff
	sudo apt-get install ubuntu-restricted-extras
	sudo apt-get install non-free-codecs libxine1-ffmpeg gxine mencoder totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 mpg123libjpeg-progs

	# VLC + Chromium
	sudo apt-get install vlc chromium-browser

	# Faenza icon theme
	sudo add-apt-repository ppa:tiheum/equinox
	sudo apt-get update
	sudo apt-get install faenza-icon-theme
	# TODO: Actually use this theme

	# TODO: dropbox
	# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

# OS X
# ====

elif [[ $platform == 'OSX' ]]; then

	# Common stuff that's different on Mac
	# ------------------------------------

	# Package manager: MacPorts
	curl https://distfiles.macports.org/MacPorts/MacPorts-2.1.1.tar.bz2 > MacPorts-2.1.1.tar.bz2
	tar xzvf MacPorts.tar.bz2
	cd MacPorts-2.1.1
	chmod +x configure
	./configure
	make
	sudo make install
	cd ../
	rm -rf MacPorts-2.1.1*

	# NPM
	sudo port install nodejs

	# PIP
	sudo easy_install pip

	# Installations
	# -------------

	# TODO: Cyberduck, AppCleaner, Firefox + Chrome, MacVim

	# Mac App Store stuff? TODO

	# Accounts and things
	# -------------------

	# TODO: email, address book

	# Finder
	# ------

	# Show extensions
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	# Empty trash securely
	defaults write com.apple.finder EmptyTrashSecurely -bool true

	# Display full path in Finder windows 
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

	# No status bar in Finder
	defaults write com.apple.finder ShowStatusBar -bool false

	# Dock and stuff
	# --------------

	# Hide battery time and percentage
	defaults write com.apple.menuextra.battery ShowPercent -string "NO"
	defaults write com.apple.menuextra.battery ShowTime -string "NO"

	# Pin dock to left, make it the right size
	defaults write com.apple.dock pinning -string start
	defaults write com.apple.dock tilesize -int 32

	# Show indicator lights for open applications in the Dock
	defaults write com.apple.dock show-process-indicators -bool true

	# Stop .DS_Store on networks
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

	# Menu bar should be transparent
	defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool true

	# Disable dashboard
	defaults write com.apple.dashboard mcx-disabled -boolean YES

	# Misc.
	# -----

	# No press-and-hold stuff, nor autocorrect
	defaults write -g ApplePressAndHoldEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

	# HOW FAST YOU WANT THOSE KEYS TO REPEAT???
	defaults write NSGlobalDomain KeyRepeat -int 0

	# Trackpad tap to click
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

	# Expand save and print panels by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

	# Disable "hey did you wanna open this it's from Internet"
	defaults write com.apple.LaunchServices LSQuarantine -bool false

	# Destroy Ping in iTunes
	defaults write com.apple.iTunes disablePingSidebar -bool true
	defaults write com.apple.iTunes disablePing -bool true

	# All done!
	# ---------

	killall Finder
	killall Dock

fi

# YEEAH DONE!
# ===========

rm log.txt
