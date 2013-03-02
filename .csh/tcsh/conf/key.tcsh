### Keybind

## BashのようにhistoryをSearch
bindkey "^R" i-search-back
bindkey "^S" i-search-fwd
# bindkey ^W backward-delete-word
# bindkey -k up history-search-backward
# bindkey -k down history-search-forward

## ~/.inputrc
# Pipe
bindkey -s '^xg' ' | grep'
bindkey -s '^xl' ' | less'
# Option
#bindkey -s '^xh': ' --help'
# Directory
bindkey -s '^xh' ' ~/'
bindkey -s '^xd' ' ~/Dropbox/'
bindkey -s '^xe' ' ~/.emacs.d/'
bindkey -s '^xo' ' ~/.opera/'
# su
#bindkey -s '^xi' 'sudo /etc/init.d/'
