# Completions

#---------------------------------------------------------------------------
## fpathはcompinitの前に定義
## TODO: if exists

fpath=(~/.zsh/site-functions ~/.zsh/functions $fpath)
# fpath=(~/.zsh/bundle/zsh-completions/src $fpath)

case $(uname) in
    Linux)
        if ! (which brew > /dev/null 2>&1 && [[ -d $(brew --prefix nodebrew) ]]) && [[ -d ~/.nodebrew ]] ; then
            fpath=(~/.nodebrew/completions/zsh $fpath)
        fi
        ;;
    *) ;;
esac

for cmd in cpanm pip docker; do
    # if which $cmd > /dev/null 2>&1 ; then
    fpath=(~/.zsh/bundle/oh-my-zsh/plugins/$cmd $fpath)
    # fi
done
unset cmd

## rbenvの補完ができない!
# . ~/.rbenv/completions/rbenv.zsh

## Linux
## ln -s ~/.rbenv/completions/rbenv.zsh ~/.zsh/site-functions/_rbenv
## Mac
## ln -s /usr/local/Library/Contributions/brew_zsh_completion.zsh ~/.zsh/site-functions/_brew
## ln -s $(brew --prefix rbenv)/completions/rbenv.zsh ~/.zsh/site-functions/_rbenv

#---------------------------------------------------------------------------
### Use modern completion system
autoload -Uz compinit
## -uはPermission Error回避
compinit -u

#---------------------------------------------------------------------------
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
### 補完候補に色を付ける
## dircolors評価後
if [[ -n $LS_COLORS ]] ; then
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

#---------------------------------------------------------------------------
## cdr
if is-at-least 4.3.15 ; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':chpwd:*' recent-dirs-max 5000
    zstyle ':chpwd:*' recent-dirs-default yes
    zstyle ':completion:*' recent-dirs-insert both
fi

#---------------------------------------------------------------------------
## AWS
if which aws_zsh_completer.sh > /dev/null 2>&1 ; then
    if which pyenv > /dev/null 2>&1 ; then
        . $(pyenv which aws_zsh_completer.sh)
    fi
fi

