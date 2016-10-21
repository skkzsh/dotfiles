if [[ -d ~/.zsh/bundle/zplug ]]; then
    . ~/.zsh/bundle/zplug/init.zsh

    if [[ $(uname) != SunOS ]] ; then
        zplug zsh-users/zsh-completions
        zplug zsh-users/zsh-syntax-highlighting, nice:10

        if [[ $OSTYPE != msys ]] ; then
            zplug zsh-users/zaw
        fi

        # Install plugins if there are plugins that have not been installed
        zplug check || zplug install
        # if ! zplug check --verbose; then
        #     printf "Install? [y/N]: "
        #     if read -q; then
        #         echo; zplug install
        #     fi
        # fi

        # Then, source plugins and add commands to $PATH
        zplug load
    fi
fi
