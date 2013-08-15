# Plugins
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### percol
if which percol > /dev/null 2>&1 ; then

    function ppgrep() {
        if [[ $1 == "" ]]; then
            PERCOL=percol
        else
            PERCOL="percol --query $1"
        fi
        ps aux | eval $PERCOL | awk '{ print $2 }'
    }

    function ppkill() {
        if [[ $1 =~ "^-" ]]; then
            QUERY=""            # options only
        else
            QUERY=$1            # with a query
            [[ $# > 0 ]] && shift
        fi
        ppgrep $QUERY | xargs kill $*
    }

fi

#---------------------------------------------------------------------------
### autojump
## compinitより前に
case "$(uname)" in

    Linux | MINGW32* | CYGWIN*)
        if [[ -f ~/.autojump/etc/profile.d/autojump.sh ]]; then
            if [[ -n $ZSH_VERSION ]]; then
                . ~/.autojump/etc/profile.d/autojump.zsh
            elif [[ -n $BASH_VERSION ]]; then
                . ~/.autojump/etc/profile.d/autojump.bash
            fi
        fi
        ;;

    Darwin)
        if which brew > /dev/null ; then
            ## brew info autojump
            if [[ -d "$(brew --prefix autojump)" ]]; then
                if [[ -n "$ZSH_VERSION" ]]; then
                    . "$(brew --prefix)/etc/autojump.zsh"
                elif [[ -n "$BASH_VERSION" ]]; then
                    . "$(brew --prefix)/etc/autojump.bash"
                fi
            fi
        fi
        ;;

    *) ;;
esac

#---------------------------------------------------------------------------
### z
# case "$(uname)" in
#     Linux)
#         ;;
#
#     Darwin)
#        ## brew info z.sh
#         if which brew > /dev/null ; then
#             if [[ -d "$(brew --prefix z)" ]]; then
#                 . $(brew --prefix)/etc/profile.d/z.sh
#                 if [[ -n "$ZSH_VERSION" ]]; then
#                     function precmd () {
#                     z --add "$(pwd -P)"
#                 }
#             fi
#         fi
#
#     fi
#     ;;
# *) ;;
# esac
