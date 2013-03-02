#---------------------------------------------------------------------------
## Bash
if [ -d ~/.bash/conf ] ; then
    . ~/.bash/conf/env.bash
fi

#---------------------------------------------------------------------------
## History
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
