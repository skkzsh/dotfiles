#!/usr/bin/env bash

: << POD

=head1 NAME

diffutf8 - diff after filtering to UTF-8 (nkf -w)

=head1 SYNOPSIS

diffutf8 file1 file2

=cut
POD

## Var
opt='-u'

# if which git > /dev/null 2>&1 ; then
#     diff_cmd='git diff --no-index'
if which colordiff > /dev/null 2>&1 ; then
    diff_cmd="colordiff $opt"
else
    diff_cmd="diff $opt"
fi

declare -a utf8_filtered

## Exception Handling
# trap 'exit 0' EXIT
# trap 'exit 1' ERR     # NOTE: diffで差分がある場合も補足しているので, 注意

## Filtering to UTF-8
for file in $@ ; do
    utf8_filtered+=( "<( nkf -w $file )" )
done

## Diff
# echo ${utf8_filtered[@]} # Debug
diff_utf8="$diff_cmd ${utf8_filtered[@]}"

if which diff-highlight > /dev/null 2>&1 ; then
    eval $diff_utf8 | diff-highlight
else
    eval $diff_utf8
fi

