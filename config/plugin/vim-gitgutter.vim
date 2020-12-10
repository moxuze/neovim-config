" === OPTION ===
let g:gitgutter_map_keys = 0

" === APPEARANCE ===
function s:highlight() abort
highlight link GitGutterAdd    DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
endfunction
call s:highlight()
autocmd ColorScheme * call s:highlight()
