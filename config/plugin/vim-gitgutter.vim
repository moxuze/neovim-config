" === OPTION ===
let g:gitgutter_map_keys = 0

" === APPEARANCE ===
function s:highlight() abort
highlight link GitGutterAdd          DiffAdd
highlight link GitGutterChange       DiffChange
highlight link GitGutterDelete       DiffDelete
highlight link GitGutterChangeDelete DiffText
endfunction
call s:highlight()
autocmd ColorScheme * call s:highlight()

" === KEY MAP ===
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
