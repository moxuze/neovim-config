" === OPTION ===
let g:lightline = {
  \  'colorscheme': 'Tomorrow_Night',
  \  'active': {
  \    'left': [
  \      [ 'mode', 'paste' ],
  \      [ 'filename' ],
  \      [ 'gitbranch', 'nearest' ],
  \    ],
  \    'right': [
  \      [ 'percent', 'lineinfo' ],
  \      [ 'filetype', 'filesize' ],
  \      [ 'readonly', 'fileformat', 'fileencoding' ],
  \    ],
  \  },
  \  'inactive': {
  \    'left' : [ [ 'filename' ] ],
  \    'right': [ [ 'percent', 'lineinfo' ], [ 'filetype', 'filesize' ] ]
  \  },
  \  'component' : {
  \    'filetype': '%{&ft!=#""?&ft:"plain"}',
  \    'readonly': '%{&readonly?"":""}',
  \    'lineinfo': '%2l:%-2c',
  \  },
  \  'component_function': {
  \    'filename' : 'custom#lightline#filename',
  \    'gitbranch': 'custom#lightline#gitbranch',
  \    'nearest'  : 'custom#lightline#nearest',
  \    'filesize' : 'custom#lightline#filesize',
  \  },
  \  'separator'   : { 'left': '', 'right': '' },
  \  'subseparator': { 'left': '।', 'right': '।' },
  \}


" === FUNCTIONS ===
function custom#lightline#hook(win_num, status_line) abort
  let l:file_type = getwinvar(a:win_num, '&filetype')
  if l:file_type == 'defx'
    call setwinvar(a:win_num, '&statusline', '%#LightlineLeft_active_1# [DEFX] %#LightlineMiddle_active#')
  elseif l:file_type == 'vista'
    call setwinvar(a:win_num, '&statusline', '%#LightlineLeft_active_1# [VISTA] %#LightlineMiddle_active#')
  else
    call setwinvar(a:win_num, '&statusline', a:status_line)
  endif
endfunction

function custom#lightline#filename() abort
  let l:name = expand('%:t')
  if l:name == '' | let l:name = '[No Name]' | endif
  return &modified ? l:name . ' +' : l:name
endfunction

function custom#lightline#gitbranch() abort
  let l:branch = g:FugitiveHead()
  return l:branch != '' ? ' ' . l:branch : ''
endfunction

function custom#lightline#nearest() abort
  let l:nearest = get(b:, 'vista_nearest_method_or_function', '')
  return l:nearest != '' ? '☭ ' . l:nearest : ''
endfunction

function custom#lightline#filesize() abort
  let l:size = getfsize(expand('%:p'))
  if l:size < 0
    return ''
  elseif l:size < 10240    " 10 * 1024
    return printf('%dB', l:size)
  elseif l:size < 10485760 " 10 * 1024 * 1024
    return printf('%.2fKiB', l:size / 1024.0)
  else
    return printf('%.2fMiB', l:size / 1048576.0)
  endif
endfunction
