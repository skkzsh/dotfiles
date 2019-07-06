# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
## Groovy
# if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix groovy) ]]; then
#     export GROOVY_HOME=$(brew --prefix groovy)/libexec
# fi

#---------------------------------------------------------------------------
### TODO: virtualenvwrapper
if which virtualenvwrapper.sh > /dev/null 2>&1 ; then
    # VIRTUALENVWRAPPER_PYTHON="$PATH_PYTHONBREW_CURRENT/python"
    # VIRTUALENVWRAPPER_VIRTUALENV="$PATH_PYTHONBREW_CURRENT/virtualenv"
    WORKON_HOME=~/.virtualenvs
    . "$(which virtualenvwrapper.sh)"
fi

# FIXME : nodist
# case $OSTYPE in
#     msys) . $NODE_PREFIX/bin/nodist_bash_profile_content.sh ;;
#     *)    ;;
# esac
