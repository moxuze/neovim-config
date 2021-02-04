" === OPTION ===
" Extension List
let g:coc_config_home = g:env.config
let g:coc_global_extensions = [
  \  'coc-json',
  \  'coc-marketplace',
  \  'coc-rust-analyzer',
  \  'coc-toml',
  \  'coc-tsserver',
  \  'coc-vimlsp',
  \]

" === TRIGGER ===
" Highlight Symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

" === KEY MAP ===
" Snippet
let g:coc_snippet_prev = '<C-h>'
let g:coc_snippet_next = '<C-l>'

" Completion
inoremap <silent><expr> <C-SPACE> coc#refresh()
inoremap <silent><expr> <C-j>     pumvisible() ? '<C-n>' : '<C-j>'
inoremap <silent><expr> <TAB>     pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr> <C-k>     pumvisible() ? '<C-p>' : '<C-k>'
inoremap <silent><expr> <S-TAB>   pumvisible() ? '<C-p>' : '<S-TAB>'
inoremap <silent><expr> <CR>      pumvisible() ?
  \  coc#_select_confirm() : '<C-g>u<CR><c-r>=coc#on_enter()<CR>'

" Code Navigation
nnoremap gb <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)

" Renaming
nmap <silent> <A-r> <Plug>(coc-rename)

" Formating
nnoremap <silent> <A-F> :call CocAction('format')<CR>
vmap <silent> <A-F> <Plug>(coc-format-selected)

" Selection
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Documentation
nnoremap <silent> K :call <SID>show_doc()<CR>
function s:show_doc() abort
  if (index([ 'vim', 'help' ], &filetype) >= 0)
    execute 'rightbelow vertical help ' . expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . ' ' . expand('<cword>')
  endif
endfunction
