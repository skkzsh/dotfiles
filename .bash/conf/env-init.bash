# Environment Variables
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
# TODO: Macでcoreutilsを使う場合を考慮

export LESS='-iMR -x4'

# if [[ -n $LS_COLORS || $(uname) = Darwin ]]; then
#     export GREP_OPTIONS='--color=always'
# fi

# if [[ -n $LS_COLORS ]]; then
#     export LS_OPTIONS='-Fh --color=always'
# fi

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

#---------------------------------------------------------------------------
### conf for each TERM
## if Console in English, otherwise in Japanese
case $TERM in
    linux) export LANG=C           ;;
    *)     export LANG=ja_JP.UTF-8 ;;
    # *)     export LANG=ja_JP.utf-8 ;;
esac

## TODO: 256 Color
case $TERM in
    xterm*)
        case $(uname) in
            Linux) export TERM=xterm-256color ;;
            # Linux | MINGW32*) export TERM=xterm-256color ;;
            ## Console2でのgit diffはxtermでないとError
            *) ;;
        esac
        ;;
    *) ;;
esac

#---------------------------------------------------------------------------
### conf for each OS
## Alias定義の後?
case $(uname) in

    Darwin|Linux)
        export EDITOR=vim
        export VISUAL=$EDITOR

        # for Mac
        # CLICOLOR=1
        # LSCOLORS=DxGxcxdxCxegedabagacad
        # LSCOLORS=gxfxcxdxbxegedabagacad
        # LSCOLORS=ExFxCxDxBxegedabagacad
        ;;

    FreeBSD|SunOS)
        export PAGER=less
        # -ins
        export VISUAL=vim
        ;;

    ## Windowsの環境変数でPAGERを指定している場合は
    ## 上書きしたいため
    MSYS*|MINGW*)
        # export TERM=xterm-256color
        # export TERM=xterm
        export PAGER=less
        if which gvim > /dev/null 2>&1 ; then
            export EDITOR=gvim
        else
            export EDITOR=vim
        fi
        export VISUAL=$EDITOR
        ;;

    *) ;;
esac


#---------------------------------------------------------------------------
### conf for each Linux Distribution
## いくつか方法がある
## TODO: EDITOR or VISUAL
# if [[ -f /etc/issue ]]; then
#     case "$(cat /etc/issue)" in
#
#         Arch*|Ubuntu*|Amazon*)
#             ;;
#
#         *)  ;;
#     esac
# fi

#---------------------------------------------------------------------------
### Ansible
if (which ansible && which cowsay) > /dev/null 2>&1 ; then
    export ANSIBLE_NOCOWS=1
fi

#---------------------------------------------------------------------------
### Git

## Git for Windowsにより, GIT_SSH=plinkとなっている場合
# case $OSTYPE in
#     msys)
#         [[ $GIT_SSH =~ plink ]] && unset GIT_SSH
#         [[ $SVN_SSH =~ plink ]] && unset SVN_SSH
#         ;;
#     *) ;;
# esac

if which gisty > /dev/null 2>&1 ; then
    case $(uname) in
        Darwin|Linux)
            export GISTY_DIR=~/Repository/gist
            ;;
        *) ;;
    esac
fi

#---------------------------------------------------------------------------
### DB
export PGHOST=localhost
