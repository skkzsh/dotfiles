# Environment Variables

#---------------------------------------------------------------------------
## Bash
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/env-init.bash
fi

#---------------------------------------------------------------------------
## History
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

#---------------------------------------------------------------------------
zle_highlight=(isearch:bold)
