#---------------------------------------------------------------------------
### Consoleで英語, その他で日本語
switch ("$TERM")
    case linux:
        setenv LANG C
        breaksw
    default:
        setenv LANG ja_JP.utf-8
        breaksw
endsw

#---------------------------------------------------------------------------
### Proxy
if ( -f ~/.csh_proxy ) then
    source ~/.csh_proxy
endif

#---------------------------------------------------------------------------
### Super Computer
switch ("$HOSTNAME")
    # ???
    case ap-000* | xe-000* :
        # CPU TimeとMemory等のLimit解除
        unlimit
        ### ENV
        setenv VISUAL vim

        switch ("$HOSTNAME")
            case ap-000* :
                # Module
                module load matlab/R2012a
                #module load matlab/R2011b
                #module load matlab/R2010b
                breaksw
            default:
                breaksw
        endsw

        breaksw
    default:
        breaksw
endsw
