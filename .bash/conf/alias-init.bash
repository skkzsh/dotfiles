# Alias
# NOTE: source this file in .zshrc
# TODO: Macでcoreutilsを使う場合を考慮
# dircolorsの後に置く

#---------------------------------------------------------------------------
case "$(uname)" in

    Darwin)

        alias o=open
        alias pst=pbpaste

        alias ls='ls -FhG'
        alias grep='grep --color=always'
        alias fgrep='fgrep --color=always'
        alias egrep='egrep --color=always'

        if [[ -d /Applications/MacVim.app ]]; then
            alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
            alias vi=vim
        fi

        if which brew > /dev/null ; then
            if [[ -d $(brew --cellar emacs) ]]; then
                alias emacs24=$(brew --prefix emacs)/Emacs.app/Contents/MacOS/Emacs
                alias emacs=emacs24
            fi
            # which gsed > /dev/null && alias sed=gsed
            ## Shell ScriptだとAliasが無効?
        fi

        ;;

    Linux)

        if [[ -n $LS_COLORS ]]; then
            alias ls='ls -Fh --color=always'
            alias dir='dir -Fh --color=always'
            alias vdir='vdir -Fh --color=always'
            alias grep='grep --color=always'
            alias fgrep='fgrep --color=always'
            alias egrep='egrep --color=always'
        fi

        # Add an "alert" alias for long running commands.  Use like so:
        #   sleep 10; alert
        alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

        alias o=xdg-open
        alias pst='xclip -sel clip -o'

        # alias n='nautilus --no-desktop'
        alias lvi=/usr/share/vim/vimcurrent/macros/less.sh
        # alias m='matlab -nodesktop -nosplash'
        # PDF
        # alias evc=evince
        # alias xp=xpdf
        # alias =zathura
        alias a=apvlv
        ## Paco
        alias pacod='paco -D'
        alias pacop='paco -p'
        alias pacoa='paco -1addFs'
        alias pacof='paco -fs'
        alias pacou='paco -ua'
        alias pacor='paco -r'

        alias db=dropbox
        ;;

    SunOS)
        if [[ -n $LS_COLORS ]]; then
            alias ls='gls -Fh --color=always'
            alias dir='dir -Fh --color=always'
            alias vdir='vdir -Fh --color=always'
            alias grep='ggrep --color=always'
            alias fgrep='gfgrep --color=always'
            alias egrep='gegrep --color=always'
        fi

        alias rm='grm'
        ;;

    MINGW32*)
        alias o=start
        alias vi=vim
        alias ls='ls -Fh --color=always'
        alias dir='dir -Fh --color=always'
        alias vdir='vdir -Fh --color=always'
        ## Git BashのError回避のため
        if [[ -n $LS_COLORS ]]; then
            alias grep='grep --color=always'
            alias fgrep='fgrep --color=always'
            alias egrep='egrep --color=always'
        fi
        ;;

    CYGWIN*)
        alias o=cygstart
        ;;

    *) ;;
esac

#---------------------------------------------------------------------------
if which htop > /dev/null 2>&1 ; then
    alias top=htop
fi
if which colordiff > /dev/null 2>&1 ; then
    alias d=colordiff
else
    alias d=diff
fi

#---------------------------------------------------------------------------
### Basic
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias cd..='cd ..'
alias cd....='cd ../..'
alias cd......='cd ../../..'
# alias -='cd -'
alias cd-='cd -'
# alias pd=pushd
# alias po=popd
alias sl=ls
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias mv='mv -i'
alias cp='cp -i'
alias md=mkdir
alias rd=rmdir
alias df='df -h'
alias du='du -h'
alias h=history
alias jb='jobs -l'
alias wh='which'
alias wha='which -a'
# alias zx='tar zxvf'
# alias zc='tar zcvf'
# alias jx='tar jxvf'
# alias jc='tar jcvf'
# alias Jx='tar Jxvf'
# alias Jc='tar Jcvf'
# alias ='locate'
alias nkfg='nkf -g'
alias nkfu='nkf --overwrite -w -Lu'
alias nkfe='nkf --overwrite -e -Lu'
alias nkfs='nkf --overwrite -s -Lw'
alias nkfsu='nkf --overwrite -s -Lu'
alias cmx='chmod +x'
# alias ='ln -s'
alias su-='su -'
#alias crontab -i
alias trc=truecrypt
alias jk=jekyll
### Network
alias p=ping
# alias ic=ifconfig
# alias std='sudo tcpdump'
# alias =nm-connection-editor
alias wg=wget
# alias wgcd=wget --content-disposition
# alias wgtsn=wget --trust-server-names
# alias wgncc=wget --no-check-certificate
# alias cu=curl

