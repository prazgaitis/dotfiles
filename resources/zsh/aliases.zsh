alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias l="ls"
alias g="git"
alias q="exit"

alias rn="date '+%l:%M%p on %A, %B %e, %Y'"
alias serveit="python -m SimpleHTTPServer"
alias myip="curl -s icanhazip.com"
alias removeexif="jhead -purejpg"

alias vi="vim"
alias ed="ed -p:"
alias lynx="lynx -cfg ~/Coding/personal/dotfiles/resources/lynx.cfg"
alias tmux="tmux -u2"
alias more="less"
alias mv="mv -i -v"
alias cp="cp -i -v"
alias mkdir="mkdir -p -v"

alias ,,="cd .."
alias ..l="cd .. && ls"
alias cd..="cd .."
alias gits="git s"
alias gs="git s"
alias mdkir="mkdir"
alias gut="git"
alias sudp="sudo"
alias mate.="mate ."

cd() {builtin cd $@; ls }
