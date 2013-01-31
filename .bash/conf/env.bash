# TODO: Macでcoreutilsを使う場合を考慮

# export LESS='-R -x4'
# if [ -n "$LS_COLORS" -o "`uname`" = Darwin ]; then
#     export GREP_OPTIONS='--color=always'
#     # if [ -n "$LS_COLORS" ]; then
#     #     export LS_OPTIONS='-Fh --color=always'
#     # elif [ "`uname`" = Darwin ] ; then
#     #     export LS_OPTIONS='-FhG'
#     # fi
# fi

### Settings for each TERM
## if Console in English, otherwise in Japanese
case "$TERM" in
    linux) LANG=C           ;;
    *)     LANG=ja_JP.utf-8 ;;
esac
## TODO: 256 Color
case "$TERM" in
    xterm*)
        case "`uname`" in
            Linux) TERM=xterm-256color ;;
            # Linux | MINGW32*) TERM=xterm-256color ;;
            ## Console2でのgit diffはxtermでないとError
            *) ;;
        esac
        ;;
    *) ;;
esac


### Settings for each OS
## VimはAlias定義の後?
case "`uname`" in
    Darwin)
        export VISUAL=vim
        # CLICOLOR=1
        # LSCOLORS=DxGxcxdxCxegedabagacad
        # LSCOLORS=gxfxcxdxbxegedabagacad
        # LSCOLORS=ExFxCxDxBxegedabagacad
        ;;
    ## Windowsの環境変数でPAGERを指定している場合は
    ## 上書きしたいため
    MINGW32*)
        # export TERM=xterm-256color
        # export TERM=xterm
        export PAGER=less
        export VISUAL=vim
        ;;
    CYGWIN*)
        PAGER=less
        ;;
    *) ;;
esac


### Settings for each Linux Distribution
## いくつか方法がある
if [ -f /etc/issue.net ]; then
    case "`cat /etc/issue.net`" in

        Scientific*|Ubuntu*)
            export EDITOR=vim
            ;;

        Red*|*SUSE*)
            VISUAL=vim
            ;;

        *)  ;;
    esac
fi


### Settings for each Host
### Super Computer
case "`hostname`" in
    xe-000* | ap-000*)

        module unload emacs/23.4
        ## CPU TimeとMemory等のLimit解除
        ulimit -v 4194304
        ulimit -t 72000

        case "`hostname`" in
            ap-000*)
                ## Module
                module load matlab/R2012a
                # module load matlab/R2011b
                # module load matlab/R2010b
                ;;
            *) ;;
        esac

        ;;
    *) ;;
esac

### Proxy
[ -f ~/.bash_proxy ] && . ~/.bash_proxy
