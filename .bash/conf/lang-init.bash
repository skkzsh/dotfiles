# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### TODO: virtualenvwrapper
if which virtualenvwrapper.sh > /dev/null 2>&1 ; then
    # VIRTUALENVWRAPPER_PYTHON="$PATH_PYTHONBREW_CURRENT/python"
    # VIRTUALENVWRAPPER_VIRTUALENV="$PATH_PYTHONBREW_CURRENT/virtualenv"
    WORKON_HOME=~/.virtualenvs
    . "$(which virtualenvwrapper.sh)"
fi
