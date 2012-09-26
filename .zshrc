### Set up the prompt

## Prompt の 組込Theme
## 組込Themeを使うための初期化
autoload -Uz promptinit
promptinit
## 組込Theme
# prompt adam1 plain ${col} ${col}
# prompt suse
# prompt redhat

## Sample
## Default
# PROMPT='%m%# '
## suse
# PROMPT='%n@%m:%~/ > '
## redhat
# [%n@%m %1~]%(#.#.$)
# suse redhat
# PROMPT2='> '
## Default
# PROMPT3='?# '
# PROMPT4='+%N:%i> '
# SPROMPT='zsh: correct '%R' to '%r' [nyae]? '

### HostによってPromptの色を変更
## Method 1
## bashrcを参考
# case "$HOST" in
#     sing*)   col=32 ;;
#     leap*)   col=36 ;;
#     drive*)  col=31 ;;
#     box*)    col=35 ;;
#     ride*)   col=33 ;;
#     debian*) col=   ;;
#     *)       col=   ;;
# esac
# col_begin=%{[${col}m%}
# col_end=%{[m%}

## Method 2
#0:black, 1:red, 2:green, 3:yellow,
#4:blue, 5:magenta, 6:cyan, 7:white
case "$HOST" in
    sing*)             col=green   ;;
    leap*)             col=cyan    ;;
    drive*)            col=red     ;;
    box*)              col=magenta ;;
    ride*)             col=yellow  ;;
    debian*)           col=        ;;
    *PC)               col=        ;;
    h24?)              col=        ;;
    xe-000? | ap-000?) col=        ;;
    *)       col=        ;;
esac
autoload colors
colors
col_begin=%{${fg[${col}]}%}
col_end=%{${reset_color}%}

## suse Base
PROMPT="${col_begin}%m${col_end}:%~ > "
# PROMPT="${col_begin}%n${col_end}@${col_begin}%m${col_end}:%~ > "
## PROMPT='%n@%m:%~ > ' # Default
PROMPT2='> '
PROMPT3='?# '
PROMPT4='+%N:%i> '
SPROMPT='zsh: correct '%R' to '%r' [nyae]? '
# RPROMPT=

### Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

### Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

fpath=(~/.autojump/functions ~/.zsh/functions/Completion ~/.zsh/site-functions $fpath)
## fpathはcompinitの前に定義
## Linux
## ln -s ~/.rbenv/completions/rbenv.zsh ~/.zsh/site-functions/_rbenv
## Mac
## ln -s /usr/local/Library/Contributions/brew_zsh_completion.zsh ~/.zsh/site-functions/_brew
## ln -s `brew --prefix rbenv`/completions/rbenv.zsh ~/.zsh/site-functions/_rbenv

### Use modern completion system
autoload -Uz compinit
## -uはPermission Error回避
compinit -u

###
zstyle ':completion:*' auto-description 'specify: %d'
### 補完を指定した順番に実行
# zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' completer _oldlist _expand _complete _match _history _ignored _correct _approximate _prefix
### 補完候補のGroup化
zstyle ':completion:*' format '%B[Completing %d]%b'
zstyle ':completion:*' group-name ''
### 補完候補のMenu化
# zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' menu select=1
### enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi
### 補完候補に色を付ける
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
    zstyle ':completion:*:default' list-colors ''
fi
###
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
### 補完候補がなければ曖昧に候補
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
###
zstyle ':completion:*' menu select=long
###
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
###
zstyle ':completion:*' use-compctl false
### 詳細な情報
zstyle ':completion:*' verbose true
###
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#####
### Key Bind
bindkey '^[p' history-beginning-search-backward
bindkey '^[n' history-beginning-search-forward
## ^s, ^qを無効
# setopt no_flow_control
### History
## 同じコマンドラインを連続で実行した場合はHistoryに登録しない
setopt hist_ignore_dups
## zshプロセス間でHistoryを共有
setopt share_history
## 実行時刻も保存
# setopt extended_history
## すぐにHistoryに追記
# setopt inc_append_histor
## プロセス指定ではメニュー選択
#zstyle ':completion:*:processes' menu yes select=2
## Directory名でcd
setopt auto_cd
## cdの履歴
setopt auto_pushd pushd_ignore_dups
## Commandを自動訂正
setopt correct
##
# setopt correct_all
# 補完候補を詰めて表示
# setopt list_packed
## Alias展開前もチェックして補完
# setopt complete_aliases

## Beep音を消す
setopt no_beep
## 補完候補一覧でファイルの種別をマーク表示
# setopt list_types
## TAB で順に補完候補を切り替える
# setopt auto_menu
## 補完候補を一覧表示
# setopt auto_list
##
# setopt notify
## 補完時にHistoryを自動的に展開
# setopt hist_expand
## --prefix=等でも=の後を展開
# setopt magic_equal_subst
## 先方検索
# autoload predict-on
# predict-on
## 重複したPATHを登録しない
# typeset -U path

## カーソル位置で補完
# setopt complete_in_word
## globを展開しないで候補の一覧から補完
#setopt glob_complete
##
# setopt extended_glob


## env
[ -f ~/.bash_env ] && . ~/.bash_env


## Alias
[ -f ~/.zsh_aliases ] && . ~/.zsh_aliases


### Plugin
if [ -d ~/.zsh/plugin ]; then

    ## zaw
    . ~/.zsh/plugin/zaw/zaw.zsh
    # bindkey '^xh' zaw-history

    ## auto-fu
    # . ~/.zsh/plugin/auto-fu.zsh/auto-fu.zsh
    # function zle-line-init () {
    #     auto-fu-init
    # }
    # zle -N zle-line-init

fi

### percol
if which percol > /dev/null ; then
    if [ -x "`which gtac 2> /dev/null`" -o -x "`which tac 2> /dev/null`" ]; then

        function percol_select_history() {
            local tac
            if which gtac > /dev/null 2>&1 ; then
                tac=gtac
            else
                tac=tac
            fi
            BUFFER=$($tac $HISTFILE | sed 's/^: [0-9]*:[0-9]*;//' | percol --query "$LBUFFER")
            CURSOR=$#BUFFER         # move cursor
            zle -R -c               # refresh
        }
        zle -N percol_select_history
        bindkey '^[r' percol_select_history
    fi
fi


## TODO: 256 Color
case "$TERM" in
    xterm*)
        case "`uname`" in
            Linux) TERM=xterm-256color ;;
            *) ;;
        esac
        ;;
    *) ;;
esac

### Functions

### ScreenのHardStatusの表示
case "$TERM" in
    screen)
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

## ^でcd ..
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup
