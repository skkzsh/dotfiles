### Ubuntu
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

## Ubuntuだと, .bash_profileは読み込まれない.

# if running bash
if [[ -n $BASH_VERSION ]]; then
    # include .bashrc if it exists
    if [[ -f ~/.bashrc ]]; then
        . ~/.bashrc
    fi
fi

## Path (下の方ほど優先度が高い)

#---------------------------------------------------------------------------
case "$(uname)" in

    Darwin)
        PATH="/usr/local/sbin:/usr/local/bin:$PATH"
        ;;

    Linux)
        if [[ -d $HOME/.linuxbrew ]] ; then
            PATH="$HOME/.linuxbrew/bin:$PATH"
            MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
            INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
        fi
        for ext in pl py rb php; do
            if [[ -d $HOME/.${ext}env ]] ; then
                PATH="$HOME/.${ext}env/bin:$PATH"
            fi
        done
        unset ext
        ;;
    *) ;;
esac

### ndenv
# if [[ -d $HOME/.ndenv ]] ; then
#     PATH="$HOME/.ndenv/bin:$PATH"
# fi

### cabal
if [[ -d $HOME/.cabal ]] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

### nodebrew
if [[ -d $HOME/.nodebrew ]] ; then
    PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

### go
if [[ -d $HOME/.go ]] ; then
    export GOPATH=$HOME/.go
    PATH="$GOPATH/bin:$PATH"
fi

### cask
# if [[ -d $HOME/.cask ]] ; then
#     PATH="$HOME/.cask/bin:$PATH"
# fi

### make install
if [[ -d $HOME/.usr/bin ]] ; then
    PATH="$HOME/.usr/bin:$PATH"
fi

#---------------------------------------------------------------------------
### Git
### XXX
if which git > /dev/null 2>&1 ; then
    gitprefix="$(dirname "$(dirname "$(which git)")")"
    gitpostfix=share/git-core/contrib/diff-highlight
    if [[ -d $gitprefix/$gitpostfix ]] ; then
        PATH="$gitprefix/$gitpostfix:$PATH"
    fi
    unset gitprefix gitpostfix
fi

#---------------------------------------------------------------------------
case "$(uname)" in

    Darwin)
        for app in Xpdf gnuplot Ghostscript; do
            dir=/Applications/$app.app
            if [[ -d $dir ]]; then
                PATH="$dir:$dir/bin:$PATH"
            fi
        done
        for app in MacVim Firefox calibre; do
            dir=/Applications/$app.app
            if [[ -d $dir ]]; then
                PATH="$dir/Contents/MacOS:$PATH"
            fi
        done
        unset app dir
        # if which brew > /dev/null ; then
            ## Coreutils (brew info coreutils)
            ## 既存のCommandをCoreutilsで上書きするなら下記を設定
            ## if [[ -d $(brew --prefix coreutils) ]]; then
            ##     PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
            ##     MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
            ## fi
        # fi
        ;;

    Linux)
        if [[ -d $HOME/.usr/v2c ]] ; then
            PATH="$HOME/.usr/v2c:$PATH"
        fi
        if [[ -d /usr/NX/bin ]] ; then
            PATH="/usr/NX/bin:$PATH"
        fi
        ;;

    # MINGW32*)
    #     Perlの優先順位を上げる
    #     if [[ -d /c/strawberry ]]; then
    #         PATH="/c/strawberry/perl/site/bin:/c/strawberry/perl/bin:/c/strawberry/c/bin:$PATH"
    #     fi
    #     ;;

    *) ;;
esac

#---------------------------------------------------------------------------
### set PATH so it includes user's private bin if it exists
if [[ -d $HOME/bin ]]; then
    PATH="$HOME/bin:$PATH"
fi

#---------------------------------------------------------------------------
### TeX
# case "$(uname)" in
#     Linux)
#         if [[ -d /usr/local/texlive ]]; then
#             PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH
#             MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH
#             INFOPATH=/usr/local/texlive/2012/texmf/doc/info:$INFOPATH
#         fi
#         ;;
#     Darwin)
#         ;;
#     *) ;;
# esac
