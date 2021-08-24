" === COMMAND ===
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
autocmd FileType markdown command! -nargs=0 MarkdownConceal call <SID>markdown_conceal()

" === KEYMAP ===
autocmd FileType racket nmap <buffer> K <Plug>RacketDoc

" === OPTION ===
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vue_pre_processors = 'detect_on_enter'

" === TRIGGER ===
autocmd FileType markdown set conceallevel=2
autocmd FileType racket let b:undo_ftplugin =
  \  "setl iskeyword< lispwords< lisp< comments< formatoptions<"
  \. "| setl makeprg< commentstring<"
