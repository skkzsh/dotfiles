# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### env
for ext in pl py rb php; do # nd
    which ${ext}env > /dev/null 2>&1 && eval "$(${ext}env init -)"
done
unset ext

### TODO: virtualenvwrapper
if which virtualenvwrapper.sh > /dev/null 2>&1 ; then
    # VIRTUALENVWRAPPER_PYTHON="$PATH_PYTHONBREW_CURRENT/python"
    # VIRTUALENVWRAPPER_VIRTUALENV="$PATH_PYTHONBREW_CURRENT/virtualenv"
    WORKON_HOME=~/.virtualenvs
    . "$(which virtualenvwrapper.sh)"
fi
