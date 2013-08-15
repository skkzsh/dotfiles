### Functions

#---------------------------------------------------------------------------
### Bash
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/function.bash
fi

#---------------------------------------------------------------------------
### ScreenのHardStatusの表示
case "$TERM" in
    screen)
        TERM=xterm-256color # screen上でもpercolの色を同じにする
        ## 実行中のCommand
        preexec() {
            echo -ne "\ek#${1%% *}\e\\"
        }
        ## Current Directory
        precmd() {
            echo -ne "\ek$(basename $(pwd))$\e\\"
        }
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
