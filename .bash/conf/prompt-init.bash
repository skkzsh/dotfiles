# Prompt

## 30 31 32 33 34 35 36 37
## 黒 赤 緑 黄 青 紫 水 白
## 十の位を3から4にすると背景
## 修飾(色の前にx;を置く)
## 1: Light
## 修飾(色の後に;xを置く)
## 1: Bold
## 2: 弱
## 4: Under Line
## 5: 点滅
## 7: 反転
case $HOSTNAME in
    sing*)      col=32 ;;
    box*)       col=35 ;;
    *vagrant*)  col=36 ;;
    *ubuntu*)   col=4  ;;
    *arch*)     col=4  ;;
    *solaris*)  col=4  ;;
    *)          col=4  ;;
esac

col_begin="\[\e[${col}m\]"
col_end='\[\e[m\]'
# col_end="\[\e[0m\]"
unset col

## Ubuntu Base
# Console2, MINGWだと, TERM=cygwin
case $(uname) in
    MSYS*|MINGW*)
        PS1=$col_begin'\w'$col_end' \$ '
        ;;

    *)
        case $TERM in
            xterm* | screen*)
                case $USER in
                    root)
                        PS1=$col_begin'\u'$col_end'@'$col_begin'\h'$col_end':\w \$ '
                        ;;
                    *)
                        PS1=$col_begin'\h'$col_end':\w \$ '
                        ;;
                esac
                ;;
            *) ;;
        esac
        ;;
esac
# PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ " # Ubuntu Default

unset col_begin col_end

# set variable identifying the chroot you work in (used in the prompt below)
# if [[ -z $debian_chroot ]] && [[ -r /etc/debian_chroot ]]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case $TERM in
#     xterm-color) color_prompt=yes;;
# esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# if [[ -n $force_color_prompt ]]; then
#     if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
#         # We have color support; assume it's compliant with Ecma-48
#         # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#         # a case would tend to support setf rather than setaf.)
#         color_prompt=yes
#     else
#         color_prompt=
#     fi
# fi

# if [[ $color_prompt = yes ]]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case $TERM in
#     xterm*|rxvt*)
#         PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#         ;;
#     *)
#         ;;
# esac
