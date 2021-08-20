" === APPEARANCE ===
let s:themes = { 'dark': 'atom_dark', 'light': 'solarized_light' }
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_enable_background_shadow = 1
let g:clap_theme = &background ==# 'dark' ? s:themes.dark : s:themes.light

" === KEYMAP ===
nnoremap <Leader>fb :Clap bcommits<CR>
nnoremap <Leader>fc :Clap commits<CR>
nnoremap <Leader>fd :Clap git_diff_files<CR>
nnoremap <Leader>ff :Clap files<CR>
nnoremap <Leader>fg :Clap grep2<CR>
nnoremap <Leader>fh :Clap history<CR>
nnoremap <Leader>fl :Clap blines<CR>
nnoremap <Leader>ft :Clap tags<CR>
nnoremap <Leader>fw :Clap grep2 ++query=<cword><CR>
nnoremap <Leader>fy :Clap yanks<CR>
vnoremap <Leader>f  :Clap grep2 ++query=@visual<CR>

" === FUNCTION ===
function g:UpdateColorClap() abort
  let g:clap_theme = &background ==# 'dark' ? s:themes.light : s:themes.dark
  call clap#themes#init()
endfunction
