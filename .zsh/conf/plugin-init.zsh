### Plugins

#---------------------------------------------------------------------------
## Bash
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/plugin-init.bash
fi

#---------------------------------------------------------------------------
### peco
if which peco > /dev/null 2>&1 ; then

    function peco_select_history_z() {
        BUFFER=$(history -nr 1 | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
        # zle clear-screen
        # zle redisplay
    }
    zle -N peco_select_history_z
    bindkey '^[r' peco_select_history_z

    # Git
    alias -g GF='$(peco_git_modified_files)'

fi

#---------------------------------------------------------------------------
### percol
if which percol > /dev/null 2>&1 ; then
    function percol_select_history() {
        BUFFER=$(history -nr 1 | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    # zle -N percol_select_history
    # bindkey '^[r' percol_select_history
fi

#---------------------------------------------------------------------------
if [[ $OSTYPE = msys ]] ; then

    # if is-at-least 4.3.9 ; then
    #     if [[ -d ~/.zsh/bundle/zsh-syntax-highlighting ]] ; then
    #         . ~/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    #     fi
    # fi

    if [[ -d ~/.zsh/bundle/zaw ]] ; then
        . ~/.zsh/bundle/zaw/zaw.zsh
    fi

    # if [[ -d ~/.zsh/bundle/auto-fu.zsh]] ; then
    #     . ~/.zsh/bundle/auto-fu.zsh/auto-fu.zsh
    #     function zle-line-init () {
    #         auto-fu-init
    #     }
    #     zle -N zle-line-init
    # fi

fi

#---------------------------------------------------------------------------
if which zaw > /dev/null 2>&1 ; then
    zstyle ':filter-select' case-insensitive yes # 大文字・小文字の区別はしない

    bindkey '^xh' zaw-history

    if which cdr > /dev/null 2>&1  ; then
        bindkey '^@' zaw-cdr
    fi
fi

