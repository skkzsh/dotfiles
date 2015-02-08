# Plugins
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### percol
if which percol > /dev/null 2>&1 ; then

    ppgrep() {
        if [[ $1 == "" ]]; then
            PERCOL=percol
        else
            PERCOL="percol --query $1"
        fi
        ps aux | eval $PERCOL | awk '{print $2}'
    }

    ppkill() {
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
## brew info autojump
if which brew > /dev/null 2>&1 && [[ -d $(brew --prefix autojump) ]] ; then
    . $(brew --prefix)/etc/autojump.sh
elif [[ -f ~/.autojump/etc/profile.d/autojump.sh ]] ; then
    . ~/.autojump/etc/profile.d/autojump.sh
    # v20.9 on Windows
fi

#---------------------------------------------------------------------------
### z
# case "$(uname)" in
#     Linux)
#         ;;
#
#     Darwin)
#        ## brew info z.sh
#         if which brew > /dev/null ; then
#             if [[ -d $(brew --prefix z) ]]; then
#                 . $(brew --prefix)/etc/profile.d/z.sh
#                 if [[ -n $ZSH_NAME ]]; then
#                     precmd () {
#                     z --add "$(pwd -P)"
#                 }
#             fi
#         fi
#
#     fi
#     ;;
# *) ;;
# esac
