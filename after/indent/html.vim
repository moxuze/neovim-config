execute 'source ' . expand('<sfile>:p:h') . '/template/width_2.vim'
" Hack Indent Width
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let b:hi_js1indent = 'lnum == b:hi_indent.blocklnr ? b:hi_indent.blocktagind + shiftwidth() : 0'
