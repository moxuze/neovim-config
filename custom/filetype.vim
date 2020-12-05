" Indent
function custom#filetype#set_width(width, lang) abort
  execute 
    \  printf('autocmd FileType %s setlocal tabstop=%d softtabstop=%d shiftwidth=%d',
    \  a:lang, a:width, a:width, a:width)
endfunction

call custom#filetype#set_width(2, 'sh')
call custom#filetype#set_width(2, 'vim')

call custom#filetype#set_width(4, 'c')
call custom#filetype#set_width(4, 'cpp')
call custom#filetype#set_width(4, 'java')
call custom#filetype#set_width(4, 'python')
" Rust has been setup in the plugin rust.vim
"call custom#filetype#set_width(4, 'rust')

call custom#filetype#set_width(4, 'html')
call custom#filetype#set_width(4, 'css')
call custom#filetype#set_width(4, 'javascript')
call custom#filetype#set_width(4, 'json')

" Syntax
" C/C++
autocmd FileType c,cpp syntax keyword cOperator  struct typedef union enum
autocmd FileType c,cpp syntax match   cOperator	 '\(<<\|>>\|[-+*/%&^|<>!=]\)='
autocmd FileType c,cpp syntax match   cOperator	 '<<\|>>\|&&\|||\|++\|--'
autocmd FileType c,cpp syntax match   cOperator	 '[?:!~*&%<>^|=+-]'
autocmd FileType c,cpp syntax match   cOperator	 '/[^/*=]'me=e-1
autocmd FileType c,cpp syntax match   CustomGrey '->\|[.,;{}()\[\]]'
