# Aliases for Zsh

#---------------------------------------------------------------------------
## Bash Alias
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/alias.bash
fi

#---------------------------------------------------------------------------
## Zsh Alias
alias h1='history 1'
alias hd='history -d'
# alias zmv='noglob zmv -W'

#---------------------------------------------------------------------------
## Global Alias
alias -g L='| less'
alias -g G='| grep'
alias -g W='| wc'
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
# alias -g J='| tar Jxf -'


#---------------------------------------------------------------------------
## Suffix Alias
if which aunpack > /dev/null 2>&1 ; then
    alias -s {tar,gz,tgz,bz2,tbz,xz,lzo,tzo,cpio}=aunpack
    alias -s {zip,lzh,lha,rar,jar,7z,ace,arj,Z}=aunpack
fi
alias -s gpg=gpg


case "$(uname)" in

    Linux)
        alias -g C='| xclip -sel clip'
        alias -s pdf=zathura
        alias -s dvi=xdvi
        alias -s eps=gv
        alias -s {jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF,bmp,BMP,eps}=xdg-open
        ;;

    Darwin)
        alias -g C='| pbcopy'
        alias -s {pdf,dvi}=open
        alias -s {jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF,bmp,BMP,eps}=open
        ;;

    *)  ;;
esac
