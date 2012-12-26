### bashだけの基本Setting

### Red Hat
case "`uname`" in
    Linux) [ -f /etc/bashrc ] && . /etc/bashrc ;;
    *) ;;
esac

### cdの補完はDirectoryのみ
complete -d cd
### cdでDirectory名を訂正
shopt -s cdspell
if [ "$BASH_VERSINFO" -ge 4 ]; then
    ### Directory名でcd
    shopt -s autocd
    ### Directory名を訂正
    shopt -s dirspell
fi


### 複数端末(例えばscreen)間でコマンド履歴(history)を共有
## .bash_historyに前コマンドを追記;
## 端末ローカルの履歴を消去;
## .bash_historyから履歴を再読込
PROMPT_COMMAND='history -a; history -c; history -r'
## .bash_history追記をOFF
shopt -u histappend

### ScreenのHardStatusの表示
## 実行したCommand
# PROMPT_COMMAND='echo -ne "\033k\033\\"'
# PROMPT_COMMAND='echo -ne "\033k\033\134"'
# PROMPT_COMMAND='echo -ne "\033]0;$(whoami)@$(hostname):$(pwd)\007"'
