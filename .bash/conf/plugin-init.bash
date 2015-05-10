# Plugins
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### peco
if which peco > /dev/null 2>&1 ; then

    function peco_lscd() {
        local dir="$(find . -maxdepth 1 -type d | sed 's;\./;;' | peco)"
        [[ -n $dir ]] && cd "$dir"
    }
    # bind -x '"\C-x\C-f": peco_find'

    function peco_pgrep() {
        if [[ $1 == "" ]] ; then
            PECO=peco
        else
            PECO="peco --query $1"
        fi
        ps aux | eval $PECO | awk '{print $2}'
    }

    function peco_pkill() {
        if [[ $1 =~ "^-" ]] ; then
            QUERY=""            # options only
        else
            QUERY=$1            # with a query
            [[ $# > 0 ]] && shift
        fi
        peco_pgrep $QUERY | xargs kill $*
    }

    if [[ -n $BASH ]]; then

        if (which tac || which gtac) > /dev/null 2>&1 ; then
            function peco_select_history_b() {
                local tac
                if which gtac > /dev/null 2>&1 ; then
                    tac=gtac
                else
                    tac=tac
                fi
                READLINE_LINE=$(cat ~/.bash_history | eval $tac | peco --query "$READLINE_LINE")
                READLINE_POINT=$#READLINE_LINE
            }
            bind -x '"\C-[r": peco_select_history_b'
        fi

        # Git
        # function peco_git_add_b {
        # }
        # function peco_git_modified_file_b {
        # }
        # bind -x '"\C-x\C-f": peco_git_modified_file_b'

    fi

fi

#---------------------------------------------------------------------------
### percol
# if which percol > /dev/null 2>&1 ; then
#
#     function percol_pgrep() {
#         if [[ $1 == "" ]] ; then
#             PERCOL=percol
#         else
#             PERCOL="percol --query $1"
#         fi
#         ps aux | eval $PERCOL | awk '{print $2}'
#     }
#
#     function percol_pkill() {
#         if [[ $1 =~ "^-" ]] ; then
#             QUERY=""            # options only
#         else
#             QUERY=$1            # with a query
#             [[ $# > 0 ]] && shift
#         fi
#         percol_pgrep $QUERY | xargs kill $*
#     }
#
# fi

#---------------------------------------------------------------------------
### autojump
## compinitより前に
## brew info autojump
if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix autojump) ]] ; then
    . $(brew --prefix)/etc/autojump.sh
elif [[ -f ~/.autojump/etc/profile.d/autojump.sh ]] ; then
    . ~/.autojump/etc/profile.d/autojump.sh
fi

#---------------------------------------------------------------------------
### z
## brew info z.sh
if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix z) ]] ; then
    # _Z_CMD=j
    . $(brew --prefix)/etc/profile.d/z.sh
fi
