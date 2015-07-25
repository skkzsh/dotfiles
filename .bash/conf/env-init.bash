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
### Settings for each TERM
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
### Settings for each OS
## Alias定義の後?
case $(uname) in

    Darwin)
        export VISUAL=vim
        # CLICOLOR=1
        # LSCOLORS=DxGxcxdxCxegedabagacad
        # LSCOLORS=gxfxcxdxbxegedabagacad
        # LSCOLORS=ExFxCxDxBxegedabagacad
        ;;

    Linux*)
        export EDITOR=vim
        export VISUAL=vim
        ;;

    FreeBSD|SunOS)
        export PAGER=less
        # -ins
        export VISUAL=vim
        ;;

    ## Windowsの環境変数でPAGERを指定している場合は
    ## 上書きしたいため
    MSYS*|MINGW*|CYGWIN*)
        # export TERM=xterm-256color
        # export TERM=xterm
        export PAGER=less
        export EDITOR=gvim
        export VISUAL=gvim
        ;;

    *) ;;
esac


#---------------------------------------------------------------------------
### Settings for each Linux Distribution
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
### Docker
if which boot2docker > /dev/null 2>&1 ; then
    export DOCKER_HOST=tcp://$(boot2docker ip 2> /dev/null):2376
    export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
fi

#---------------------------------------------------------------------------
### Gisty
case $(uname) in
    Darwin|Linux)
        export GISTY_DIR=~/Repository/gist
        ;;
    *) ;;
esac

