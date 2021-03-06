# Basic conf

#---------------------------------------------------------------------------
## Bash
if [[ -d ~/.bash/conf ]] ; then
    . ~/.bash/conf/base-share-init.bash
fi

#---------------------------------------------------------------------------
### Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

#####
### Key Bindings
bindkey '^[p' history-beginning-search-backward
bindkey '^[n' history-beginning-search-forward
## ^s, ^qを無効
setopt no_flow_control

#---------------------------------------------------------------------------
### History
## 同じコマンドラインを連続で実行した場合はHistoryに登録しない
setopt hist_ignore_dups
## zshプロセス間でHistoryを共有
setopt share_history
## 実行時刻も保存
setopt extended_history
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
# setopt glob_complete
## extended glob
setopt extended_glob

# if [[ $(uname) = Darwin ]]; then
    # /etc/zprofile (/usr/libexec/path_helper) を実行しないために
    # unsetopt global_rcs
    # setopt no_global_rcs
# fi

#---------------------------------------------------------------------------
## Ubuntu
if [[ -f /etc/zsh_command_not_found ]]; then
      . /etc/zsh_command_not_found
fi

#---------------------------------------------------------------------------
## AutoLoad

# Versionの条件分岐に使用
autoload -Uz is-at-least

# zmv
autoload -Uz zmv

## URL
# autoload -U url-quote-magic
# zle -N self-insert url-quote-magic
