# enable color support of ls and also add handy aliases
if which dircolors > /dev/null ; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -Fh --color=always'
    alias dir='dir --color=always'
    alias vdir='vdir --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'

# elif which gdircolors > /dev/null ; then
#     test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
fi

case "`uname`" in

    Linux)

        # Add an "alert" alias for long running commands.  Use like so:
        #   sleep 10; alert
        alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

        alias o=xdg-open
        alias n='nautilus --no-desktop'
        alias lvi=/usr/share/vim/vimcurrent/macros/less.sh
        alias m='matlab -nodesktop -nosplash'
        # PDF
        # alias acrd=acroread
        # alias evc=evince
        # alias xp=xpdf
        alias a=apvlv
        ## Paco
        alias pacod='paco -D'
        alias pacop='paco -p'
        alias pacoa='paco -1addFs'
        alias pacof='paco -fs'
        alias pacou='paco -ua'
        alias pacor='paco -r'

        ## Dropbox
        alias db=dropbox
        dbs() {
            case "`dropbox status`" in
                "Dropbox isn't running!") dropbox start -i ;; # 未起動ならば起動
                *) dropbox status ;; # でなければ状態を表示
            esac
        }

        ;;

    Darwin)

        alias o=open
        alias ls='ls -FhG'
        alias grep='grep --color=always'
        alias fgrep='fgrep --color=always'
        alias egrep='egrep --color=always'

        if [ -d /Applications/MacVim.app ]; then
            alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
            alias vi=vim
        fi

        if which brew > /dev/null ; then
            if [ -d "`brew --cellar emacs`" ]; then
                alias emacs24="`brew --prefix emacs`/Emacs.app/Contents/MacOS/Emacs"
                alias emacs='emacs24'
                # alias emacs23="`brew --cellar emacs`/23.3b/Emacs.app/Contents/MacOS/Emacs"
                # alias emacs24="`brew --cellar emacs`/24.1/Emacs.app/Contents/MacOS/Emacs"
            fi
            # which gsed > /dev/null && alias sed=gsed
        fi

        ;;

    CYGWIN*)
        alias o=cygstart
        ;;
    MINGW32*)
        alias o=open
        ;;

    *) ;;
esac

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
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias h=history
alias jb='jobs -l'
alias wh=which
# alias ='locate'
alias nkfg='nkf -g'
alias nkfu='nkf --overwrite -w -Lu'
alias nkfe='nkf --overwrite -e -Lu'
alias nkfs='nkf --overwrite -s -Lw'
alias cmx='chmod +x'
# alias ='ln -s'
# alias ='rdesktop'
alias su-='su -'
#alias crontab -i
### Network
alias p=ping
# alias ic=ifconfig
# alias std='sudo tcpdump'
# alias =nm-connection-editor

if which htop > /dev/null 2>&1 ; then
    alias t=htop
else
    alias t=top
fi
if which colordiff > /dev/null 2>&1 ; then
    alias d=colordiff
else
    alias d=diff
fi

### less
alias less='less -R -x4'
alias l=less
alias lsl='ls | less'
alias lll='ls -l | less'
alias lal='ls -A | less'
alias llal='ls -lA | less'
alias dul='du | less'
alias paxl='ps ax | less'
#alias ptl='pstree -al | less'
if [ -n "$BASH_VERSION" ]; then
    alias hl='history | less'
elif [ -n "$ZSH_VERSION" ]; then
    alias hl='history 1 | less'
fi
case "`uname`" in
    Linux) alias lest='last -a | less' ;;
    Darwin) alias lest='last | less' ;;
    *) ;;
esac

### grep
alias pgrep='pgrep -l'
alias paxg='ps ax | grep'

### GNU screen
alias s=screen
alias sls='screen -ls'
alias sr='screen -R'
alias sS='screen -S'

### Editor

## Emacs for X
alias e=emacs
alias wl='emacs -f wl'
## Emacs for CUI
alias enw='env TERM=xterm-256color emacs -nw'
alias wlnw='env TERM=xterm-256color emacs -nw -f wl'
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
alias plb=perlbrew
alias pld=perldoc

### Python
alias py=python
alias ipy=ipython
alias pyb=pythonbrew
## virtualenvwrapper
alias mkve=mkvirtualenv
alias lsve=lsvirtualenv
alias rmve=rmvirtualenv
alias wo=workon
alias da=deactivate

### Git
alias g=git
## Git RepositoryのTopへcd
gtop() {
    cd $(git rev-parse --show-toplevel)
}

### Memo
# a=apvlv
# b=
# c=
# d=diff
# e=emacs
# f=
# g=git
# h=history
# i
# j
# k=
# l=less
# m=matlab
# n=nautilus
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
