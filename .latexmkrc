# -*- cperl -*-
# vim: filetype=perl

$latex  = 'platex -kanji=euc';
$latex_silent  = 'platex -kanji=euc -interaction=batchmode';
$bibtex = 'jbibtex';
$makeindex  = 'mendex';
$dvipdf  = 'dvipdfmx';
$dvips  = 'dvipsk';

if($^O eq "linux") { 
	$dvi_previewer ='xdvi';
	$pdf_previewer = 'apvlv';
} elsif($^O eq "darwin") { 
	$dvi_previewer ='open -a Mxdvi';
	$pdf_previewer = 'open -a Preview';
} elsif($^O eq "MSWin32") { 
	$dvi_previewer ='dviout';
#	$pdf_previewer = '';
}
