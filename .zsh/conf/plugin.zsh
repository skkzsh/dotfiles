### Plugins

[ -f ~/.bash/conf/plugin.bash ] && . ~/.bash/conf/plugin.bash

## zaw
if [ -d ~/.zsh/public_repos/zaw ]; then
    . ~/.zsh/public_repos/zaw/zaw.zsh
    bindkey '^xh' zaw-history
    zstyle ':filter-select' case-insensitive yes # 大文字・小文字の区別はしない
    bindkey '^x:' zaw-cdr
fi

## auto-fu
# if [ -d ~/.zsh/public_repos/auto-fu.zsh]; then
#     . ~/.zsh/public_repos/auto-fu.zsh/auto-fu.zsh
#     function zle-line-init () {
#         auto-fu-init
#     }
#     zle -N zle-line-init
# fi

## syntax-highlighting
if is-at-least 4.3.9 ; then
    if [ -d ~/.zsh/public_repos/zsh-syntax-highlighting ]; then
        . ~/.zsh/public_repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi
fi


### percol
if (which percol && (which tac || which gtac)) > /dev/null 2>&1; then
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
