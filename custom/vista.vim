" === OPTION ===
let g:vista_default_executive = 'ctags'
let g:vista_no_mappings=1

" === KEY MAP ===
nnoremap <silent> <A-m> :Vista!!<CR>
autocmd FileType vista,vista_kind call custom#vista#settings()
function custom#vista#settings() abort
nnoremap <buffer> <silent> <A-CR> zMzR
nnoremap <buffer> <silent> <CR>   :call vista#cursor#FoldOrJump()<BAR>doautocmd WinEnter __vista_lightline__<CR>
nnoremap <buffer> <silent> s      :call vista#Sort()<CR>
nnoremap <buffer> <silent> p      :<c-u>call vista#cursor#TogglePreview()<CR>
nnoremap <buffer> <silent> q      :close<CR>
endfunction
