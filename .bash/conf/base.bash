# bashrc, zshrcの共通設定


### Ctrl-sによる画面出力停止を無効にして,
### historyの後方検索にする
stty stop undef


### Consoleで英語, その他で日本語
case "$TERM" in
    linux) LANG=C           ;;
    *)     LANG=ja_JP.utf-8 ;;
esac

# VimはAlias定義の後
# OSごとのSetting
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

## DistributionごとのSetting
if [ -f /etc/issue.net ]; then
    case "`cat /etc/issue.net`" in
        Ubuntu*)
            export EDITOR=vim
            ;;
        *)  ;;
    esac
fi

### perlbrew (perlbrew env)
[ -d "$HOME/perl5/perlbrew" ] && . "$HOME/perl5/perlbrew/etc/bashrc"
[ -n "$PERLBREW_ROOT" ] && . "$PERLBREW_ROOT/etc/perlbrew-completion.bash"


### pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && . "$HOME/.pythonbrew/etc/bashrc"

### TODO: virtualenvwrapper
if which virtualenvwrapper.sh > /dev/null 2>&1 ; then
    # VIRTUALENVWRAPPER_PYTHON="$PATH_PYTHONBREW_CURRENT/python"
    # VIRTUALENVWRAPPER_VIRTUALENV="$PATH_PYTHONBREW_CURRENT/virtualenv"
    WORKON_HOME="$HOME/.virtualenvs"
    . "`which virtualenvwrapper.sh`"
fi


### rbenv (brew info rbenv)
## TODO: rbenvがない場合OSによってstdoutに出たりstderrに出たり違う?
which rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"

if [ -n "$BASH_VERSION" ]; then
    case "`uname`" in

        Linux)
            if [ -d "$HOME/.rbenv" ]; then
                . ~/.rbenv/completions/rbenv.bash
            fi
            ;;

        Darwin)
            if which brew > /dev/null ; then
                if [ -d  "`brew --prefix rbenv`" ]; then
                    . "`brew --prefix rbenv`/completions/rbenv.bash"
                fi
            fi
            ;;

        *) ;;
    esac
fi


### autojump
# fpath=(~/.autojump/functions $fpath) # compinitより前に
case "`uname`" in

    Linux | CYGWIN* | MINGW32*)
        if [ -f ~/.autojump/etc/profile.d/autojump.sh ]; then
            if [ -n "$ZSH_VERSION" ]; then
                . ~/.autojump/etc/profile.d/autojump.zsh
            elif [ -n "$BASH_VERSION" ]; then
                . ~/.autojump/etc/profile.d/autojump.bash
            fi
        fi
        ;;

    Darwin)
        if which brew > /dev/null ; then
            ## brew info autojump
            if [ -f `brew --prefix`/etc/autojump.sh ]; then
                if [ -n "$ZSH_VERSION" ]; then
                    . `brew --prefix`/etc/autojump.zsh
                elif [ -n "$BASH_VERSION" ]; then
                    . `brew --prefix`/etc/autojump.bash
                fi
            fi
        fi
        ;;

    *) ;;
esac


### z
# case "`uname`" in
#     Linux)
#         ;;
#
#     Darwin)
#        ## brew info z.sh
#         if which brew > /dev/null ; then
#             if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
#                 . `brew --prefix`/etc/profile.d/z.sh
#                 if [ -n "$ZSH_VERSION" ]; then
#                     function precmd () {
#                     z --add "$(pwd -P)"
#                 }
#             fi
#         fi
#
#     fi
#     ;;
# *) ;;
# esac


### percol
if which percol > /dev/null 2>&1 ; then

    function ppgrep() {
        if [[ $1 == "" ]]; then
            PERCOL=percol
        else
            PERCOL="percol --query $1"
        fi
        ps aux | eval $PERCOL | awk '{ print $2 }'
    }

    function ppkill() {
        if [[ $1 =~ "^-" ]]; then
            QUERY=""            # options only
        else
            QUERY=$1            # with a query
            shift
        fi
        ppgrep $QUERY | xargs kill $*
    }

fi


### BashとZshでHost名の環境変数が異なる
if [ -n "$BASH_VERSION" ]; then
    host="$HOSTNAME"
elif [ -n "$ZSH_VERSION" ]; then
    host="$HOST"
fi

### Fortune
### HostによってFileを変更
# if which fortune > /dev/null ; then
#
#     # literature, ubuntu-server-tips-ja, debian-hints, libfortune-perl
#     case "$host" in
#         sing*)   fortune_file=literature            ;;
#         drive*)  fortune_file=ubuntu-server-tips-ja ;;
#         leap*)   fortune_file=ubuntu-server-tips-ja ;;
#         box*)    fortune_file=ubuntu-server-tips-ja ;;
#         ride*)   fortune_file=debian-hints          ;;
#         debian*) fortune_file=debian-hints          ;;
#         *)       fortunefile=                       ;;
#     esac
#
#     echo
#     echo "********************************************************************************"
#     fortune $fortune_file
#     echo "********************************************************************************"
#     echo
#
# fi


### Proxy
[ -f ~/.bash_proxy ] && . ~/.bash_proxy


### Super Computer
case "$host" in
    xe-000* | ap-000*)
        VISUAL=vim

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
