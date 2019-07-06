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

# echo hello bash_profile # Debug

## Path
#---------------------------------------------------------------------------
case $(uname) in

    Darwin)
        if [[ -n $ZSH_NAME ]] ; then
            export PATH="/usr/sbin:/sbin:$PATH"
        fi
        export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
        ;;

    Linux)
        if [[ -n $ZSH_NAME ]] ; then
            export PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"
        fi
        if [[ -d ~/.linuxbrew ]] ; then
            eval $(~/.linuxbrew/bin/brew shellenv)
        elif [[ -d /home/linuxbrew/.linuxbrew ]] ; then
            eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        fi
        ;;

    SunOS)
        export PATH="/opt/csw/sbin:/opt/csw/bin:/usr/sbin:$PATH"
        ;;

    MSYS*|MINGW64*)
        ## /etc/profile.d/perlbin.sh
        export PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH"
        ;;

    *) ;;
esac

#---------------------------------------------------------------------------
# TODO: Ubuntu on Windows
case $(uname) in
    FreeBSD|SunOS)
        if [[ -d ~/perl5 ]] ; then
            eval $(perl -I ~/perl5/lib/perl5 -Mlocal::lib)
        fi
        ;;
    *) ;;
esac

#---------------------------------------------------------------------------
ext_list=(pl py rb nd go j) # php

case $(uname) in

    Linux|FreeBSD|SunOS)
        for ext in ${ext_list[@]} ; do
            if [[ -d ~/.${ext}env/bin ]] ; then
                export PATH="$HOME/.${ext}env/bin:$PATH"
            fi
        done
        ;;

    *) ;;
esac

for ext in ${ext_list[@]} ; do
    if which ${ext}env > /dev/null 2>&1 ; then
        eval "$(${ext}env init -)"
    fi
done

unset ext ext_list

#---------------------------------------------------------------------------
### nodebrew
if [[ -d ~/.nodebrew/current/bin ]] ; then
    export PATH="$HOME/.nodebrew/current/bin:$PATH"
    export NODE_PATH="$(npm root -g)"
fi

### Go
if which go > /dev/null 2>&1 ; then
    if [[ -d $(go env GOPATH) ]] ; then
        export PATH="$(go env GOPATH)/bin:$PATH"
    else
        export GOPATH=~/go
        export PATH="$GOPATH/bin:$PATH"
    fi
fi

### cabal
if [[ -d ~/.cabal ]] ; then
    export PATH="$HOME/.cabal/bin:$PATH"
fi

### PHP
if  [[ -d ~/.config/composer/vendor/bin ]] ; then
    export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

### Lisp
if  [[ -d ~/.roswell/bin ]] ; then
    export PATH="$HOME/.roswell/bin:$PATH"
fi

#---------------------------------------------------------------------------
# which fzf > /dev/null 2>&1
if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix fzf) ]] ; then
    fzf_prefix=$(brew --prefix fzf)
elif [[ -x ~/.fzf/fzf ]] ; then
    fzf_prefix=~/.fzf
fi
if [[ -n $fzf_prefix ]] ; then
    export PATH="$PATH:$fzf_prefix/bin"
    export MANPATH="$MANPATH:$fzf_prefix/man"
    # unset fzf_prefix
fi

### cask
# if [[ -d ~/.cask ]] ; then
#     export PATH="$HOME/.cask/bin:$PATH"
# fi

### TeX
# case $(uname) in
#     Linux)
    #         if [[ -d /usr/local/texlive ]]; then
    #             export PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH
    #             export MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH
    #             export INFOPATH=/usr/local/texlive/2012/texmf/doc/info:$INFOPATH
    #         fi
    #         ;;
#     Darwin)
    #         ;;
#     *) ;;
# esac

### User
for dir in .local/bin .usr/bin bin ; do
    if [[ -d ~/$dir ]] ; then
        export PATH="$HOME/$dir:$PATH"
    fi
done
unset dir

### Git
### XXX
if which git > /dev/null 2>&1 ; then
    case $OSTYPE in
        msys) gitmiddle=git ;;
        *)    gitmiddle=git-core/contrib ;;
    esac
    gitpostfix=share/$gitmiddle/diff-highlight
    gitprefix="$(dirname "$(dirname "$(which git)")")"
    if [[ -d $gitprefix/$gitpostfix ]] ; then
        export PATH="$gitprefix/$gitpostfix:$PATH"
    fi
    unset gitprefix gitpostfix gitmiddle
fi

#---------------------------------------------------------------------------
case $(uname) in
    Darwin)
        android_sdk_dir=~/Library/Android/sdk
        # android-sdk-macosx
        ;;
    *) ;;
