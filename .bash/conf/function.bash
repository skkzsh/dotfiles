### Functions

## Dropbox
dbs() {
    case "`dropbox status`" in
        "Dropbox isn't running!") dropbox start -i ;; # 未起動ならば起動
        *) dropbox status ;; # でなければ状態を表示
    esac
}


## Git RepositoryのTopへcd
gtop() {
    cd $(git rev-parse --show-toplevel)
}
