#!/bin/sh
: << POD
=head1 SYNOPSIS

Make a EPS Image
of LaTeX Numerical Expression
for PowerPoint

=cut
POD

file=${1%.tex}

platex ${file}.tex &&
dvips -Ppdf -E ${file} -o ${file}_tmp.eps &&
eps2eps -r10000 ${file}_tmp.eps ${file}.eps
#rm ${file}_tmp.eps

### $file.tex
# \documentclass[30pt]{jsarticle}
# \pagestyle{empty}
# \begin{document}
# \[
#
# \]
# \end{document}
