# bash, zshの共通基本conf
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### Ctrl-sによる画面出力停止を無効にして,
### historyの後方検索にする
which stty > /dev/null 2>&1 && stty stop undef

#---------------------------------------------------------------------------
## Ubuntu on Windows
case "$(uname -r)" in
    *Microsoft) umask 022 ;;
    *) ;;
esac

