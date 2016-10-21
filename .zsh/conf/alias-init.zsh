# Aliases for Zsh

#---------------------------------------------------------------------------
## Bash Alias
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/alias-init.bash
fi

#---------------------------------------------------------------------------
## Zsh Alias
alias h1='history 1'
# alias hi='history -i'
# alias zmv='noglob zmv -W'

#---------------------------------------------------------------------------
## Global Alias
alias -g L='| less'
alias -g G='| grep'
alias -g W='| wc'
alias -g A='| xargs'
alias -g S='| sort'
alias -g U='| uniq'
# alias -g H='| head'
# alias -g T='| tail'
# alias -g A='| gawk'
# alias -g S='| sed'
# alias -g P='| perl'
alias -g P='| peco'
alias -g N='> /dev/null'
alias -g H=--help
alias -g V=--version
alias -g ....=../..
alias -g ......=../../..
alias -g Z='| tar zxf -'
# alias -g J='| tar jxf -'
# alias -g J='| tar Jxf -'
alias -g J='| jq .'

#---------------------------------------------------------------------------
## Suffix Alias
if which aunpack > /dev/null 2>&1 ; then
    alias -s {tar,gz,tgz,bz2,tbz,xz,txz,lzo,tzo,cpio}=aunpack
    alias -s {zip,lzh,lha,rar,jar,7z,ace,arj,Z}=aunpack
fi

# alias -s {}=less
# org
alias -s {txt,log,md,conf}=view
alias -s {css,xml,yml,json,ini}=view
alias -s {el,vim}=view
alias -s epub=unzip
alias -s gpg=gpg
alias -s sqlite{,3}=sqlite3
alias -s db=sqlite3

case $OSTYPE in

    darwin*)
        alias -g C='| pbcopy'
        alias -s pdf='qlmanage -p'
        # alias -s dvi=open
        alias -s {,s}htm{,l}=open
        alias -s {jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF,bmp,BMP,eps}='qlmanage -p'
        alias -s csv='qlmanage -p'
        ;;

    linux*)
        alias -g C='| xclip -selection clipboard'
        alias -s pdf=zathura
        # alias -s dvi=xdvi
        alias -s eps=gv
        alias -s {,s}htm{,l}=xdg-open
        alias -s {jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF,bmp,BMP}=xdg-open
        ;;

    solaris*)
        # alias -g C='| xclip -selection clipboard'
        # alias -s pdf=zathura
        # alias -s dvi=xdvi
        alias -s eps=gv
        alias -s {,s}htm{,l}=xdg-open
        alias -s {jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF,bmp,BMP}=xdg-open
        ;;

    msys)
        alias -g C='| clip'
        alias -s lnk=start
        alias -s pdf=start
        alias -s {,s}htm{,l}=start
        alias -s {jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF,bmp,BMP,eps}=start
        ;;

    *)  ;;
esac
