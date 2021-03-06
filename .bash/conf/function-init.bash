# Functions
# NOTE: source this file in .zshrc

#---------------------------------------------------------------------------
## Dropbox
# if which dropbox > /dev/null 2>&1 ; then
#     dbs() {
#         case "$(dropbox status)" in
#             "Dropbox isn't running!") dropbox start -i ;; # 未起動ならば起動
#             *) dropbox status ;; # でなければ状態を表示
#         esac
#     }
# fi

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
# gpgr() {
#     if [[ -f $1 ]] ; then
#         case "$1" in
#             *\.tar\.gpg)
#                 # Decrypt directory
#                 gpg -o- "$1" | tar xvf -
#                 ;;
#             *\.*\.gpg)
#                 # Decrypt file
#                 gpg "$1"
#                 ;;
#             *)
#                 # Encrypt file
#                 gpg -c "$1"
#                 ;;
#         esac
#
#     elif [[ -d $1 ]] ; then
#         # Encrypt directory
#         tar cf - "$1" | gpg -c -o "$1.tar.gpg"
#     else
#         echo 'Error!' >&2
#         return 1
#     fi
#     # &&
#
#     # Remove source file
#     # rm -rf $1
# }

## OpenSSL
# alias osa='openssl aes-256-cbc'
# osr() {
#     if [[ -f $1 ]] ; then
#         case "$1" in
#             *\.tgz\.*|*\.tar\.gz\.*)
#                 # Decrypt directory
#                 osa -d -in "$1" | tar zxvf -
#                 ;;
#             *\.*\.*)
#                 # Decrypt file
#                 osa -d -in "$1" -out "${1%.*}"
#                 ;;
#             *)
#                 # Encrypt file
#                 osa -e -in "$1" -out "$1.enc"
#                 ;;
#         esac
#
#     elif [[ -d $1 ]] ; then
#         # Encrypt directory
#         tar zcf - "$1" | osa -e -out "$1.tgz.enc"
#     else
#         echo 'Error!' >&2
#         return 1
#     fi
#     # &&
#
#     # Remove source file
#     # rm -rf $1
# }
