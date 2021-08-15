" === OPTION ===
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0

" === Key Map ===
nnoremap <Leader>r :Ranger<CR>

" === TRIGGER ===
autocmd TermOpen term://*[0-9]{1,}:ranger* setlocal norelativenumber nonumber signcolumn=no
