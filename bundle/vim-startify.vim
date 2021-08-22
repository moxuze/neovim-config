" === OPTION ===
function s:git_modified() abort
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function s:git_untracked() abort
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_padding_left = {a, b -> a > b ? a : b}(winwidth(0) / 2 - 30, 3)
let s:spaces = repeat(' ', g:startify_padding_left - 3)
let g:startify_lists = [
  \  { 'type': 'files'                    , 'header': [s:spaces . 'MRU'           ]},
  \  { 'type': 'dir'                      , 'header': [s:spaces . 'MRU '. getcwd()]},
  \  { 'type': 'sessions'                 , 'header': [s:spaces . 'Sessions'      ]},
  \  { 'type': 'bookmarks'                , 'header': [s:spaces . 'Bookmarks'     ]},
  \  { 'type': function('s:git_modified' ), 'header': [s:spaces . 'git modified'  ]},
  \  { 'type': function('s:git_untracked'), 'header': [s:spaces . 'git untracked' ]},
  \  { 'type': 'commands'                 , 'header': [s:spaces . 'Commands'      ]},
  \]

" === TRIGGER ===
autocmd FileType startify setlocal nowrap
