# -*- cperl -*-
# vim: filetype=perl

$latex  = 'platex -kanji=euc';
# $latex  = 'platex -kanji=euc %O %S';
$latex_silent  = 'platex -kanji=euc -interaction=batchmode';
$bibtex = 'bibtex';
# $bibtex = 'bibtex %O %B';
# $bibtex = 'jbibtex';
$makeindex  = 'mendex';
# $dvipdf  = 'dvipdfmx';
$dvipdf  = 'dvipdfmx %O %S';
$dvips  = 'dvipsk';
# $pdf_mode = 3;

if($^O eq "linux") {
    $dvi_previewer ='xdvi';
    $pdf_previewer = 'apvlv';
} elsif($^O eq "darwin") {
    $dvi_previewer ='open -a Mxdvi';
    $pdf_previewer = 'open -a Preview';
} elsif($^O eq "MSWin32") {
    $dvi_previewer ='dviout';
    # $pdf_previewer = '';
}
