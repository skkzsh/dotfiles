### Prompt

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
    over*)             col=red     ;;
    sing*)             col=green   ;;
    box*)              col=magenta ;;
    ride*)             col=yellow  ;;
    ubuntu*)           col=        ;;
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
