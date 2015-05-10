### Plugins

#---------------------------------------------------------------------------
## Bash
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/plugin-init.bash
fi

#---------------------------------------------------------------------------
### peco
if which peco > /dev/null 2>&1 ; then

    if (which tac || which gtac) > /dev/null 2>&1 ; then
        function peco_select_history_z() {
            local tac
            if which gtac > /dev/null 2>&1 ; then
                tac=gtac
            else
                tac=tac
            fi
            BUFFER=$(history -n 1 | eval $tac | peco --query "$LBUFFER")
            CURSOR=$#BUFFER         # move cursor
            zle -R -c               # refresh
            # zle clear-screen
            # zle redisplay
        }
        zle -N peco_select_history_z
        bindkey '^[r' peco_select_history_z
    fi

    # Git
    # function peco_git_add_z {
    # }
    # function peco_git_modified_file_z {
    # }

    # alias -g peco_git_modified_file_z

fi

#---------------------------------------------------------------------------
### percol
# if which percol > /dev/null 2>&1 ; then
#     if (which tac || which gtac) > /dev/null 2>&1 ; then
#         function percol_select_history() {
#             local tac
#             if which gtac > /dev/null 2>&1 ; then
#                 tac=gtac
#             else
#                 tac=tac
#             fi
#             BUFFER=$(history -n 1 | eval $tac | percol --query "$LBUFFER")
#             CURSOR=$#BUFFER         # move cursor
#             zle -R -c               # refresh
#         }
#         zle -N percol_select_history
#         bindkey '^[r' percol_select_history
#     fi
# fi

#---------------------------------------------------------------------------
## auto-fu
# if [[ -d ~/.zsh/bundle/auto-fu.zsh]] ; then
#     . ~/.zsh/bundle/auto-fu.zsh/auto-fu.zsh
#     function zle-line-init () {
#         auto-fu-init
#     }
#     zle -N zle-line-init
# fi

#---------------------------------------------------------------------------
## zaw
# if [[ -d ~/.zsh/bundle/zaw ]] ; then
#     . ~/.zsh/bundle/zaw/zaw.zsh
#     bindkey '^xh' zaw-history
#     zstyle ':filter-select' case-insensitive yes # 大文字・小文字の区別はしない
#     bindkey '^x:' zaw-cdr
# fi

#---------------------------------------------------------------------------
## syntax-highlighting
## TODO: sub command
# if is-at-least 4.3.9 ; then
#     if [[ -d ~/.zsh/bundle/zsh-syntax-highlighting ]] ; then
#         . ~/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#     fi
# fi
