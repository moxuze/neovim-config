" === COMMAND ===
autocmd FileType markdown command! -nargs=0 MarkdownConceal call <SID>markdown_conceal()
function s:markdown_conceal()
  if (&conceallevel == 0)
    echomsg 'conceal level is 1'
    set conceallevel=1
  elseif (&conceallevel == 1)
    echomsg 'conceal level is 2'
    set conceallevel=2
  else
    echomsg 'conceal level is 0'
    set conceallevel=0
  endif
endfunction

" === OPTION ===
let g:markdown_enable_conceal = 1
let g:markdown_enable_mappings = 0
let g:markdown_enable_spell_checking = 0
let g:markdown_include_jekyll_support = 0
