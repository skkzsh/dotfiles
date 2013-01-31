if [ -d ~/.zsh/conf ]; then
    . ~/.zsh/conf/prompt.zsh
    . ~/.zsh/conf/base.zsh
    . ~/.zsh/conf/plugin.zsh
    . ~/.zsh/conf/completion.zsh
fi

if [ -d ~/.bash/conf ]; then
    . ~/.bash/conf/language.bash
fi

if [ -d ~/.zsh/conf ]; then
    . ~/.zsh/conf/alias.zsh
    . ~/.zsh/conf/env.zsh

    . ~/.zsh/conf/function.zsh
fi

# TODO: completion -> language -> alias -> env ?
