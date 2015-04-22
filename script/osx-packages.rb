#!/usr/bin/env ruby

# what are we installing

TAPS = [
  'homebrew/games',
  'caskroom/fonts'
]

BREWS = [
  # replacements
  'bash',
  'git --with-brewed-curl --with-brewed-openssl --with-brewed-svn',
  'python',
  'ruby',
  'vim --with-client-server --with-lua',
  'zsh',

  # other CLI
  'aspell --with-lang-en',
  'colordiff',
  'dict',
  'ffmpeg --with-faac --with-fdk-aac --with-ffplay --with-fontconfig --with-freetype --with-frei0r --with-libass --with-libbluray --with-libcaca --with-libquvi --with-libsoxr --with-libvidstab --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-openssl --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-x265',
  'lua',
  'lynx',
  'mobile-shell',
  'naga',
  'pianobar',
  'reattach-to-user-namespace',
  'screenbrightness',
  'spoof-mac',
  'tmux',
  'trash',
  'vimpager',
  'vitetris',
  'youtube-dl',
  'z'
]

CASKS = [
  'alfred',
  'appcleaner',
  'atom',
  'audio-hijack',
  'brightness',
  'chromium',
  'cloud',
  'dash',
  'dropbox',
  'firefox',
  'flux',
  'gitx',
  'handbrake',
  'imageoptim',
  'iterm2',
  'keka',
  'macdown',
  'openemu',
  'paintbrush',
  'proxpn',
  'rdio',
  'skype',
  'spectacle',
  'spideroak',
  'the-unarchiver',
  'vlc',

  # fonts
  'font-fredoka-one',
  'font-inconsolata',
  'font-lato',
  'font-open-sans',

  # quicklook plugins
  'qlcolorcode',
  'qlmarkdown',
  'qlstephen',
  'quicklook-csv',
  'quicklook-json',
  'webpquicklook',

  # other plugins and non-apps
  'google-hangouts'
]

GEMS = [
  'delicious-cli',
  'rdio-cli'
]

PIPS = [
  'pygments',
  'emo'
]

# do the installation

if `which brew` == ''
  puts `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
end

INSTALLED_BREWS = `brew list`.split("\n")
if INSTALLED_BREWS.include? 'brew-cask'
  INSTALLED_CASKS = `brew cask list`.split("\n")
else
  INSTALLED_CASKS = []
end
INSTALLED_GEMS = `gem list --no-versions`.split("\n")
if INSTALLED_BREWS.include? 'python'
  INSTALLED_PIPS = `pip list`.split("\n").map { |p| p.split[0].downcase }
else
  INSTALLED_PIPS = []
end
INSTALLED_TAPS = `brew tap`.split("\n")

$command_queue = ['brew update']
unless INSTALLED_BREWS.include? 'brew-cask'
  $command_queue.push "brew install caskroom/cask/brew-cask"
end

def install(list, command, existing)
  list.each do |package|
    name = package.split.first
    unless existing.include? name
      print "install #{name}? "
      skip_cmd = gets.strip
      go_ahead = (skip_cmd == 'y') || (skip_cmd == 'yes') || (skip_cmd == '')
      $command_queue.push "#{command} #{package}" if go_ahead
    end
  end
end

install TAPS, "brew tap", INSTALLED_TAPS
install BREWS, "brew install", INSTALLED_BREWS
install CASKS, "brew cask install", INSTALLED_CASKS
install GEMS, "gem install", INSTALLED_GEMS
install PIPS, "pip install", INSTALLED_PIPS

puts
puts "alright let's do this"
puts

$command_queue.each do |command|
  system command
end
