# Completions

#---------------------------------------------------------------------------
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
## bash_completionによってTilde展開されてしまう (Read bash_completion)

### XXX
## brew info bash-completion
if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix bash-completion) ]] ; then
    . $(brew --prefix)/etc/bash_completion
elif ! shopt -oq posix ; then
    if [[ -f /usr/share/bash-completion/bash_completion ]] ; then
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]] ; then
        . /etc/bash_completion
    # elif [[ -f ~/.bash_completion ]] ; then
    #     ## Local
    #     [[ -n $BASH_COMPLETION ]]            || BASH_COMPLETION=~/.bash_completion
    #     [[ -n $BASH_COMPLETION_DIR ]]        || BASH_COMPLETION_DIR=~/.bash_completion.d
    #     [[ -n $BASH_COMPLETION_COMPAT_DIR ]] || BASH_COMPLETION_COMPAT_DIR=~/.bash_completion.d
    #     . ~/.bash_completion
    fi
fi

### XXX
## env
for ext in pl py rb nd go ; do # php
    if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix ${ext}env) ]]; then
        . $(brew --prefix ${ext}env)/completions/${ext}env.bash
    elif [[ -d ~/.${ext}env/completions ]] ; then
        . ~/.${ext}env/completions/${ext}env.bash
    fi
done
unset ext

case $(uname) in

    Linux)
        if ! (which brew > /dev/null 2>&1 && [[ -d $(brew --prefix nodebrew) ]]) && [[ -d ~/.nodebrew ]] ; then
            . ~/.nodebrew/completions/bash/nodebrew-completion
        fi
        # if [[ -f ~/.git-completion.bash ]] ; then
        #     . ~/.git-completion.bash
        # fi
        ## Gem
        ;;

    # MINGW32*)
    #     ## Git
    #     # %PROGRAMFILES%\Git\etc\git-completion.bash
    #     programfiles=$(cygpath $PROGRAMFILES)
    #     if [[ -d $programfiles/Git ]] ; then
    #         . "$programfiles/Git/etc/git-completion.bash"
    #     fi
    #     unset programfiles
    #     ;;

    *) ;;
esac

#---------------------------------------------------------------------------
if [[ -f /etc/issue ]]; then
    case "$(cat /etc/issue)" in

        Arch*)
            if [[ -d /usr/lib/rbenv/completions ]] ; then
                . /usr/lib/rbenv/completions/rbenv.bash
            fi
            ;;

        *)  ;;
    esac
fi

#---------------------------------------------------------------------------
## perl
# which setup-bash-complete > /dev/null 2>&1 && . setup-bash-complete

#---------------------------------------------------------------------------
## pip
which pip > /dev/null 2>&1 && eval "$(pip completion --bash)"

#---------------------------------------------------------------------------
## npm
case $(uname) in
    Darwin | Linux | SunOS)
        which npm > /dev/null 2>&1 && eval "$(npm completion)"
        ;;
    *)
        ;;
esac

#---------------------------------------------------------------------------
if which kubectl > /dev/null 2>&1 ; then
    . <( kubectl completion bash )
fi
if which helm > /dev/null 2>&1 ; then
    . <( helm completion bash )
fi

#---------------------------------------------------------------------------
## AWS
which aws > /dev/null 2>&1 && complete -C aws_completer aws

