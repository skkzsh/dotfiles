if [[ -d ~/.bash/conf ]] ; then
    # bash only
    . ~/.bash/conf/base-only.bash
    . ~/.bash/conf/ubuntu.bash
    . ~/.bash/conf/completion.bash

    # bash & zsh
    . ~/.bash/conf/base-share.bash

    . ~/.bash/conf/language.bash

    . ~/.bash/conf/alias.bash
    . ~/.bash/conf/env.bash

    . ~/.bash/conf/function.bash
    . ~/.bash/conf/plugin.bash

    # bash only
    . ~/.bash/conf/prompt.bash
fi

if [[ -d ~/.bash/local ]] ; then
    . ~/.bash/local/local.bash
fi

# XXX: language -> alias -> env ?
