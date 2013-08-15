if [[ -d ~/.zsh/conf ]] ; then
    . ~/.zsh/conf/prompt.zsh
    . ~/.zsh/conf/base.zsh
    . ~/.zsh/conf/plugin.zsh
    . ~/.zsh/conf/completion.zsh

    . ~/.zsh/conf/language.zsh

    . ~/.zsh/conf/alias.zsh
    . ~/.zsh/conf/env.zsh

    . ~/.zsh/conf/function.zsh
fi

if [[ -d ~/.bash/local ]] ; then
    . ~/.bash/local/local.bash
fi

# XXX: completion -> language -> alias -> env ?
