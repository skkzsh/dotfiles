### Plugins

[ -f ~/.bash/conf/plugin.bash ] && . ~/.bash/conf/plugin.bash

if [ -d ~/.zsh/plugin ]; then
    ## zaw
    . ~/.zsh/plugin/zaw/zaw.zsh
    bindkey '^xh' zaw-history
    zstyle ':filter-select' case-insensitive yes # 大文字・小文字の区別はしない
    bindkey '^x:' zaw-cdr

    ## auto-fu
    # . ~/.zsh/plugin/auto-fu.zsh/auto-fu.zsh
    # function zle-line-init () {
    #     auto-fu-init
    # }
    # zle -N zle-line-init

    ## syntax-highlighting
    # . ~/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


### percol
if which percol > /dev/null 2>&1; then
    if [ -x "`which gtac 2> /dev/null`" -o -x "`which tac 2> /dev/null`" ]; then

        function percol_select_history() {
            local tac
            if which gtac > /dev/null 2>&1 ; then
                tac=gtac
            else
                tac=tac
            fi
            BUFFER=$($tac $HISTFILE | sed 's/^: [0-9]*:[0-9]*;//' | percol --query "$LBUFFER")
            CURSOR=$#BUFFER         # move cursor
            zle -R -c               # refresh
        }
        zle -N percol_select_history
        bindkey '^[r' percol_select_history
    fi
fi
