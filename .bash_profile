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

# echo hello bash_profile

## Path (下の方ほど優先度が高い)
## tmuxなら読み込まない
if [[ -z $TMUX ]] ; then

    #---------------------------------------------------------------------------
    case $(uname) in

        Darwin)
            if [[ -n $ZSH_NAME ]] ; then
                PATH="/usr/sbin:/sbin:$PATH"
            fi
            PATH="/usr/local/bin:/usr/local/sbin:$PATH"
            ;;

        Linux)
            if [[ -d ~/.linuxbrew ]] ; then
                PATH="$HOME/.linuxbrew/bin:$PATH"
                MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
                INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
            fi
            ;;

        SunOS)
            PATH="/opt/csw/bin:/opt/csw/sbin:$PATH:/usr/sbin"

            ;;

        MSYS*|MINGW64*)
            ## /etc/profile.d/perlbin.sh
            PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH"
            ;;

        *) ;;
    esac

    #---------------------------------------------------------------------------
    case $(uname) in
        FreeBSD|SunOS)
            if [[ -d ~/perl5 ]] ; then
                eval $(perl -I ~/perl5/lib/perl5 -Mlocal::lib)
            fi
            ;;
        *) ;;
    esac

    case $(uname) in

        Linux|FreeBSD|SunOS)
            for ext in pl py rb ; do # php nd
                if [[ -d ~/.${ext}env/bin ]] ; then
                    PATH="$HOME/.${ext}env/bin:$PATH"
                fi
            done
            ;;

        *) ;;
    esac

    for ext in pl py rb ; do # php nd
        which ${ext}env > /dev/null 2>&1 && eval "$(${ext}env init -)"
    done
    unset ext

    ### nodebrew cabal
    if [[ -d ~/.nodebrew ]] ; then
        PATH="$HOME/.nodebrew/current/bin:$PATH"
    fi
    if [[ -d ~/.cabal ]] ; then
        PATH="$HOME/.cabal/bin:$PATH"
    fi

    ### go
    case $(uname) in
        Darwin|Linux|FreeBSD|SunOS)

            if which go > /dev/null 2>&1 ; then
                export GOPATH=~/.go
                PATH="$GOPATH/bin:$PATH"
            fi

            ;;
        *) ;;
    esac

    ### cask
    # if [[ -d ~/.cask ]] ; then
    #     PATH="$HOME/.cask/bin:$PATH"
    # fi

    ### TeX
    # case $(uname) in
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

    ### User
    for dir in .local/bin .usr/bin bin ; do
        if [[ -d ~/$dir ]] ; then
            PATH="$HOME/$dir:$PATH"
        fi
    done
    unset dir

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
    case $(uname) in

        Darwin)
            for app in Xpdf gnuplot ; do #Ghostscript
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
            if [[ -d ~/.usr/v2c ]] ; then
                PATH="$HOME/.usr/v2c:$PATH"
            fi
            # if [[ -d /usr/NX/bin ]] ; then
            #     PATH="/usr/NX/bin:$PATH"
            # fi
            ;;

        # MINGW32*)
        #     Perlの優先順位を上げる
        #     if [[ -d /c/strawberry ]]; then
        #         PATH="/c/strawberry/perl/site/bin:/c/strawberry/perl/bin:/c/strawberry/c/bin:$PATH"
        #     fi
        #     ;;

        *) ;;
    esac

fi

#---------------------------------------------------------------------------
# if running bash
if [[ -n $BASH ]]; then
    # include .bashrc if it exists
    if [[ -f ~/.bashrc ]]; then
        . ~/.bashrc
    fi
fi
