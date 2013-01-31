# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
## bash_completionによってTilde展開されてしまう (Read bash_completion)
case "`uname`" in

    Linux)
        if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
            . /etc/bash_completion
        elif [ -f ~/.bash_completion ] && ! shopt -oq posix; then
            ## Local
            [ -n "$BASH_COMPLETION" ]            || BASH_COMPLETION=~/.bash_completion
            [ -n "$BASH_COMPLETION_DIR" ]        || BASH_COMPLETION_DIR=~/.bash_completion.d
            [ -n "$BASH_COMPLETION_COMPAT_DIR" ] || BASH_COMPLETION_COMPAT_DIR=~/.bash_completion.d
            . ~/.bash_completion
        fi
        ## Git
        [ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
        ## rbenv
        [ -d ~/.rbenv ] && . ~/.rbenv/completions/rbenv.bash
        ## Gem
        ;;

    Darwin)
        if which brew > /dev/null ; then
            ## brew info bash-completion
            if [ -d "`brew --prefix bash-completion`" ]; then
                . "`brew --prefix`/etc/bash_completion"
            fi
            if [ -d  "`brew --prefix rbenv`" ]; then
                . "`brew --prefix rbenv`/completions/rbenv.bash"
            fi
        fi
        ;;

    MINGW32*)
        ## Git
        # %PROGRAMFILES%\Git\etc\git-completion.bash
        programfiles="$(echo $PROGRAMFILES | perl -pe "s%C:\\\%/c/%")"
        if [ -f "$programfiles/Git/etc/git-completion.bash" ] ; then
            . "$programfiles/Git/etc/git-completion.bash"
        fi
        unset programfiles
        ;;

    *) ;;
esac

## perl
# which setup-bash-complete > /dev/null 2>&1 && . setup-bash-complete
## perlbrew
[ -n "$PERLBREW_ROOT" ] && . "$PERLBREW_ROOT/etc/perlbrew-completion.bash"

## TODO: pythonbrew

## pip
which pip > /dev/null 2>&1 && eval "$(pip completion --bash)"

## nodebrew
if [ -d ~/.bash/public_repos/nodebrew ] ; then
    . ~/.bash/public_repos/nodebrew/completions/bash/nodebrew-completion
fi

## npm
case "`uname`" in
    Linux | Darwin)
        which npm > /dev/null 2>&1 && eval "$(npm completion)"
        ;;
    *)
        ;;
esac
