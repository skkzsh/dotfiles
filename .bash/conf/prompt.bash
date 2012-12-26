### HostによってPromptの色を変更
### 30 31 32 33 34 35 36 37
### 黒 赤 緑 黄 青 紫 水 白
### 十の位を3から4にすると背景
### 修飾(色の前にx;を置く)
### 1: Light
### 修飾(色の後に;xを置く)
### 1: Bold
### 2: 弱
### 4: Under Line
### 5: 点滅
### 7: 反転
case "$HOSTNAME" in
    over*)             col=31 ;;
    sing*)             col=32 ;;
    box*)              col=35 ;;
    ride*)             col=33 ;;
    ubuntu*)           col=4  ;;
    debian*)           col=4  ;;
    *PC)               col=7  ;;
    h24?)              col=4  ;;
    xe-000? | ap-000?) col=4  ;;
    *)                 col=4  ;;
esac
col_begin="\[\e[${col}m\]"
col_end="\[\e[0m\]"
case "$TERM" in
    xterm* | screen*)
        ## Ubuntu Base
        PS1="\[\e]0;\h: \w\a\]${debian_chroot:+($debian_chroot)}${col_begin}\h${col_end}:\w \$ "
        ## PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ " # Default
        ;;
    *) ;;
esac
