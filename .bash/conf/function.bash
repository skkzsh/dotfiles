### Functions

## Dropbox
dbs() {
    case "`dropbox status`" in
        "Dropbox isn't running!") dropbox start -i ;; # $BL$5/F0$J$i$P5/F0(B
        *) dropbox status ;; # $B$G$J$1$l$P>uBV$rI=<((B
    esac
}


## Git Repository$B$N(BTop$B$X(Bcd
gtop() {
    cd $(git rev-parse --show-toplevel)
}
