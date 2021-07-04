if (expand('%:p') =~# '^/usr/include/c++')
  setlocal nolist
  setlocal noexpandtab
  setlocal nosmarttab
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=8
else
  execute 'source ' . expand('<sfile>:p:h') . '/template/width_4.vim'
endif
