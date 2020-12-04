" === OPTION ===
" Extension List
let g:coc_global_extensions = [
  \  'coc-actions',
  \  'coc-json',
  \  'coc-marketplace',
  \  'coc-rust-analyzer',
  \  'coc-tsserver',
  \  'coc-vimlsp',
  \]

" === TRIGGER ===
" Highlight Symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

" === KEY MAP ===
" Completion
inoremap <silent><expr> <A-c>   coc#refresh()
inoremap <silent><expr> <TAB>   pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr> <S-TAB> pumvisible() ? '<C-p>' : '<S-TAB>'
inoremap <silent><expr> <CR>    pumvisible() ?
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
nnoremap <silent> <A-f> :call CocAction('format')<CR>
vmap <silent> <A-f> <Plug>(coc-format-selected)

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
nnoremap <silent> K :call custom#coc#show_doc()<CR>
function custom#coc#show_doc() abort
  if (index([ 'vim', 'help' ], &filetype) >= 0)
    execute 'rightbelow vertical help ' . expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . ' ' . expand('<cword>')
  endif
endfunction

" Coc Actions
xnoremap <silent> <A-a> :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nnoremap <silent> <A-a> :<C-u>set operatorfunc=custom#coc#actions<CR>g@
" see :help text-objects
" w => word, as => sentence, ap => paragraph
function custom#coc#actions(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
