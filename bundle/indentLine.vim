" === OPTION ===
function s:indent_char_in_listchars(default)
  let l:tab = matchstr(&listchars, 'tab:.')
  if strlen(l:tab) == 0
    return a:default
  else
    return strpart(l:tab, 4)
  endif
endfunction

let g:indentLine_char = s:indent_char_in_listchars('¦')
let g:indentLine_fileTypeExclude = ['', 'help', 'markdown']
let g:indentLine_first_char = g:indentLine_char
let g:indentLine_showFirstIndentLevel = 1
