### Functions

#---------------------------------------------------------------------------
### Bash
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/function-init.bash
fi

#---------------------------------------------------------------------------
### ScreenのHardStatusの表示
case $TERM in
    screen)
        # TERM=xterm-256color # screen上でもpercolの色を同じにする

        # add-zsh-hook

        if [[ -z $TMUX ]] ; then
            ## Current Directory
            precmd() {
                echo -ne "\ek${PWD:t}$\e\\"
            }

            # chpwd

            ## 実行中のCommand
            preexec() {
                echo -ne "\ek#${1%% *}\e\\"
            }
        fi

        ;;

    *) ;;
esac

#---------------------------------------------------------------------------
## ^でcd ..
# function cdup() {
#     echo
#     cd ..
#     zle reset-prompt
# }
# zle -N cdup
# bindkey '\^' cdup
