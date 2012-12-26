# bash, zshの共通基本Setting


### Ctrl-sによる画面出力停止を無効にして,
### historyの後方検索にする
stty stop undef

### LS_COLORS
if which dircolors > /dev/null 2>&1 ; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

### Fortune
### HostによってFileを変更
# if which fortune > /dev/null 2>&1 ; then
#
#     # literature, ubuntu-server-tips-ja, debian-hints, libfortune-perl
#     case "$host" in
#         sing*)   fortune_file=literature            ;;
#         drive*)  fortune_file=ubuntu-server-tips-ja ;;
#         leap*)   fortune_file=ubuntu-server-tips-ja ;;
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
