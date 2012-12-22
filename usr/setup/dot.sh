#!/bin/sh
#
# DropboxやRepository, Host OSにある
# Dot FilesやDirectoryを共有させるために
# Symbolic Linkを張る
##################################################


### Setting

## X11の有無
x11=no

## 共有元の設定FilesのDirctory
unix_dir=~/Repository/bitbucket/unix_files

## 共有元の各Directoryで共有させるFilesのList

bashrc='.bash_profile .bashrc .inputrc .bash'
zshrc='.zshrc .zprofile'
dot_zsh='plugin functions conf'

dot_vim='.vimrc .vim'
dot_emacs='.emacs-w3m .wl .folders .signature'
dot_emacs_d='init.el conf lisp elpa auto-install public_repos'

dot_unix='.screenrc .gitconfig .gitignore .perltidyrc .latexmkrc .auto-insert .percol.d'

dot_x11='.gvimrc .conkyrc .apvlvrc .Xresources .Xmodmap .xmonad'
dot_fluxbox='init styles keys startup apps'


## rmのOption
alias rm='rm -i'
## Symbolic Linkを張る関数の読み込み
[ -d ~/bin ] || (ln -s $unix_dir/bin ~/bin; echo 'bin Linked')
. ~/bin/SmartLn.sh


### Symbolic Link

## UNIX
for file in $bashrc $zshrc $dot_unix $dot_emacs $dot_vim; do
    SmartLn ln $unix_dir/$file ~/$file
done

## ~/.emacs.d
[ -d ~/.emacs.d ] || (mkdir ~/.emacs.d; echo '~/.emacs.d Created')
for file in $dot_emacs_d; do
    SmartLn ln $unix_dir/.emacs.d/$file ~/.emacs.d/$file
done
## Emacs Local Directory
if [ -d /mnt/hgfs ]; then
    SmartLn ln /mnt/hgfs/local ~/.emacs.d/local
fi

## ~/.zsh
[ -d ~/.zsh ] || (mkdir ~/.zsh; echo '~/.zsh Created')
for file in $dot_zsh; do
    SmartLn ln $unix_dir/.zsh/$file ~/.zsh/$file
done

## SSH
[ -d ~/.ssh ] || (mkdir ~/.ssh; echo '~/.ssh Created')
SmartLn ln $unix_dir/.ssh/config ~/.ssh/config

## Vimperator
# SmartLn ln $set_dir/.vimperatorrc ~/.vimperatorrc
# SmartLn ln $set_dir/.vimperator/plugin ~/.vimperator/plugin
# SmartLn ln $set_dir/.vimperator/conf ~/.vimperator/conf


## OSごとのSetting
case "`uname`" in
    Linux)
        SmartLn ln $unix_dir/share/texmf ~/texmf

        if [ $x11 = yes ]; then
            for file in $dot_x11; do
                SmartLn ln $unix_dir/$file ~/$file
            done
            ## Fluxbox
            # if [ ! -d ~/.fluxbox ]; then
            #     mkdir ~/.fluxbox
            # fi
            for file in $dot_fluxbox; do
                SmartLn ln $unix_dir/.fluxbox/$file ~/.fluxbox/$file
            done
        fi
        ;;
    Darwin)
        SmartLn ln $unix_dir/share/texmf ~/Library/texmf
        ;;
    *)  ;;
esac

## DistributionごとのSetting
if [ -f /etc/issue.net ]; then
    case "`cat /etc/issue.net`" in
        Ubuntu*)
            ;;
        Debian*)
            ;;
        *)  ;;
    esac
fi


## HostごとのSetting
case "$HOSTNAME" in
    sing*)
        ;;
    box*)
        ;;
    over*)
        SmartLn ln $unix_dir/.leap.xprofile ~/.xprofile
        SmartLn ln $unix_dir/.Xmodmap ~/.Xmodmap
        # SmartLn ln $unix_dir/.Xmodmap ~/.xmodmaprc
        # SmartLn ln $unix_dir/.xmonad.xsessionrc ~/.xsessionrc
        # SmartLn ln $set/.gconf/apps/gnome-terminal ~/.gconf/apps/gnome-terminal
        # SmartLn ln $unix_dir/.synergys/leap/esprimo-leap.synergy.conf ~/.synergy.conf
        ;;
    ride*)
        SmartLn ln $unix_dir/.bash/conf/proxy.bash ~/.bash_proxy
        ;;
    ubuntu*)
        ;;
    debian*)
        ;;
    *) ;;
esac


exit 0
