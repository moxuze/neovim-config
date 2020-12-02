" === OPTION ===
" Extension List
let g:coc_global_extensions = [
  \  'coc-git',
  \  'coc-json',
  \  'coc-marketplace',
  \  'coc-rust-analyzer',
  \  'coc-tsserver',
  \  'coc-vimlsp',
  \]

" === APPEARANCE ===
highlight CocErrorFloat ctermfg=Red guifg=Red

" === TRIGGER ===
" Highlight Symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

" === KEY MAP ===
" Code Navigation
nnoremap gb <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)
vmap <silent> <A-f> <Plug>(coc-format-selected)

" Show Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'rightbelow vertical help ' . expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . ' ' . expand('<cword>')
  endif
endfunction

" Symbol Renaming
nmap <silent> <A-r><A-n> <Plug>(coc-rename)

" Completion
inoremap <silent><expr> <A-f>   coc#refresh()
inoremap <silent><expr> <TAB>   pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr> <S-TAB> pumvisible() ? '<C-p>' : '<S-TAB>'
inoremap <silent><expr> <CR>    pumvisible() ?
  \  coc#_select_confirm() : '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
