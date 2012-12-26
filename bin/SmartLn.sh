: << POD

=head1 NAME

SmartLn - Make Symbolic Link or Copy Carefully

=head1 SYNOPSIS

    . SmartLn.sh

    # Make Symbolic Link from Source to Destination
    SmartLn ln 'source' 'destination1'

    # Copy from Source to Destination
    SmartLn cp 'source' 'destination2'

=head1 DESCRIPTION

This shell script enables you to
make a symbolic link or copy a file
only if the source file exists and
you agree to remove the distination file.

=cut
POD

#### TODO: Error処理をちゃんと書く

smartln_path=$0

SmartLn() {

    ### 引数が3個でなければError
    if [ $# -ne 3 ]; then
        echo "Error      : No. of arguments must be 3." >&2
        pod2usage $smartln_path
        return 1
    fi

    ### Name Arguments
    local cmd="$1"
    local src="$2"
    local dst="$3"

    ### Exception Handling
    ## Commandが有効でなければError
    if [ "$cmd" != ln -a  "$cmd" != cp ]; then
        echo "Error      : Invalid Option $cmd" >&2
        pod2usage $smartln_path
        return 1
    fi
    ## Link元が存在しなければError
    if [ ! -e "$src" ]; then
        echo "Error      : Source $src not exists." >&2
        pod2usage $smartln_path
        return 1
    fi

    ### Link先が存在すれば削除
    if [ -L "$dst" -o -f "$dst" ]; then
        rm "$dst" &&
        echo "Removed"
    elif [ -d "$dst" ]; then
        rm -r "$dst" &&
        echo "Removed"
    else
        echo "Announce   : Try to remove $dst, but not exists."
    fi

    ### Symbolic Link or Copy
    if [ -e "$dst" ]; then
        echo "Announce   : $dst exists, so not make link."
    elif [ "$cmd" = ln ]; then
        ln -s "$src" "$dst" &&
        echo "New Linked"
    elif [ "$cmd" = cp ]; then
        if [ -d "$src" ]; then
            cp -r "$src" "$dst"
        else
            cp "$src" "$dst"
        fi &&
        echo "Copied"
    else
        echo "Error      : Invalid Option $cmd" >&2
        pod2usage $smartln_path
    fi

    return 0
}
