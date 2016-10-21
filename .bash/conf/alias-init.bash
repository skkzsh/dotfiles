# Alias
# NOTE: source this file in .zshrc
# TODO: Macでcoreutilsを使う場合を考慮
# dircolorsの後に置く

#---------------------------------------------------------------------------
case $OSTYPE in

    darwin*)

        alias o=open
        alias pst=pbpaste

        if [[ -d /Applications/MacVim.app ]]; then
            alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
        fi

        # if which brew > /dev/null ; then
            # if [[ -d $(brew --prefix emacs) ]]; then
            #     alias emacs=$(brew --prefix emacs)/Emacs.app/Contents/MacOS/Emacs
            #     # alias emacs=$(brew --cellar emacs)/25*/Emacs.app/Contents/MacOS/Emacs
            # fi

            # which gsed > /dev/null && alias sed=gsed
            ## Shell ScriptだとAliasが無効?
        # fi

        ;;

    linux*)

        # Add an "alert" alias for long running commands.  Use like so:
        #   sleep 10; alert
        alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

        alias o=xdg-open
        alias pst='xclip -selection clipboard -o'

        # alias n='nautilus --no-desktop'
        alias lvi=/usr/share/vim/vimcurrent/macros/less.sh
        # alias m='matlab -nodesktop -nosplash'
        # PDF
        # alias evc=evince
        # alias xp=xpdf
        # alias =zathura
        # alias a=apvlv
        ## Paco
        # alias pacod='paco -D'
        # alias pacop='paco -p'
        # alias pacoa='paco -1addFs'
        # alias pacof='paco -fs'
        # alias pacou='paco -ua'
        # alias pacor='paco -r'

        alias db=dropbox
        ;;

    solaris*)
        # alias ls=gls
        alias grep=ggrep
        alias fgrep=gfgrep
        alias egrep=gegrep
        alias rm=grm
        ;;

    msys)
        alias o=start
        alias pst='cat /dev/clipboard'
        alias wgit='/c/Program\ Files/Git/bin/git'
        # alias wgit='/c/Program\ Files/Git/cmd/git'
        # alias wgpg="LANG=C /c/Program\ Files\ \(x86\)/GNU/GnuPG4Win/pub/gpg"
        ;;

    *) ;;
esac

case $OSTYPE in
    darwin*|freebsd*|msys) alias vi=vim ;;
    *) ;;
esac

if [[ -f /etc/issue ]]; then
    case "$(cat /etc/issue)" in

        Arch*)
            alias vi=vim
            ;;

        *) ;;
    esac
fi

#---------------------------------------------------------------------------
### LS_COLORS
### XXX: dircolorsはxtermでないと出力されない?
# if which gdircolors > /dev/null 2>&1 ; then
#     dc=gdircolors
# else
#     dc=dircolors
# fi
if which dircolors > /dev/null 2>&1 ; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
unset dc

if [[ -n $LS_COLORS && $(uname) = SunOS ]]; then
    alias grep='ggrep --color=always'
    alias fgrep='gfgrep --color=always'
    alias egrep='gegrep --color=always'
elif [[ -n $LS_COLORS || $(uname) = Darwin || $(uname) = FreeBSD ]]; then
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

if [[ -n $LS_COLORS && $(uname) != Darwin ]]; then
    alias ls='ls -Fh --color=always'
    alias dir='dir -Fh --color=always'
    alias vdir='vdir -Fh --color=always'
fi

case $(uname) in
    Darwin|FreeBSD) alias ls='ls -FhG' ;;
    *) ;;
esac

#---------------------------------------------------------------------------
if which htop > /dev/null 2>&1 ; then
    alias top=htop
fi

case $OSTYPE in

    msys)
        if which colordiff > /dev/null 2>&1 ; then
            difftool=colordiff
        else
            difftool=diff
        fi

        if which diff-highlight > /dev/null 2>&1 ; then
            function di {
                $difftool -u $@ | diff-highlight
            }
        else
            alias di=$difftool
        fi
        # unset difftool
        ;;

    *)
        if which git > /dev/null 2>&1 ; then
            alias di='git diff --no-index'
        elif which colordiff > /dev/null 2>&1 ; then
            alias di=colordiff
        else
            alias di=diff
        fi
        ;;
esac

#---------------------------------------------------------------------------
### Basic
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
# alias less='less -iMR -x4'
alias l='less'
alias lsl='ls | less'
alias lll='ls -l | less'
alias lal='ls -A | less'
alias llal='ls -lA | less'
alias dul='du | less'
alias paxl='ps ax | less'
#alias ='tree | less'
#alias ptl='pstree -al | less'
alias ag="ag --pager='less -iMR -x4'"
if [[ -n $BASH ]]; then
    alias hl='history | less'
elif [[ -n $ZSH_NAME ]]; then
    alias hl='history 1 | less'
fi
case $(uname) in
    Darwin) alias lest='last | less' ;;
    Linux)  alias lest='last -a | less' ;;
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
# alias s=screen
# alias sls='screen -ls'
# alias sr='screen -R'
# alias sS='screen -S'

### tmux
alias t=tmux

### Editor

## Emacs for X
alias e='emacs'
# alias wl='emacs -f wl'
## Emacs for CUI
alias enw='emacs -nw'
# alias wlnw='emacs -nw -f wl'
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
# alias mkve=mkvirtualenv
# alias lsve=lsvirtualenv
# alias rmve=rmvirtualenv
# alias wo=workon
# alias da=deactivate

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
# t=tmux
# u=
# v=vim
# w
# x=
# y=
# z
