# -*- shell-script -*-
# vim: filetype=sh

case `uname` in

	Linux*)

		# enable color support of ls and also add handy aliases
		if [ -x /usr/bin/dircolors ]; then
			test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
			alias ls='ls -Fh --color=always'
			alias dir='dir --color=always'
			alias vdir='vdir --color=always'
			alias grep='grep --color=always'
			alias fgrep='fgrep --color=always'
			alias egrep='egrep --color=always'
		fi

		# Add an "alert" alias for long running commands.  Use like so:
		#   sleep 10; alert
		alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

		alias o=xdg-open
		alias n='nautilus --no-desktop'
		alias lvi=/usr/share/vim/vimcurrent/macros/less.sh
		alias m='matlab -nodesktop -nosplash'
		# PDF
		# alias acrd=acroread
		# alias evc=evince
		# alias xp=xpdf
		alias a=apvlv

		# Dropbox
		alias db=dropbox
		function dbs {
		case "`dropbox status`" in
			"Dropbox isn't running!") dropbox start -i ;; ## 未起動ならば起動
			*) dropbox status ;; ## でなければ状態を表示
		esac
		}

		;;
	
	Darwin*)

		alias o=open
		alias ls='ls -FhG'
		alias grep='grep --color=always'
		alias fgrep='fgrep --color=always'
		alias egrep='egrep --color=always'

		if [ -d /Applications/MacVim.app ]; then
			alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
			alias vi='vim'
		fi

		if [ -x /usr/local/bin/brew ]; then
			if [ -d `brew --prefix`/Cellar/emacs ]; then
				# alias emacs23='open -a Emacs'
				alias emacs23="`brew --prefix`/Cellar/emacs/23.3b/Emacs.app/Contents/MacOS/Emacs"
				alias emacs24="`brew --prefix`/Cellar/emacs/24.1/Emacs.app/Contents/MacOS/Emacs"
				alias emacs='emacs23'
			fi
			# [ -x "`which gsed`" ] && alias sed=gsed
		fi

		;;

	*) ;;
esac

########## Basic ##########
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias cd..='cd ..'
alias cd....='cd ../..'
alias cd......='cd ../../..'
# alias -='cd -'
alias cd-='cd -'
alias sl=ls
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias h=history
alias j='jobs -l'
# alias ='locate'
alias nkfg='nkf -g'
alias nkfu='nkf --overwrite -w -Lu'
alias nkfe='nkf --overwrite -e -Lu'
alias nkfs='nkf --overwrite -s -Lw'
alias cmx='chmod +x'
# alias ='ln -s'
# alias ='rdesktop'
# alias :q=exit
alias su-='su -'
##### Network #####
alias p=ping
# alias ic=ifconfig
# alias std='sudo tcpdump'
# alias =nm-connection-editor

if [ -x "`which htop`" ]; then
	alias t=htop
else
	alias t=top
fi
if [ -x "`which colordiff`" ]; then
	alias d=colordiff
else
	alias d=diff
fi

########## less ##########
alias less='less -R -x4'
alias l=less
alias lsl='ls | less'
alias lll='ls -l | less'
alias lal='ls -A | less'
alias llal='ls -lA | less'
alias dul='du | less'
alias hl='history | less'
alias paxl='ps ax | less'
#alias ptl='pstree -al | less'
case `uname` in
	Linux*) alias lest='last -a | less' ;;
	Darwin*) alias lest='last | less' ;;
	*) ;;
esac

########## grep ##########
alias paxg='ps ax | grep'

########## GNU screen ##########
alias s=screen
alias sls='screen -ls'
alias sr='screen -R'
########### Editor ###########
##### Emacs for X #####
alias e=emacs
alias wl='emacs -f wl'
##### Emacs for CUI #####
alias enw='emacs -nw'
alias wlnw='emacs -nw -f wl'
##### Emacs Client ##### 
##### Optionによる挙動の違いがよく分からない
## Emacs Server ##
alias ecn='emacsclient -n' # 既存のServerに送る
## Emacs Daemon ##
alias edm='emacs --daemon'
alias ek="emacsclient -e '(kill-emacs)'"
alias ec='emacsclient' # CUI
alias ecnc='emacsclient -n -c' # GUI
##### Vim #####
alias v=vim
alias vw='view'
alias sv='sudo vim'

########## Programming ##########
alias py=python
alias g=git

########## Memo ##########
# a=apvlv
# b=
# c=
# d=diff
# e=emacs
# f=
# g=git
# h=history
# i
# j=jobs
# k=
# l=less
# m=matlab
# n=nautilus
# o=
# p=ping
# q=
# r
# s=screen
# t=top
# u=
# v=vim
# w
# x=
# y=
# z=
##########################
