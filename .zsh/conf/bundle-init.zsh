if [[ -d ~/.zsh/bundle/antigen ]]; then
    . ~/.zsh/bundle/antigen/antigen.zsh

    if [[ $(uname) != SunOS ]] ; then
        # antigen use oh-my-zsh
        # antigen bundle autojump
        # antigen bundle rbenv
        # antigen bundle pyenv

        antigen bundle zsh-users/zsh-completions src

        if [[ $OSTYPE != msys ]] ; then
            ## TODO: sub command
            # if is-at-least 4.3.9 ; then
            antigen bundle zsh-users/zsh-syntax-highlighting
            # fi

            antigen bundle zsh-users/zaw
        fi

        # antigen bundle hchbaw/auto-fu.zsh
        # function zle-line-init () {
        #     auto-fu-init
        # }
        # zle -N zle-line-init

        # antigen bundle grml/zsh-lovers

        antigen apply
    fi
fi
