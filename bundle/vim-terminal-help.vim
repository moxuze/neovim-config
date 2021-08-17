" === OPTION ===
let g:terminal_default_mapping = 0

" === KEYMAP ===
nnoremap <silent> <M-=> :call TerminalToggle()<CR>
tnoremap <silent> <M-=> <C-\><C-n>:call TerminalToggle()<CR>
