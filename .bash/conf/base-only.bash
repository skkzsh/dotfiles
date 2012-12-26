### bash$B$@$1$N4pK\(BSetting

### Red Hat
case "`uname`" in
    Linux) [ -f /etc/bashrc ] && . /etc/bashrc ;;
    *) ;;
esac

### cd$B$NJd40$O(BDirectory$B$N$_(B
complete -d cd
### cd$B$G(BDirectory$BL>$rD{@5(B
shopt -s cdspell
if [ "$BASH_VERSINFO" -ge 4 ]; then
    ### Directory$BL>$G(Bcd
    shopt -s autocd
    ### Directory$BL>$rD{@5(B
    shopt -s dirspell
fi


### $BJ#?tC<Kv(B($BNc$($P(Bscreen)$B4V$G%3%^%s%IMzNr(B(history)$B$r6&M-(B
## .bash_history$B$KA0%3%^%s%I$rDI5-(B;
## $BC<Kv%m!<%+%k$NMzNr$r>C5n(B;
## .bash_history$B$+$iMzNr$r:FFI9~(B
PROMPT_COMMAND='history -a; history -c; history -r'
## .bash_history$BDI5-$r(BOFF
shopt -u histappend

### Screen$B$N(BHardStatus$B$NI=<((B
## $B<B9T$7$?(BCommand
# PROMPT_COMMAND='echo -ne "\033k\033\\"'
# PROMPT_COMMAND='echo -ne "\033k\033\134"'
# PROMPT_COMMAND='echo -ne "\033]0;$(whoami)@$(hostname):$(pwd)\007"'
