# echo hello zshrc # Debug

# zmodload zsh/zprof && zprof

if [[ -d ~/.zsh/conf ]] ; then

    . ~/.zsh/conf/prompt-init.zsh
    . ~/.zsh/conf/base-init.zsh

    . ~/.zsh/conf/zplug-init.zsh
    . ~/.zsh/conf/completion-init.zsh
    # . ~/.zsh/conf/bundle-init.zsh
    . ~/.zsh/conf/plugin-init.zsh

    . ~/.zsh/conf/lang-init.zsh

    . ~/.zsh/conf/alias-init.zsh
    . ~/.zsh/conf/env-init.zsh

    . ~/.zsh/conf/function-init.zsh
fi

if [[ -d ~/.bash/local/local-init.bash ]] ; then
    . ~/.bash/local/local-init.bash
fi

# if which zprof > /dev/null 2>&1; then
#     zprof | less
# fi

# XXX: completion -> language -> alias -> env ?
