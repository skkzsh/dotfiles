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
# GUIだと失敗?
if [ -n "$BASH_VERSION" ]; then
    host="$HOSTNAME"
elif [ -n "$ZSH_VERSION" ]; then
    host="$HOST"
fi

case "`uname`" in
    Linux)
        # if ! which X > /dev/null 2>&1 ; then
            if which keychain > /dev/null 2>&1 ; then
                # unset SSH_AUTH_SOCK
                keychain ~/.ssh/id_rsa
                # keychain -q ~/.ssh/id_rsa
                . ~/.keychain/$host-sh
                # . ~/.ssh-agent-$HOSTNAME
            fi
        # fi
        ;;
    *) ;;
esac

unset host

# eval `ssh-agent`
# ssh-agent $SHELL
# exec ssh-agent $SHELL
# ssh-add

## TODO: screenでもssh-agent
## 大丈夫か?
# ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
# export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
# if [ -S ~/.ssh/ssh_auth_sock ]; then
#     # echo '1!'
#     export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
# elif [ ! -S "$SSH_AUTH_SOCK" ]; then
#     # echo '2!'
#     export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
# elif [ ! -L "$SSH_AUTH_SOCK" ]; then
#     # echo '3!'
#     ln -snf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock &&
#     export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
# fi


### TeX
case "`uname`" in
    Linux)
        # if [ -d /usr/local/texlive ]; then
        #     PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH
        #     MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH
        #     INFOPATH=/usr/local/texlive/2012/texmf/doc/info:$INFOPATH
        # fi
        ;;
    Darwin)
        ;;
    *) ;;
esac
