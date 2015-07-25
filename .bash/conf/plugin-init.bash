# Plugins
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### peco
if which peco > /dev/null 2>&1 ; then

    function peco_lscd() {
        local dir="$(find . -maxdepth 1 -type d | sed 's;\./;;' | peco)"
        [[ -n $dir ]] && cd "$dir"
    }
    # bind -x '"\C-x\C-f": peco_lscd'

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

    function peco_git_modified_files {
        git status --short | peco | awk '{print $NF}'
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
                READLINE_LINE=$($tac "$HISTFILE" | peco --query "$READLINE_LINE")
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

#---------------------------------------------------------------------------
# keychain ~/.ssh/id_rsa
[[ -f ~/.keychain/$(hostname)-sh ]] && . ~/.keychain/$(hostname)-sh

#---------------------------------------------------------------------------
### Fortune
### HostによってFileを変更
# if which fortune > /dev/null 2>&1 ; then
#
#     # literature, ubuntu-server-tips-ja, debian-hints, libfortune-perl
#     case $(hostname) in
#         sing*)     fortune_file=literature            ;;
#         *ubuntu*)  fortune_file=ubuntu-server-tips-ja ;;
#         *)         fortunefile=                       ;;
#     esac
#
#     echo
#     echo "********************************************************************************"
#     fortune $fortune_file
#     echo "********************************************************************************"
#     echo
#
# fi
