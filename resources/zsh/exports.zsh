export PATH="$HOME/.bin:$PATH"

export EDITOR=vim
export USE_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

export CLICOLOR=1
export LS_COLORS='di=30;46:tw=30;46:ow=30;46:ex=31:su=31:sg=31:'
export LSCOLORS='afxxxxxxbxxxxxbxbxagag'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='00;36'

if hash less 2>/dev/null; then
  export PAGER='less'
  export LESS='--ignore-case --long-prompt --QUIET --raw-control-chars --no-init'
elif hash more 2>/dev/null; then
  export PAGER='more'
else
  export PAGER='cat'
fi