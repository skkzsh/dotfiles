### Ubuntu
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Path (下の方ほど優先度が高い)

case "`uname`" in
    Darwin)
        PATH="/usr/local/sbin:/usr/local/bin:$PATH"
        ;;
    *) ;;
esac

### perlbrew
# if [ -d "$HOME/perl5" ]; then
#     PATH="$HOME/perl5/bin:$PATH"
#     MANPATH="$MANPATH:$HOME/perl5/man"
#     export PERL5LIB="$HOME/perl5/lib/perl5"
#     export PERL_CPANM_OPT="--local-lib=$HOME/perl5"
#     # export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
#     # MODULEBUILDRC="$HOME/perl5/.modulebuildrc"
# fi

### rbenv
case "`uname`" in
    Linux)
        [ -d "$HOME/.rbenv" ] && PATH="$HOME/.rbenv/bin:$PATH"
        ;;
    *) ;;
esac

### cabal
[ -d "$HOME/.cabal" ] && PATH="$HOME/.cabal/bin:$PATH"

### nodebrew
if [ -d "$HOME/.nodebrew" ] ; then
    PATH="$HOME/.nodebrew/current/bin:$PATH"
    # nodebrew use latest
fi

### TeX
# kpsewhich -var-value TEXMF*
# kpsewhich --expand-path=$TEXMF*
# kpsewhich --expand-path='$TEXMF*' # Mac
case "`uname`" in
    Darwin)
        # TEXINPUTS=~/texmf/ptex:~/texmf/tex:$TEXINPUTS
        # BIBINPUTS=~/texmf/jbibtex/bib:~/texmf/bibtex/bib:$BIBINPUTS
        # BSTINPUTS=~/texmf/jbibtex/bst:~/texmf/bibtex/bst:$BSTINPUTS
        # TEXMF=
        # TEXMFHOME=
        # TEXMFMAIN=
        # TEXMFLOCAL=
        # TEXMFPROJECT=
        # TEXMFVAR=
        # TEXMFCONFIG=
        # TEXMFCNF=
        ;;
    *) ;;
esac


### autojump
case "`uname`" in

    Darwin)
        if which brew > /dev/null ; then
            ## brew info autojump
            if [ -f `brew --prefix`/etc/autojump.sh ]; then
                if [ -n "$BASH_VERSION" ]; then
                    . `brew --prefix`/etc/autojump.sh
                fi
            fi
        fi
        ;;

    *) ;;
esac


if [ -d "$HOME/.usr/Yomico" ]; then
    PATH="$HOME/.usr/Yomico:$PATH"
fi


case "`uname`" in

    Linux)
        if [ -d /usr/NX/bin ] ; then
            PATH="/usr/NX/bin:$PATH"
        fi
        if [ -d "$HOME/.usr/bin" ]; then
            PATH="$HOME/.usr/bin:$PATH"
        fi
        if [ -d "$HOME/.usr/pypy" ]; then
            PATH="$HOME/.usr/pypy/bin:$PATH"
        fi
        ;;

    Darwin)
        ## if [ -d /Applications/Thunderbird.app ]; then
        ##     PATH="/Applications/Thunderbird.app/Contents/MacOS:$PATH"
        ## fi
        ## if [ -d /Applications/Firefox.app ]; then
        ##     PATH="/Applications/Firefox/Contents/MacOS:$PATH"
        ## fi
        if [ -d /Applications/Xpdf.app ]; then
            PATH="/Applications/Xpdf.app:/Applications/Xpdf.app/bin:$PATH"
        fi
        if [ -d /Applications/gnuplot.app ]; then
            PATH="/Applications/gnuplot.app:/Applications/gnuplot.app/bin:$PATH"
        fi
        if [ -d /Applications/Ghostscript.app ]; then
            PATH="/Applications/Ghostscript.app:/Applications/Ghostscript.app/bin:$PATH"
        fi
        # if which brew > /dev/null ; then
            ## Coreutils (brew info coreutils)
            ## 既存のCommandをCoreutilsで上書きするなら下記を設定
            ## if [ -d "`brew --prefix coreutils`" ]; then
            ##     PATH="`brew --prefix coreutils`/libexec/gnubin:$PATH"
            ##     MANPATH="`brew --prefix coreutils`/libexec/gnuman:$MANPATH"
            ## fi
        # fi
        if [ -d /Applications/MacVim.app ]; then
            PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
        fi
        ;;

    *) ;;
esac


### set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"


### Key Chain
# GUIだと失敗
case "`uname`" in
    Linux)
        # if [ -x /usr/bin/keychain ] ; then
        #     # unset SSH_AUTH_SOCK
        #     keychain ~/.ssh/id_rsa
        #     # keychain -q ~/.ssh/id_rsa
        #     . ~/.keychain/$HOSTNAME-sh
        #     # . ~/.ssh-agent-$HOSTNAME
        # fi
        ;;
    *) ;;
esac

# exec ssh-agent $SHELL
# eval `ssh-agent`

### Mac
## brew install bash
