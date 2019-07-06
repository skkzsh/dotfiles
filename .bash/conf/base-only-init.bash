### bashだけの基本conf

### Ubuntu
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#---------------------------------------------------------------------------
# If not running interactively, don't do anything
[[ -z $PS1 ]] && return

#---------------------------------------------------------------------------
### Red Hat
case $(uname) in
    Linux)
        if [[ -f /etc/bashrc ]] ; then
            . /etc/bashrc
        fi
        ;;
    *)  ;;
esac

#---------------------------------------------------------------------------
### cdの補完はDirectoryのみ
complete -d cd
### cd時にDirectory名を訂正
shopt -s cdspell
if [[ $BASH_VERSINFO -ge 4 ]]; then
    ### Directory名でcd
    shopt -s autocd
    ### 補完時にDirectory名を訂正
    shopt -s dirspell
    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    shopt -s globstar
    # extended glob
    shopt -s extglob
fi

#---------------------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#---------------------------------------------------------------------------
### History

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
# HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE

### 複数端末(例えばscreen)間でコマンド履歴(history)を共有
## .bash_historyに前コマンドを追記;
## 端末ローカルの履歴を消去;
## .bash_historyから履歴を再読込
## FIXME: autojump
PROMPT_COMMAND='history -a; history -c; history -r'
## .bash_history追記をOFF
shopt -u histappend

# append to the history file, don't overwrite it
#shopt -s histappend

#---------------------------------------------------------------------------
### ScreenのHardStatusの表示
## 実行したCommand
# PROMPT_COMMAND='echo -ne "\ek\e\\"'
# PROMPT_COMMAND="echo -ne "\e]0;@$HOSTNAME:$PWD""
