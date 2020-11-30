" === OPTION ===
let g:vista_default_executive = 'ctags'
let g:vista_no_mappings=1

" === KEY MAP ===
nnoremap <silent> <A-m> :Vista!!<CR>
autocmd FileType vista,vista_kind call custom#vista#settings() abort
function! custom#vista#settings()
nnoremap <buffer> <silent> q    :close<CR>
nnoremap <buffer> <silent> <CR> :call vista#cursor#FoldOrJump()<BAR>doautocmd WinEnter<CR>
nnoremap <buffer> <silent> s    :call vista#Sort()<CR>
nnoremap <buffer> <silent> p    :<c-u>call vista#cursor#TogglePreview()<CR>
endfunction
