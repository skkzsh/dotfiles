# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


# Path (下の方ほど優先度が高い)
case `uname` in

	Linux*) 
		if [ -d /usr/NX/bin ] ; then
			PATH="/usr/NX/bin:$PATH"
		fi
		if [ -d "$HOME/bin/python" ]; then
			PATH=$HOME/bin/python/bin:$PATH
		fi
		if [ -d "$HOME/bin/pypy-1.8" ]; then
			PATH="$HOME/bin/pypy-1.8/bin:$PATH"
		fi
		;;

	Darwin*)
		# if [ -d /Applications/Thunderbird.app ]; then
		# 	PATH="/Applications/Thunderbird.app/Contents/MacOS:$PATH"
		# fi
		# if [ -d /Applications/Firefox.app ]; then
		# 	PATH="/Applications/Firefox/Contents/MacOS:$PATH"
		# fi
		if [ -d /Applications/Xpdf.app ]; then
			PATH="/Applications/Xpdf.app:/Applications/Xpdf.app/bin:$PATH"
		fi
		if [ -d /Applications/gnuplot.app ]; then
			PATH="/Applications/gnuplot.app:/Applications/gnuplot.app/bin:$PATH"
		fi
		if [ -d /Applications/Ghostscript.app ]; then
			PATH="/Applications/Ghostscript.app:/Applications/Ghostscript.app/bin:$PATH"
		fi
		if [ -d /Library/Frameworks/Python.framework/Versions/2.7/bin ] ; then
			PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
		fi
		if [ -x /usr/local/bin/brew ]; then
			if [ -d `brew --prefix`/Cellar/emacs ]; then
				PATH="`brew --prefix`/Cellar/emacs/23.3b/Emacs.app/Contents/MacOS/bin:$PATH"
				# PATH="`brew --prefix`/Cellar/emacs/24.1/Emacs.app/Contents/MacOS/bin:$PATH"
			fi
		fi
		if [ -d /Applications/MacVim.app ]; then
			PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
		fi
		;;

	*) ;;
esac


### set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"


### Consoleで英語, その他で日本語
case "$TERM" in
    linux) LANG=C           ;;
    *) 	   LANG=ja_JP.utf-8 ;;
esac


case `uname` in
	Darwin*)
		export VISUAL=vim
		;;
	*) ;;
esac


### TeX
case `uname` in
	Darwin*)
		# TEXINPUTS=~/texmf/ptex:~/texmf/tex:$TEXINPUTS
		# BIBINPUTS=~/texmf/jbibtex/bib:~/texmf/bibtex/bib:$BIBINPUTS
		# BSTINPUTS=~/texmf/jbibtex/bst:~/texmf/bibtex/bst:$BSTINPUTS
		# TEXMF=
		# TEXMFHOME= 
		# TEXMFVAR= 
		# TEXMFCONFIG= 
		# TEXMFCNF= 
		;;
	*) ;;
esac


### Key Chain
# GUIだと失敗
case `uname` in
	Linux*)
		# if [ -x /usr/bin/keychain ] ; then
		# 	# unset SSH_AUTH_SOCK
		# 	keychain ~/.ssh/id_rsa
		# 	# keychain -q ~/.ssh/id_rsa
		# 	. ~/.keychain/$HOSTNAME-sh
		# 	# . ~/.ssh-agent-$HOSTNAME
		# fi
		;;
	*) ;;
esac

# exec ssh-agent $SHELL
# eval `ssh-agent` 


### Proxy
[ -f ~/.bash_proxy ] && . ~/.bash_proxy


### Super Computer
case "$HOSTNAME" in
	xe-000? | ap-000?)
		## CPU TimeとMemory等のLimit解除
		# ulimit -v 4194304
		# ulimit -t 72000
		# ENV
		VISUAL=vim

		case "$HOSTNAME" in
			ap-000?)
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