#---------------------------------------------------------------------------
## Trash
# if which rmtrash > /dev/null 2>&1 ; then
#     alias rm=rmtrash
# elif which gmv > /dev/null 2>&1 ; then
#     alias rm='gmv -f --backup=numbered --target-directory ~/.mytrash'
# else
#     alias rm='mv -f --backup=numbered --target-directory ~/.mytrash'
if which trash-put > /dev/null 2>&1 ; then
    alias rm=trash-put
    # alias tls=trash-list
    # alias tst=restore-trash
    # alias trm=trash-rm
else
    alias rm='rm -i'
fi

#---------------------------------------------------------------------------
### less
alias less='less -iMR -x4'
alias l='less'
alias lsl='ls | less'
alias lll='ls -l | less'
alias lal='ls -A | less'
alias llal='ls -lA | less'
alias dul='du | less'
alias paxl='ps ax | less'
#alias ='tree | less'
#alias ptl='pstree -al | less'
alias ag="ag --pager='less -R'"
if [[ -n $BASH ]]; then
    alias hl='history | less'
elif [[ -n $ZSH_NAME ]]; then
    alias hl='history 1 | less'
fi
case "$(uname)" in
    Darwin) alias lest='last | less' ;;
    Linux) alias lest='last -a | less' ;;
    *) ;;
esac

#---------------------------------------------------------------------------
### grep
alias pgrep='pgrep -l'
if [[ -n $BASH ]]; then
    alias ps?='ps ax | grep'
    alias h?='history | grep'
elif [[ -n $ZSH_NAME ]]; then
    alias ps\?='ps ax | grep'
    alias h\?='history 1 | grep'
fi

#---------------------------------------------------------------------------
### GNU screen
alias s=screen
alias sls='screen -ls'
alias sr='screen -R'
alias sS='screen -S'

### tmux
alias t=tmux

### Editor

## Emacs for X
alias e='emacs'
alias wl='emacs -f wl'
## Emacs for CUI
alias enw='emacs -nw'
alias wlnw='emacs -nw -f wl'
# env TERM=xterm-256color
## Emacs Client
## Optionによる挙動の違いがよく分からない
## Emacs Server
alias ecn='emacsclient -n' # 既存のServerに送る
## Emacs Daemon
alias edm='emacs --daemon'
alias ek="emacsclient -e '(kill-emacs)'"
alias ec='emacsclient' # CUI
alias ecnc='emacsclient -n -c' # GUI

## Vim
alias v=vim
alias vw=view
alias vd=vimdiff
alias se=sudoedit

### Perl
alias pld=perldoc

### Python
alias py=python
alias ipy=ipython
## virtualenvwrapper
alias mkve=mkvirtualenv
alias lsve=lsvirtualenv
alias rmve=rmvirtualenv
alias wo=workon
alias da=deactivate

### Git
alias g=git
# alias g='git add'
# alias g='git commit'
# alias g='git status'
# alias g='git branch'
# alias g='git checkout'
# alias g='git diff'
# alias g='git log'
# alias g='git rm'

#---------------------------------------------------------------------------
### Memo
# a=apvlv
# b=
# c=curl
# d=diff
# e=emacs
# f=
# g=git
# h=history
# i
# j
# k=
# l=less
# m=
# n=
# o=open
# p=ping
# q=
# r
# s=screen
# t=top
# u=
# v=vim
# w
# x=
# y=
# z
