if [ -f "$HOME/.bash_profile" ]; then
    . "$HOME/.bash_profile"
elif [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

### Mac
## brew install zsh
## Defaultでは, zsh上でscreenを起動すると,
## PATHが逆転する.
## /etc/zshenvのpath_helperが原因.
## path_helper(/etc/paths, /etc/paths.d)
## と~/.zprofileの定義が逆転する.
## brew info zshに解決策があり,
## /etc/zshenv -> /etc/zprofileにRenameする.
