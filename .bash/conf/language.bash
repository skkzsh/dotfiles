### perlbrew (perlbrew env)
[ -d "$HOME/perl5/perlbrew" ] && . "$HOME/perl5/perlbrew/etc/bashrc"
[ -n "$PERLBREW_ROOT" ] && . "$PERLBREW_ROOT/etc/perlbrew-completion.bash"


### pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && . "$HOME/.pythonbrew/etc/bashrc"

### TODO: virtualenvwrapper
if which virtualenvwrapper.sh > /dev/null 2>&1 ; then
    # VIRTUALENVWRAPPER_PYTHON="$PATH_PYTHONBREW_CURRENT/python"
    # VIRTUALENVWRAPPER_VIRTUALENV="$PATH_PYTHONBREW_CURRENT/virtualenv"
    WORKON_HOME="$HOME/.virtualenvs"
    . "`which virtualenvwrapper.sh`"
fi


### rbenv (brew info rbenv)
## TODO: rbenvがない場合OSによってstdoutに出たりstderrに出たり違う?
which rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"

if [ -n "$BASH_VERSION" ]; then
    case "`uname`" in

        Linux)
            if [ -d "$HOME/.rbenv" ]; then
                . ~/.rbenv/completions/rbenv.bash
            fi
            ;;

        Darwin)
            if which brew > /dev/null ; then
                if [ -d  "`brew --prefix rbenv`" ]; then
                    . "`brew --prefix rbenv`/completions/rbenv.bash"
                fi
            fi
            ;;

        *) ;;
    esac
fi
