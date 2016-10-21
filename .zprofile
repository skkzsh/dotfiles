# echo hello zprofile # Debug

if [[ -f ~/.bash_profile ]] ; then
    . ~/.bash_profile
fi

### Ubuntu
## .zprofileが読み込まれず, .profileが読み込まれる

### Mac
## brew info zsh
## Defaultでは, zsh上でscreenを起動すると,
## PATHが逆転する.
## /etc/zshenvのpath_helperが原因.
## path_helper(/etc/paths, /etc/paths.d)
## と~/.zprofileの定義が逆転する.
## brew info zshに解決策があり,
## /etc/zshenv -> /etc/zprofileにRenameする.
