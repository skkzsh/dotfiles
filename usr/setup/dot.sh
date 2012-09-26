#!/bin/sh
#
# DropboxやRepository, Host OSにある
# Dot FilesやDirectoryを共有させるために
# Symbolic Linkを張る
##################################################


### Setting

## 共有元の設定FilesのDirctory
unix_dir=~/Repository/bitbucket/unix_files

## 共有元の各Directoryで共有させるFilesのList

bashrc='.bashrc .bash_aliases .inputrc .bash_env'
zshrc='.zshrc .zprofile .zsh_aliases'
dot_zsh='plugin functions'

dot_vim='.vimrc .gvimrc .vim'
dot_emacs='.emacs-w3m .wl .folders .signature'
dot_emacs_d='init.el conf lisp elpa auto-install public_repos'

dot_unix='.screenrc .gitconfig .gitignore .perltidyrc .latexmkrc .auto-insert .percol.d bin'
dot_linux='.conkyrc .apvlvrc'

dot_x11='.Xresources .Xmodmap .xmonad'
dot_fluxbox='init styles keys startup apps'


## rmのOption
alias rm='rm -i'
## Symbolic Linkを張る関数の読み込み
. ~/bin/SmartLn.sh


### Symbolic Link

## UNIX
for file in $bashrc $zshrc $dot_unix $dot_emacs $dot_vim; do
    SmartLn ln $unix_dir/$file ~/$file
done

## TODO: .profile
if [ -f ~/.profile ]; then
    # Debian
    SmartLn ln $unix_dir/.profile ~/.profile
elif [ -f ~/.bash_profile ]; then
    # Mac Redhat
    SmartLn ln $unix_dir/.profile ~/.bash_profile
fi

## ~/.emacs.d
for file in $dot_emacs_d; do
    SmartLn ln $unix_dir/.emacs.d/$file ~/.emacs.d/$file
done
## Emacs Local Directory
if [ -d /mnt/hgfs ]; then
    SmartLn ln /mnt/hgfs/local ~/.emacs.d/local
fi

## ~/.zsh
for file in $dot_zsh; do
    SmartLn ln $unix_dir/.zsh/$file ~/.zsh/$file
done

## SSH
SmartLn ln $unix_dir/.ssh/config ~/.ssh/config
# TEXMF
SmartLn ln $unix_dir/share/texmf ~/texmf

## Vimperator
SmartLn ln $set_dir/.vimperatorrc ~/.vimperatorrc
SmartLn ln $set_dir/.vimperator/plugin ~/.vimperator/plugin
SmartLn ln $set_dir/.vimperator/conf ~/.vimperator/conf


## OSごとのSetting
case `uname` in
    Linux)
        for file in $dot_linux $dot_x11; do
            SmartLn ln $unix_dir/$file ~/$file
        done
        ## Fluxbox
        for file in $dot_fluxbox; do
            SmartLn ln $unix_dir/.fluxbox/$file ~/.fluxbox/$file
        done
        ;;
    Darwin)
        ;;
    *)  ;;
esac

## DistributionごとのSetting
if [ -f /etc/issue.net ]; then
    case "`cat /etc/issue.net`" in
        Ubuntu*)
            ;;
        Debian*)
            SmartLn ln $unix_dir/.debian.xsessionrc ~/.xsessionrc
            ;;
        *)  ;;
    esac
fi


## HostごとのSetting
case "$HOSTNAME" in
    sing*)
        ;;
    drive*)
        # SmartLn ln $unix_dir/.Xmodmap ~/.xmodmaprc
        ;;
    leap*)
        SmartLn ln $unix_dir/.leap.xprofile ~/.xprofile
        SmartLn ln $unix_dir/.Xmodmap ~/.xmodmaprc
        # SmartLn ln $unix_dir/.xmonad.xsessionrc ~/.xsessionrc
        # SmartLn ln $set/.gconf/apps/gnome-terminal ~/.gconf/apps/gnome-terminal
        # SmartLn ln $unix_dir/.synergys/leap/esprimo-leap.synergy.conf ~/.synergy.conf
        ;;
    box*)
        ;;
    ride*)
        SmartLn ln $unix_dir/.kuins.bash_proxy ~/.bash_proxy
        ;;
    debian*)
        ;;
    *) ;;
esac


exit 0
