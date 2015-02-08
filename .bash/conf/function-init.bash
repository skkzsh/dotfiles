# Functions
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
## Dropbox
dbs() {
    case "$(dropbox status)" in
        "Dropbox isn't running!") dropbox start -i ;; # 未起動ならば起動
        *) dropbox status ;; # でなければ状態を表示
    esac
}

## Git RepositoryのTopへcd
gtop() {
    cd $(git rev-parse --show-toplevel)
}

take() {
    mkdir -p $1 &&
    cd $1
}

#---------------------------------------------------------------------------
## XXX: Many Arguments
## GnuPG
alias gpga='gpg -c --cipher-algo aes256'
gpgr() {
    if [[ -f $1 ]] ; then
        case "$1" in
            *\.tgz\.gpg|*\.tar\.gz\.gpg)
                # Decrypt directory
                gpg -o- "$1" | tar zxvf -
                ;;
            *\.*\.gpg)
                # Decrypt file
                gpg "$1"
                ;;
            *)
                # Encrypt file
                gpga "$1"
                ;;
        esac

    elif [[ -d $1 ]] ; then
        # Encrypt directory
        tar zcf - "$1" | gpga -o "$1.tgz.gpg"
    else
        echo 'Error!' >&2
        return 1
    fi
    # &&

    # Remove source file
    # rm -rf $1
}

## OpenSSL
alias osa='openssl aes-256-cbc'
osr() {
    if [[ -f $1 ]] ; then
        case "$1" in
            *\.tgz\.*|*\.tar\.gz\.*)
                # Decrypt directory
                osa -d -in "$1" | tar zxvf -
                ;;
            *\.*\.*)
                # Decrypt file
                osa -d -in "$1" -out "${1%.*}"
                ;;
            *)
                # Encrypt file
                osa -e -in "$1" -out "$1.enc"
                ;;
        esac

    elif [[ -d $1 ]] ; then
        # Encrypt directory
        tar zcf - "$1" | osa -e -out "$1.tgz.enc"
    else
        echo 'Error!' >&2
        return 1
    fi
    # &&

    # Remove source file
    # rm -rf $1
}
