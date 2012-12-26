### TERMごとのSetting
## Consoleで英語, その他で日本語
case "$TERM" in
    linux) LANG=C           ;;
    *)     LANG=ja_JP.utf-8 ;;
esac
## TODO: 256 Color
case "$TERM" in
    xterm*)
        case "`uname`" in
            Linux | MINGW32*) TERM=xterm-256color ;;
            *) ;;
        esac
        ;;
    *) ;;
esac


### OSごとのSetting
## VimはAlias定義の後?
case "`uname`" in
    Darwin)
        VISUAL=vim
        # CLICOLOR=1
        # LSCOLORS=DxGxcxdxCxegedabagacad
        # LSCOLORS=gxfxcxdxbxegedabagacad
        # LSCOLORS=ExFxCxDxBxegedabagacad
        ;;
    ## Windowsの環境変数でPAGERを指定している場合は
    ## 上書きしたいため
    CYGWIN*)
        PAGER=less
        ;;
    MINGW32*)
        PAGER=less
        VISUAL=vim
        TERM=xterm
        ;;
    *) ;;
esac

### DistributionごとのSetting
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


### HostごとのSetting
if [ -n "$BASH_VERSION" ]; then
    host="$HOSTNAME"
elif [ -n "$ZSH_VERSION" ]; then
    host="$HOST"
fi

### Super Computer
case "$host" in
    xe-000* | ap-000*)

        module unload emacs/23.4
        ## CPU TimeとMemory等のLimit解除
        ulimit -v 4194304
        ulimit -t 72000

        case "$host" in
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

unset host

### Proxy
[ -f ~/.bash_proxy ] && . ~/.bash_proxy
