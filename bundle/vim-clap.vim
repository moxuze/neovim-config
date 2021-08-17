" === APPEARANCE ===
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_enable_background_shadow = 0
let g:clap_theme = {
  \  'display'    : { 'ctermbg': '236' },
  \  'bg0'        : { 'ctermbg': '239' },
  \  'input'      : { 'ctermbg': '239' },
  \  'indicator'  : { 'ctermbg': '239', 'ctermfg': '210' },
  \  'spinner'    : { 'ctermbg': '239', 'ctermfg': '203', 'cterm': 'bold' },
  \  'search_text': { 'ctermbg': '239', 'ctermfg': '214', 'cterm': 'bold' },
  \  'preview'    : { 'ctermbg': '237' },
  \  'current_selection'     : { 'ctermbg': '237', 'ctermfg': '108', 'cterm': 'bold' },
  \  'current_selection_sign': { 'ctermfg': '110' },
  \}

" === KEY MAP ===
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
