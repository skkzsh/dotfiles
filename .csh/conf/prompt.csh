### HostによってPromptの色を変更
switch ("$HOSTNAME")
    case ap-000* | xe-000* :
        set deco=00
        set fg_col=34
        set bg_col=
        breaksw
    default:
        breaksw
endsw

set col_begin="%{\e[${deco};${fg_col}m"
set col_end="\e[0m%}"
unset deco fg_col bg_col

set prompt="[${col_begin}%m${col_end} %c]%# "
# prompt="[%n@%m %c]%# " # Default

unset col_begin col_end
