" === OPTION ===
let g:vista_default_executive = 'ctags'
let g:vista_no_mappings = 1
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
  \  'constant': "\uf8fe",
  \  'enum': "\uf435",
  \  'function': "\u0192",
  \  'interface': "\uf417",
  \  'module': "\uf40d",
  \  'property': "\ue60b",
  \  'struct': "\ufb44",
  \  'typeParameter': "\uf728",
  \}

" === KEY MAP ===
nnoremap <silent> <A-m> :Vista!!<CR>
function s:settings() abort
nnoremap <buffer> <silent> <CR> :call <SID>fold_or_jump()<CR>
nnoremap <buffer> <silent> o    :call <SID>fold()<CR>
nnoremap <buffer> <silent> s    :call vista#Sort()<CR>
nnoremap <buffer> <silent> p    :call vista#cursor#TogglePreview()<CR>
nnoremap <buffer> <silent> q    :close<CR>
endfunction
autocmd FileType vista,vista_kind call s:settings()

" === FUNCTION ===
function s:fold_or_jump() abort
  if line('.') == 1
    call vista#source#GotoWin()
  elseif indent('.') != 0 || !s:fold()
    let l:tag_under_cursor = g:vista.provider ==# 'ctags' ?
      \  vista#cursor#ctags#GetInfo()[0] : vista#cursor#lsp#GetInfo()[0]
    call vista#jump#TagLine(l:tag_under_cursor)
    doautocmd WinEnter __vista_update_lightline__
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
