### Path
if ( -d "$HOME/perl5" ) then
    setenv PATH $HOME/perl5/bin:$PATH
    setenv PERL5LIB $HOME/perl5/lib/perl5
endif
if ( -d "$HOME/bin" ) then
    setenv PATH $HOME/bin:$PATH
endif
