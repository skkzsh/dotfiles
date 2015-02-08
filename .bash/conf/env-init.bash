# Environment Variables
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
# TODO: Macでcoreutilsを使う場合を考慮

# export LESS='-R -x4'
# if [[ -n $LS_COLORS -o $(uname) = Darwin ]]; then
#     export GREP_OPTIONS='--color=always'
#     # if [[ -n $LS_COLORS ]]; then
#     #     export LS_OPTIONS='-Fh --color=always'
#     # elif [[ $(uname) = Darwin ]] ; then
#     #     export LS_OPTIONS='-FhG'
#     # fi
# fi

#---------------------------------------------------------------------------
### Settings for each TERM
## if Console in English, otherwise in Japanese
case "$TERM" in
    linux) export LANG=C           ;;
    *)     export LANG=ja_JP.utf-8 ;;
esac

## TODO: 256 Color
case "$TERM" in
    xterm*)
        case "$(uname)" in
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
case "$(uname)" in

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

    ## Windowsの環境変数でPAGERを指定している場合は
    ## 上書きしたいため
    MINGW32*)
        # export TERM=xterm-256color
        # export TERM=xterm
        export PAGER=less
        export VISUAL=gvim
        export EDITOR=gvim
        ;;

    CYGWIN*)
        export PAGER=less
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
#         Arch*|Ubuntu*|RED*|Scientific*|Amazon*|*SUSE*)
#             ;;
#
#         *)  ;;
#     esac
# fi

#---------------------------------------------------------------------------
### Gisty
case "$(uname)" in
    Darwin|Linux)
        export GISTY_DIR=~/Repository/gist
        ;;
    *) ;;
esac

