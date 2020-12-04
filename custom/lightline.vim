" === OPTION ===
let g:lightline = {
  \  'colorscheme': 'Tomorrow_Night',
  \  'active': {
  \    'left': [
  \      [ 'mode', 'paste' ],
  \      [ 'filestatus' ],
  \      [ 'gitstatus' ],
  \    ],
  \    'right': [
  \      [ 'percent', 'lineinfo' ],
  \      [ 'filetype', 'filesize' ],
  \      [ 'nearest', 'readonly', 'fileformat', 'fileencoding' ],
  \    ],
  \  },
  \  'inactive': {
  \    'left' : [ [ 'filestatus' ] ],
  \    'right': [ [ 'percent', 'lineinfo' ], [ 'filetype', 'filesize' ] ],
  \  },
  \  'component' : {
  \    'filetype': '%{empty(&ft)?"plain":&ft}',
  \    'readonly': '%{&readonly?"":""}',
  \    'lineinfo': '%2l:%-2c',
  \  },
  \  'component_function': {
  \    'filestatus': 'custom#lightline#file_status',
  \    'filesize'  : 'custom#lightline#file_size',
  \    'gitstatus' : 'custom#lightline#git_status',
  \    'nearest'   : 'custom#lightline#nearest_function',
  \  },
  \  'tab_component_function': {
  \    'filename': 'custom#lightline#tab_file_name',
  \    'modified': 'custom#lightline#tab_modified',
  \  },
  \  'separator'   : { 'left': '', 'right': '' },
  \  'subseparator': { 'left': '।', 'right': '।' },
  \}

" === FUNCTIONS ===
function custom#lightline#hook(win_num, status_line) abort
  let l:name = expand('#' . winbufnr(a:win_num) . ':t')
  if l:name =~# '^\[defx\] -\d$'
    call setwinvar(a:win_num, '&statusline',
    \ '%#LightlineLeft_active_1# [DEFX] %#LightlineMiddle_active#')
  elseif l:name ==# '__vista__'
    call setwinvar(a:win_num, '&statusline',
    \ '%#LightlineLeft_active_1# [VISTA] %#LightlineMiddle_active#')
  else
    call setwinvar(a:win_num, '&statusline', a:status_line)
  endif
endfunction

function custom#lightline#file_status() abort
  let l:name = expand('%:t')
  if empty(l:name) | let l:name = '[No Name]' | endif
  return &modified ? l:name . ' +' : l:name
endfunction

function custom#lightline#file_size() abort
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

function custom#lightline#tab_file_name(tab_num) abort
  let l:buf_list = tabpagebuflist(a:tab_num)
  let l:win_num = tabpagewinnr(a:tab_num)
  let l:name = expand('#' . l:buf_list[l:win_num - 1] . ':t')
  if empty(l:name)
    return '[No Name]'
  elseif l:name =~# '^\[defx\] -\d$'
    return '[DEFX]'
  elseif l:name ==# '__vista__'
    return '[VISTA]'
  else
    return l:name
  endif
endfunction

function custom#lightline#tab_modified(tab_num) abort
  let l:win_num = tabpagewinnr(a:tab_num)
  return gettabwinvar(a:tab_num, l:win_num, '&modified') ? '+' : ''
endfunction

function custom#lightline#git_status() abort
  if !exists('*g:FugitiveHead') | return '' | endif
  let l:branch = g:FugitiveHead()
  if empty(l:branch) | return '' | endif
  let l:branch = ' ' . l:branch
  if !exists('*g:GitGutterGetHunkSummary') | return l:branch | endif
  let [l:a, l:m, l:r] = g:GitGutterGetHunkSummary()
  if l:a == 0 && l:m == 0 && l:r == 0
    return l:branch
  else
    return printf('%s [+%d ~%d -%d]', l:branch, l:a, l:m, l:r)
  endif
endfunction

function custom#lightline#nearest_function() abort
  let l:func = get(b:, 'vista_nearest_method_or_function', '')
  return empty(l:func) ? '' : 'ƒ ' . l:func
endfunction
