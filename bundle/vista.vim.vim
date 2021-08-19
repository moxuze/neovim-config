" === OPTION ===
let g:vista_default_executive = 'coc'
let g:vista_disable_statusline = 1
let g:vista_no_mappings = 1
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
  \  'augroup'       : "\ufb44",
  \  'class'         : "\ufd2f",
  \  'const'         : "\uf8ff",
  \  'constant'      : "\uf8ff",
  \  'default'       : "\uf872",
  \  'enum'          : "\ufbdf",
  \  'enumerator'    : "\uf7d7",
  \  'field'         : "\uf02b",
  \  'fields'        : "\uf02b",
  \  'func'          : "\uf0ad",
  \  'function'      : "\uf0ad",
  \  'functions'     : "\uf0ad",
  \  'implementation': "\uf639",
  \  'interface'     : "\uf12e",
  \  'macro'         : "\uf923",
  \  'macros'        : "\uf923",
  \  'map'           : "\uf84c",
  \  'member'        : "\uf02b",
  \  'method'        : "\uf6ed",
  \  'module'        : "\uf1b2",
  \  'modules'       : "\uf1b2",
  \  'namespace'     : "\uf1b2",
  \  'package'       : "\uf8d5",
  \  'packages'      : "\uf8d5",
  \  'property'      : "\uf02b",
  \  'struct'        : "\uf085",
  \  'subroutine'    : "\uf414",
  \  'target'        : "\uf9fd",
  \  'type'          : "\uf779",
  \  'typedef'       : "\uf779",
  \  'typeParameter' : "\ufa35",
  \  'types'         : "\uf779",
  \  'union'         : "\ufa63",
  \  'var'           : "\uf013",
  \  'variable'      : "\uf013",
  \  'variables'     : "\uf013",
  \}

" === KEYMAP ===
nnoremap <silent> <Leader>v :Vista!!<CR>
function s:settings() abort
nnoremap <buffer> <silent> <CR> :call <SID>jump()<CR>
nnoremap <buffer> <silent> o    :call <SID>fold()<CR>
nnoremap <buffer> <silent> p    :call vista#cursor#TogglePreview()<CR>
nnoremap <buffer> <silent> q    :close<CR>
endfunction
autocmd FileType vista,vista_kind,vista_markdown call s:settings()

" === FUNCTION ===
function s:jump() abort
  if line('.') == 1
    call vista#source#GotoWin()
  else
    let l:tag_under_cursor = g:vista.provider ==# 'ctags' ?
      \  vista#cursor#ctags#GetInfo()[0] : vista#cursor#lsp#GetInfo()[0]
    call vista#jump#TagLine(l:tag_under_cursor)
  endif
endfunction

function s:fold() abort
  if empty(getline('.'))
    return 0
  else
    if s:try_fold()
      return 1
    else
      normal zMzR
      return s:try_fold()
    endif
  endif
endfunction

function s:try_fold() abort
  if foldclosed('.') != -1
    normal zo
    return 1
  elseif foldlevel('.') != 0
    normal zc
    return 1
  else
    return 0
  endif
endfunction
