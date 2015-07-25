# bash, zshの共通基本Settings
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
### Ctrl-sによる画面出力停止を無効にして,
### historyの後方検索にする
which stty > /dev/null 2>&1 && stty stop undef

