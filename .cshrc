### Basic
## Ctrl-dでログアウト
unset ignoreeof
## 補完(screenでも)
# set autolist
## 補完でcolor(screenでも)
# set color
## 補完で大文字・小文字を区別しない等
set complete=enhance
## historyを保存
    set history=10000
set savehist=(20000 merge)
## historyを重複させない
    set histdup=erase
## historyを展開
    set autoexpand
## Directory名だけでcd
    set implicitcd=verbose
## 
# set autocorrect
## 
# set colorcat
## 
# set correct=cmd
## ask before `rm *' command
    set rmstar

### 補完
    if ( -f /usr/share/doc/tcsh-6.17/complete.tcsh ) then
    source /usr/share/doc/tcsh-6.17/complete.tcsh
    endif

### Keybind
## BashのようにhistoryをSearch
    bindkey "^R" i-search-back
    bindkey "^S" i-search-fwd
# bindkey ^W backward-delete-word
# bindkey -k up history-search-backward
# bindkey -k down history-search-forward
## ~/.inputrc
# Pipe
    bindkey -s '^xg' ' | grep'
    bindkey -s '^xl' ' | less'
# Option 
#bindkey -s '^xh': ' --help'
# Directory
    bindkey -s '^xh' ' ~/'
    bindkey -s '^xd' ' ~/Dropbox/'
    bindkey -s '^xe' ' ~/.emacs.d/'
    bindkey -s '^xo' ' ~/.opera/'
# su
#bindkey -s '^xi' 'sudo /etc/init.d/'

### 日本語
    switch ("$TERM")
    case linux:
    setenv LANG C
    breaksw
    default:
    setenv LANG ja_JP.utf-8
    breaksw
    endsw

### Aliases
    if ( -f ~/.csh_aliases ) then
    source ~/.csh_aliases
    endif

### Proxy
    if ( -f ~/.csh_proxy ) then
    source ~/.csh_proxy
    endif

### Super Computer
    switch ("$HOSTNAME")
# ???
    case ap-000* | xe-000* :
# CPU TimeとMemory等のLimit解除
    unlimit
### ENV
    setenv VISUAL vim

    switch ("$HOSTNAME")
    case ap-000* :
# Module
    module load matlab/R2012a
#module load matlab/R2011b
#module load matlab/R2010b
    breaksw
    default: 
    breaksw
    endsw

    breaksw
    default: 
    breaksw
    endsw
