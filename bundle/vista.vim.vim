" === OPTION ===
let g:vista_default_executive = 'coc'
let g:vista_disable_statusline = 1
let g:vista_no_mappings = 1
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
  \  'func': "\uf0ad",
  \  'function': "\uf0ad",
  \  'functions': "\uf0ad",
  \  'var': "\uf013",
  \  'variable': "\uf013",
  \  'variables': "\uf013",
  \  'const': "\uf8ff",
  \  'constant': "\uf8ff",
  \  'method': "\uf6ed",
  \  'package': "\uf8d5",
  \  'packages': "\uf8d5",
  \  'enum': "\ufbdf",
  \  'enumerator': "\uf7d7",
  \  'module': "\uf1b2",
  \  'modules': "\uf1b2",
  \  'type': "\uf779",
  \  'typedef': "\uf779",
  \  'types': "\uf779",
  \  'field': "\uf02b",
  \  'fields': "\uf02b",
  \  'macro': "\uf923",
  \  'macros': "\uf923",
  \  'map': "\uf84c",
  \  'class': "\ufd2f",
  \  'augroup': "\ufb44",
  \  'struct': "\uf085",
  \  'union': "\ufa63",
  \  'member': "\uf02b",
  \  'target': "\uf9fd",
  \  'property': "\uf02b",
  \  'interface': "\uf12e",
  \  'namespace': "\uf1b2",
  \  'subroutine': "\uf414",
  \  'implementation': "\uf639",
  \  'typeParameter': "\ufa35",
  \  'default': "\uf872",
  \}

" === KEYMAP ===
nnoremap <silent> <Leader>v :Vista!!<CR>
function s:settings() abort
nnoremap <buffer> <silent> <CR> :call <SID>jump()<CR>
nnoremap <buffer> <silent> o    :call <SID>fold()<CR>
nnoremap <buffer> <silent> p    :call vista#cursor#TogglePreview()<CR>
nnoremap <buffer> <silent> q    :close<CR>
endfunction
autocmd FileType vista,vista_kind call s:settings()

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
