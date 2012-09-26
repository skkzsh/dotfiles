#!/bin/sh

# PowerPointに貼るLaTeX数式のEPS画像を作成

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
