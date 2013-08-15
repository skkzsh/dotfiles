# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### plenv
which plenv > /dev/null 2>&1 && eval "$(plenv init -)"

### perlbrew (perlbrew env)
# [[ -d ~/perl5/perlbrew ]] && . ~/perl5/perlbrew/etc/bashrc

#---------------------------------------------------------------------------
### pyenv
which pyenv > /dev/null 2>&1 && eval "$(pyenv init -)"

### pythonbrew
# [[ -d ~/.pythonbrew ]] && . ~/.pythonbrew/etc/bashrc

### TODO: virtualenvwrapper
if which virtualenvwrapper.sh > /dev/null 2>&1 ; then
    # VIRTUALENVWRAPPER_PYTHON="$PATH_PYTHONBREW_CURRENT/python"
    # VIRTUALENVWRAPPER_VIRTUALENV="$PATH_PYTHONBREW_CURRENT/virtualenv"
    WORKON_HOME=~/.virtualenvs
    . "$(which virtualenvwrapper.sh)"
fi

#---------------------------------------------------------------------------
### rbenv (brew info rbenv)
which rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"

#---------------------------------------------------------------------------
### ndenv
# which ndenv > /dev/null 2>&1 && eval "$(ndenv init -)"

#---------------------------------------------------------------------------
### anyenv
# which anyenv > /dev/null 2>&1 && eval "$(anyenv init -)"