esac

if [[ -n $android_sdk_dir ]] ; then
    if [[ -d $android_sdk_dir ]] ; then
        export PATH="$PATH:$android_sdk_dir/tools:$android_sdk_dir/platform-tools"
        # sqlite3
    fi
    unset android_sdk_dir
fi

#---------------------------------------------------------------------------
case $(uname) in

    Darwin)
        for app in MacVim ; do # Xpdf gnuplot Ghostscript
            dir=/Applications/$app.app
            if [[ -d $dir ]]; then
                export PATH="$dir/Contents/bin:$PATH"
            fi
        done

        for app in Firefox FirefoxESR calibre; do
            dir=/Applications/$app.app
            if [[ -d $dir ]]; then
                export PATH="$dir/Contents/MacOS:$PATH"
            fi
        done

        unset app dir

        if which brew > /dev/null ; then
            # Use GNU sed
            # brew info gnu-sed
            if [[ -d $(brew --prefix gnu-sed) ]]; then
                export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
                export MANPATH="$(brew --prefix gnu-sed)/libexec/gnuman:$MANPATH"
            fi

            # Use gpg1
            # brew info gnupg
            # brew info gpg
            # if [[ -d $(brew --prefix gnupg) ]]; ; then
            #     export PATH="$(brew --prefix gnupg)/libexec/gpgbin:$PATH"
            # fi

            ## Coreutils (brew info coreutils)
            ## 既存のCommandをCoreutilsで上書きするなら下記を設定
            ## if [[ -d $(brew --prefix coreutils) ]]; then
            ##     export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
            ##     export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
            ## fi
        fi

        ;;

    # Linux)
        # if [[ -d /usr/NX/bin ]] ; then
        #     export PATH="/usr/NX/bin:$PATH"
        # fi
        #     ;;

    MSYS*|MINGW*)
        ## Get path on Windows
        ## cmd /c 'echo %path%'
        # win_path=$(powershell -c '$env:path' | xargs -0 cygpath -p)

        # echo $win_path
        # | egrep -o '[^:]*(vim|emacs|choco)[^:]*'
        # cygpath $(powershell -c '$env:path.split(";")'| egrep 'vim|emacs|choco')

        # echo $win_path | tr : '\n'

        # echo $win_path | perl -F: -alne 'for(@F) { print if /Vagrant/ }' | while read dir; do
        #     export PATH="$dir:$PATH"
        # done

        for dir in \
            '/c/Program Files (x86)/PuTTY' \
            /c/HashiCorp/Vagrant/bin
        do
            if [[ -d $dir ]]; then
                export PATH="$dir:$PATH"
            fi
        done

        # echo $win_path | perl -F: -alne 'for(@F) { print if /choco/ }' | while read dir; do
        #     export PATH="$PATH:$dir"
        # done

        # '/c/Program Files (x86)/GNU/GnuPG4Win/pub' \
        for dir in \
            $HOME/.emacs.d/bundle/NTEmacs64/emacs-25.2/bin \
            /c/Applications/vim80-kaoriya-win64 \
            $(cygpath $ProgramData)/chocolatey/bin
        do
            if [[ -d $dir ]]; then
                export PATH="$PATH:$dir"
            fi
        done

        unset dir
        ;;

    *) ;;
esac

#---------------------------------------------------------------------------
### autojump
## compinitより前に
## brew info autojump
if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix autojump) ]] ; then
    . $(brew --prefix)/etc/autojump.sh
elif [[ -f ~/.autojump/etc/profile.d/autojump.sh ]] ; then
    . ~/.autojump/etc/profile.d/autojump.sh
elif [[ -f /usr/share/autojump/autojump.sh ]] ; then
    . /usr/share/autojump/autojump.sh
fi

#---------------------------------------------------------------------------
## Google
# which brew > /dev/null 2>&1 && [[-d $(brew --prefix) ]]
if [[ -d /usr/local/Caskroom/google-cloud-sdk ]] ; then
    gcloud_prefix=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
fi
if [[ -n $gcloud_prefix ]] ; then
    # . $gcloud_prefix/path.$(basename $SHELL).inc
    . $gcloud_prefix/completion.$(basename $SHELL).inc
    unset gcloud_prefix
fi

#---------------------------------------------------------------------------
if [[ -f ~/.bash/local/local-profile-init.bash ]] ; then
    . ~/.bash/local/local-profile-init.bash
fi

#---------------------------------------------------------------------------
# if running bash
if [[ -n $BASH ]]; then
    # include .bashrc if it exists
    if [[ -f ~/.bashrc ]]; then
        . ~/.bashrc
    fi
fi
