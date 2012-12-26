## Bash Alias
[ -d ~/.bash/conf ] && . ~/.bash/conf/alias.bash


## Global Alias
alias -g L='| less'
alias -g G='| grep'
alias -g S='| wc'
alias -g A='| xargs'
# alias -g H='| head'
# alias -g T='| tail'
# alias -g S='| sed'
alias -g P='| percol'
alias -g N='> /dev/null'
alias -g H=--help
alias -g V=--version
alias -g ....=../..
alias -g ......=../../..
alias -g Z='| tar zxf -'
alias -g J='| tar jxf -'


## Suffix Alias

alias -s eps=gv

case `uname` in
    Linux)
        alias -g C='| xclip -sel clip'
        alias -s dvi=xdvi
        alias -s pdf=zathura
        ;;
    Darwin)
        alias -g C='| pbcopy'
        alias -s dvi='open -a Mxdvi'
        alias -s pdf='open -a Preview'
        ;;
esac
