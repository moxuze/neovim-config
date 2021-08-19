" === OPTION ===
let g:lightline = {
  \  'colorscheme': 'gruvbox',
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
  \    'left': [['filestatus']],
  \    'right': [['percent', 'lineinfo'], ['filetype', 'filesize']],
  \  },
  \  'component': {
  \    'filetype': '%{empty(&ft)?"plain":&ft}',
  \    'readonly': '%{&readonly?"":""}',
  \    'lineinfo': '%2l:%-2c',
  \  },
  \  'component_function': {
  \    'filestatus': 'g:CustomLightlineFileState',
  \    'filesize' : 'g:CustomLightlineFileSize',
  \    'gitstatus' : 'g:CustomLightlineGitStatus',
  \  },
  \  'tab_component_function': {
  \    'filename': 'g:CustomLightlineTabFileName',
  \    'modified': 'g:CustomLightlineTabModified',
  \  },
  \  'separator': { 'left': '', 'right': '' },
  \  'subseparator': { 'left': '।', 'right': '।' },
  \  'filter': 'g:CustomLightlineFilter'
  \}

let s:status_line_override = {
  \  'vista': [
  \    '%#LightlineLeft_active_1# [Vista] %#LightlineMiddle_active#',
  \    '%#LightlineLeft_inactive_0# [Vista]',
  \  ],
  \  'vista_markdown': [
  \    '%#LightlineLeft_active_1# [Vista Markdown] %#LightlineMiddle_active#',
  \    '%#LightlineLeft_inactive_0# [Vista Markdown]',
  \  ]
  \}

let s:tab_name_override = {
  \  'vista': '[Vista]',
  \  'vista_markdown': '[Vista Markdown]',
  \}

" === FUNCTION ===
function g:CustomLightlineFilter(win_num, inactive, status_line) abort
  let l:file_type = getwinvar(a:win_num, '&filetype')
  if has_key(s:status_line_override, l:file_type)
    return get(s:status_line_override, l:file_type)[a:inactive]
  else
    return a:status_line
  endif
endfunction

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

function g:CustomLightlineTabFileName(tab_num) abort
  let l:buf_list = tabpagebuflist(a:tab_num)
  let l:win_num = tabpagewinnr(a:tab_num)
  let l:buf_num = l:buf_list[l:win_num - 1]
  let l:file_name = expand('#' . l:buf_num . ':t')
  if empty(l:file_name)
    return '[No Name]'
  else
    let l:file_type = getbufvar(l:buf_num, '&filetype')
    if has_key(s:tab_name_override, l:file_type)
      return get(s:tab_name_override, l:file_type)
    else
      return l:file_name
    endif
  endif
endfunction

function g:CustomLightlineTabModified(tab_num) abort
  let l:win_num = tabpagewinnr(a:tab_num)
  return gettabwinvar(a:tab_num, l:win_num, '&modified') ? '+' : ''
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

function g:UpdateColorLightline() abort
  try
    " try to call an undefined fake function to reload the autoload script
    call lightline#colorscheme#{g:lightline.colorscheme}#fake_function()
  catch
    call lightline#colorscheme()
    call lightline#update()
  endtry
endfunction
