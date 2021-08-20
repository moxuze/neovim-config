" === COMMAND ===
autocmd FileType markdown command! -nargs=0 MarkdownConceal call <SID>markdown_conceal()
function s:markdown_conceal()
  if &conceallevel == 0
    echomsg 'conceal level is 1'
    set conceallevel=1
  elseif &conceallevel == 1
    echomsg 'conceal level is 2'
    set conceallevel=2
  else
    echomsg 'conceal level is 0'
    set conceallevel=0
  endif
endfunction

" === OPTION ===
let g:vim_markdown_conceal = 1
let g:vim_markdown_new_list_item_indent = 2

" === TRIGGER ===
autocmd FileType markdown set conceallevel=2
