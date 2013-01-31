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

# %B-%b: Bold
# %U-%u: Underline
# %S-%s: 強調

### HostによってPromptの色を変更
## Method 1
## bashrcを参考
# case "$HOST" in
#     *)                 col= ;;
# esac
# col_begin=%{[${col}m%}
# col_end=%{[m%}

## Method 2
#0:black, 1:red, 2:green, 3:yellow,
#4:blue, 5:magenta, 6:cyan, 7:white
case "$HOST" in
    sing*)             col=green   ;;
    box*)              col=magenta ;;
    over*)             col=red     ;;
    ride*)             col=yellow  ;;
    cern*)             deco=u ;;
    ubuntu*)           deco=u ;;
    debian*)           deco=u ;;
    *PC)               deco=s ;;
    h24?*)             deco=u ;;
    xe-000? | ap-000?) deco=u ;;
    *)                 col= ;;
esac

autoload colors
colors
col_begin=%{${fg[${col}]}%}
col_end=%{${reset_color}%}
unset col

deco_begin=%`echo ${deco} | tr a-z A-Z`
deco_end=%${deco}
unset deco

case "$USER" in
    root)
        PROMPT="${col_begin}%n${col_end}@${col_begin}%m${col_end}:%~ > "
        ;;
    *)
        PROMPT="${col_begin}%m${col_end}:%~ > "
        ;;
esac

# PROMPT="${deco_begin}${col_begin}%m${col_end}${deco_end}:%~ > "
## suse Base
## PROMPT='%n@%m:%~ > ' # Default
PROMPT2='> '
PROMPT3='?# '
PROMPT4='+%N:%i> '
SPROMPT='zsh: correct '%R' to '%r' [nyae]? '
# RPROMPT=

unset col_begin col_end deco_begin deco_end
