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
        ;;

    Darwin)
        if which brew > /dev/null ; then
            ## brew info bash-completion
            if [ -f "`brew --prefix`/etc/bash_completion" ]; then
                . "`brew --prefix`/etc/bash_completion"
            fi
        fi
        ;;

    *) ;;
esac
