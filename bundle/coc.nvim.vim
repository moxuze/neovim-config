" === OPTION ===
" Extension List
let g:coc_config_home = g:env.bundle.config
let g:coc_data_home   = g:env.cache . '/coc'
let g:coc_global_extensions = [
  \  'coc-css',
  \  'coc-html',
  \  'coc-jedi',
  \  'coc-json',
  \  'coc-markdownlint',
  \  'coc-marketplace',
  \  'coc-rust-analyzer',
  \  'coc-sh',
  \  'coc-snippets',
  \  'coc-toml',
  \  'coc-tsserver',
  \  'coc-vetur',
  \  'coc-vimlsp',
  \]

" Additional coc-settings
call coc#config('snippets.userSnippetsDirectory', g:env.config . '/snippet')
call coc#config('languageserver.ccls.initializationOptions.cache',
  \  { 'directory': g:env.cache . '/ccls' })

" === TRIGGER ===
" Highlight Symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

" Signature
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" === KEYMAP ===
" Completion & Snippet
let g:coc_snippet_prev = '<S-Tab>'
let g:coc_snippet_next = '<Tab>'
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ?
  \  coc#_select_confirm() : '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
inoremap <silent><expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
inoremap <silent><expr> <Tab> pumvisible() ? '<C-n>' : coc#expandableOrJumpable() ?
  \  '<C-r>=coc#rpc#request("doKeymap", ["snippets-expand-jump", ""])<CR>' : '<Tab>'

" Float Window
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Code
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)

" Renaming
nmap <silent> <Leader>n <Plug>(coc-rename)

" Formating
nnoremap <silent> <Leader>F :call CocAction('format')<CR>
vmap <silent> <Leader>F <Plug>(coc-format-selected)

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
  if index(['vim', 'help'], &filetype) >= 0
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . ' ' . expand('<cword>')
  endif
endfunction
