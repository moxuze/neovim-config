" === APPEARANCE ===
let g:clap_enable_icon = 1
let g:clap_enable_background_shadow = 0
let g:clap_theme = {
  \  'display'    : { 'ctermbg': '236' },
  \  'bg0'        : { 'ctermbg': '60'  },
  \  'input'      : { 'ctermbg': '60'  },
  \  'indicator'  : { 'ctermbg': '60', 'ctermfg': '238' },
  \  'spinner'    : { 'ctermbg': '60', 'ctermfg': '123', 'cterm': 'bold' },
  \  'search_text': { 'ctermbg': '60', 'ctermfg': '195', 'cterm': 'bold' },
  \  'preview'    : { 'ctermbg': '237' },
  \  'selected'              : { 'ctermfg': '81' , 'cterm': 'bold,underline' },
  \  'current_selection'     : { 'ctermbg': '236', 'cterm': 'bold' },
  \  'selected_sign'         : { 'ctermfg': '171' },
  \  'current_selection_sign': { 'ctermfg': '171' },
  \}

" === KEY MAP ===
nnoremap <silent> <A-g> :Clap<CR>
autocmd FileType clap_input inoremap <silent><buffer> <A-j>   <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent><buffer> <TAB>   <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent><buffer> <A-k>   <C-R>=clap#navigation#linewise('up')<CR>
autocmd FileType clap_input inoremap <silent><buffer> <S-TAB> <C-R>=clap#navigation#linewise('up')<CR>
autocmd FileType clap_input inoremap <silent><buffer> <A-h>   <C-R>=clap#navigation#scroll('up')<CR>
autocmd FileType clap_input inoremap <silent><buffer> <A-l>   <C-R>=clap#navigation#scroll('down')<CR>
