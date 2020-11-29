" === OPTION ===
let g:lightline = {
  \  'colorscheme': 'Tomorrow_Night',
  \  'active': {
  \    'left': [
  \      [ 'mode', 'paste' ],
  \      [ 'filename', 'modified' ],
  \      [ 'gitbranch', 'nearest' ],
  \    ],
  \    'right': [
  \      [ 'lineinfo' ],
  \      [ 'percent' , 'filesize' ],
  \      [ 'readonly', 'fileformat', 'fileencoding', 'filetype' ],
  \    ],
  \  },
  \  'component_function': {
  \    'gitbranch': 'custom#lightline#git_branch',
  \    'nearest':   'custom#lightline#nearest',
  \    'readonly':  'custom#lightline#read_only',
  \    'filesize':  'custom#lightline#file_size',
  \  },
  \  'separator':    { 'left': '', 'right': '' },
  \  'subseparator': { 'left': '•', 'right': '•' },
  \}

" === FUNCTIONS ===
function! custom#lightline#git_branch() abort
  let l:branch = g:FugitiveHead()
  if strlen(l:branch) != 0
      let l:branch = ' ' . l:branch
  endif
  return l:branch
endfunction

function! custom#lightline#nearest() abort
  let l:nearest = get(b:, 'vista_nearest_method_or_function', '')
  if strlen(l:nearest) != 0
    let l:nearest = ' ' . l:nearest
  endif
  return l:nearest
endfunction

function! custom#lightline#read_only() abort
  return &readonly ? '' : ''
endfunction

function! custom#lightline#file_size() abort
  let l:size = getfsize(expand('%:p'))
  if l:size < 0
    return ''
  elseif l:size < 10240    " 10 * 1024
    return printf('%d B', l:size)
  elseif l:size < 10485760 " 10 * 1024 * 1024
    return printf('%.2f KiB', l:size / 1024.0)
  else
    return printf('%.2f MiB', l:size / 1048576.0)
  endif
endfunction
