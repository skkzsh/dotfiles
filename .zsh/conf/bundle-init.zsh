if [[ -d ~/.zsh/bundle/antigen ]]; then
    . ~/.zsh/bundle/antigen/antigen.zsh

    # antigen use oh-my-zsh
    # antigen bundle autojump
    # antigen bundle rbenv
    # antigen bundle pyenv

    ## TODO: sub command
    if is-at-least 4.3.9 ; then
        antigen bundle zsh-users/zsh-syntax-highlighting
    fi

    antigen bundle zsh-users/zsh-completions src

    antigen bundle zsh-users/zaw
    bindkey '^xh' zaw-history
    zstyle ':filter-select' case-insensitive yes # 大文字・小文字の区別はしない
    bindkey '^x:' zaw-cdr

    # antigen bundle hchbaw/auto-fu.zsh
    # function zle-line-init () {
    #     auto-fu-init
    # }
    # zle -N zle-line-init

    # antigen bundle grml/zsh-lovers

    antigen apply
fi
