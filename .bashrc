# echo hello bashrc

if [[ -d ~/.bash/conf ]] ; then
    # bash only
    . ~/.bash/conf/base-only-init.bash
    . ~/.bash/conf/completion-init.bash

    # bash & zsh
    . ~/.bash/conf/base-share-init.bash

    . ~/.bash/conf/lang-init.bash

    . ~/.bash/conf/alias-init.bash
    . ~/.bash/conf/env-init.bash

    . ~/.bash/conf/function-init.bash
    . ~/.bash/conf/plugin-init.bash

    # bash only
    . ~/.bash/conf/prompt-init.bash
fi

if [[ -d ~/.bash/local ]] ; then
    . ~/.bash/local/local-init.bash
fi

# XXX: language -> alias -> env ?
