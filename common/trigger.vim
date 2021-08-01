" Last Positon
autocmd BufReadPost * call setpos('.', getpos('''"'))

" Terminal
autocmd TermOpen * setlocal nonumber signcolumn=no
