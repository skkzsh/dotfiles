# bash, zshの共通基本Setting


### Ctrl-sによる画面出力停止を無効にして,
### historyの後方検索にする
which stty > /dev/null 2>&1 && stty stop undef

case "`uname`" in
    MINGW32*)
        case "$TERM" in
            dumb) TERM=xterm ;;
            # Console2でMinGW
            *) ;;
        esac
        ;;
    *) ;;
esac

### LS_COLORS
### FIXME: dircolorsはxtermでないと出力されない?
### TODO: Macでcoreutilsを使う場合を考慮, gdircolors
if which dircolors > /dev/null 2>&1 ; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

## SSH Agent
# eval `ssh-agent`
# ssh-agent $SHELL
# exec ssh-agent $SHELL
# ssh-add

## TODO: screenでもssh-agent
## 大丈夫か?
# ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
# export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
if [ -S ~/.ssh/ssh_auth_sock ]; then
    # echo '1!'
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
elif [ ! -S "$SSH_AUTH_SOCK" ]; then
    # echo '2!'
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
elif [ ! -L "$SSH_AUTH_SOCK" ]; then
    # echo '3!'
    ln -snf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock &&
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi


### Fortune
### HostによってFileを変更
# if which fortune > /dev/null 2>&1 ; then
#
#     # literature, ubuntu-server-tips-ja, debian-hints, libfortune-perl
#     case "$host" in
#         sing*)   fortune_file=literature            ;;
#         box*)    fortune_file=ubuntu-server-tips-ja ;;
#         ride*)   fortune_file=debian-hints          ;;
#         debian*) fortune_file=debian-hints          ;;
#         *)       fortunefile=                       ;;
#     esac
#
#     echo
#     echo "********************************************************************************"
#     fortune $fortune_file
#     echo "********************************************************************************"
#     echo
#
# fi
