### Red Hat
[ -f /etc/bashrc ] && . /etc/bashrc

### Ubuntu
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
# Local
elif [ -f ~/.bash_completion ] && ! shopt -oq posix; then
	[ -n "$BASH_COMPLETION" ] || BASH_COMPLETION=~/.bash_completion
	[ -n "$BASH_COMPLETION_DIR" ] || BASH_COMPLETION_DIR=~/.bash_completion.d
	[ -n "$BASH_COMPLETION_COMPAT_DIR" ] || BASH_COMPLETION_COMPAT_DIR=~/.bash_completion.d
	. ~/.bash_completion
# Mac
elif [ -x /usr/local/bin/brew ]; then
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
fi
# Git
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

# User specific aliases and functions

### Ctrl-sによる画面出力停止を無効にして,  
### historyの後方検索にする
stty stop undef

### cdの補完はDirectoryのみ
complete -d cd
### cdでDirectory名を訂正
shopt -s cdspell
if [ "$BASH_VERSINFO" -ge 4 ]; then
	### Directory名でcd
	shopt -s autocd
	### Directory名を訂正
	shopt -s dirspell
fi

### 複数端末(例えばscreen)間でコマンド履歴(history)を共有
## .bash_historyに前コマンドを追記;
## 端末ローカルの履歴を消去;
## .bash_historyから履歴を再読込
PROMPT_COMMAND='history -a; history -c; history -r'
## .bash_history追記をOFF
shopt -u histappend

case "$TERM" in
	xterm*)
		
		### HostによってPromptの色を変更
		case "$HOSTNAME" in
			sing*) col=31 ;;
			leap*) col=36 ;;
			box*) col=35 ;;
			ride*) col=33 ;;
			# ubuntu*) col=34 ;;
			# debian*) col= ;;
			*) col= ;;
		esac
		PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[${col}m\]\u\[\e[0m\]@\[\e[${col}m\]\h\[\e[0m\]:\w\$ '
		# PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ " # Default (Ubuntu)

		case `uname` in
			Linux*)	TERM=xterm-256color
					;;
				*) 	;;
		esac
		;;
	*) ;;
esac
