" === OPTION ===
let g:lightline = {
  \  'colorscheme': 'jellybeans',
  \  'active': {
  \    'left': [
  \      ['mode', 'paste'],
  \      ['filestatus'],
  \      ['gitstatus'],
  \    ],
  \    'right': [
  \      ['percent', 'lineinfo'],
  \      ['filetype', 'filesize'],
  \      ['readonly', 'fileformat', 'fileencoding'],
  \    ],
  \  },
  \  'inactive': {
  \    'left' : [['filestatus']],
  \    'right': [['percent', 'lineinfo'], ['filetype', 'filesize']],
  \  },
  \  'component' : {
  \    'filetype': '%{empty(&ft)?"plain":&ft}',
  \    'readonly': '%{&readonly?"":""}',
  \    'lineinfo': '%2l:%-2c',
  \  },
  \  'component_function': {
  \    'filestatus': 'g:CustomLightlineFileState',
  \    'filesize'  : 'g:CustomLightlineFileSize',
  \    'gitstatus' : 'g:CustomLightlineGitStatus',
  \  },
  \  'separator'   : { 'left': '', 'right': '' },
  \  'subseparator': { 'left': '।', 'right': '।' },
  \}

" === FUNCTION ===
function g:CustomLightlineFileState() abort
  let l:file_name = expand('%:t')
  if empty(l:file_name) | let l:file_name = '[No Name]' | endif
  return &modified ? l:file_name . ' +' : l:file_name
endfunction

function g:CustomLightlineFileSize() abort
  let l:size = getfsize(expand('%:p'))
  if l:size < 0
    return ''
  elseif l:size < 10240    " 10 * 1024
    return printf('%dB', l:size)
  elseif l:size < 10485760 " 10 * 1024 * 1024
    return printf('%.2fK', l:size / 1024.0)
  else
    return printf('%.2fM', l:size / 1048576.0)
  endif
endfunction

function g:CustomLightlineGitStatus() abort
  if !exists('*g:FugitiveHead') | return '' | endif
  let l:branch = g:FugitiveHead()
  if empty(l:branch) | return '' | endif
  let l:branch = ' ' . l:branch
  if !exists('*g:GitGutterGetHunkSummary') | return l:branch | endif
  let [l:a, l:m, l:r] = g:GitGutterGetHunkSummary()
  if l:a == 0 && l:m == 0 && l:r == 0
    return l:branch
  else
    return printf('%s [+%d ~%d -%d]', l:branch, l:a, l:m, l:r)
  endif
endfunction
