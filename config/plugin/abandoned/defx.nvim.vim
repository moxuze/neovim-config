" === OPTION ===
call defx#custom#option('_', {
  \  'auto_cd'    : 1,
  \  'buffer_name': '',
  \  'columns'    : 'mark:git:indent:icons:filename',
  \  'direction'  : 'topleft',
  \  'focus'      : 0,
  \  'root_marker': '',
  \  'split'      : 'vertical',
  \  'toggle'     : 1,
  \  'winwidth'   : 28,
  \})

call defx#custom#column('git', 'indicators', {
  \  'Deleted'  : 'D',
  \  'Ignored'  : 'I',
  \  'Modified' : 'M',
  \  'Renamed'  : 'R',
  \  'Staged'   : 'S',
  \  'Unknown'  : '?',
  \  'Unmerged' : '!',
  \  'Untracked': 'U',
  \})

" === APPEARANCE ===
" Icon
let g:defx_icons_directory_icon = '▸'
let g:defx_icons_parent_icon = ''
let g:defx_icons_root_opened_tree_icon = '▾'
let g:defx_icons_nested_opened_tree_icon = '▾'
let g:defx_icons_nested_closed_tree_icon = '▸'

" Git
function s:highlight() abort
highlight link Defx_git_Deleted   CustomGitDeleted
highlight link Defx_git_Ignored   CustomGitIgnored
highlight link Defx_git_Modified  CustomGitModifed
highlight link Defx_git_Renamed   CustomGitRenamed
highlight link Defx_git_Staged    CustomGitStaged
highlight link Defx_git_Unknown   CustomGitUnknown
highlight link Defx_git_Unmerged  CustomGitUnmerged
highlight link Defx_git_Untracked CustomGitUntracked
endfunction
call s:highlight()
autocmd ColorScheme * call s:highlight()

" === TRIGGER ===
autocmd DirChanged * call s:execute_in_defx('defx#call_action', 'cd', getcwd())
" remove BufWritePost because of defx-git
autocmd ShellCmdPost,TermLeave * call defx#redraw()
autocmd User FugitiveChanged call defx#redraw()

" === KEY MAP ===
nnoremap <silent> <Leader>d :Defx<CR>
function s:settings() abort
set nonumber
nnoremap <silent><buffer><expr> <CR>    defx#do_action('call', '<SID>open_this_tab') 
nnoremap <silent><buffer><expr> <C-CR>  defx#do_action('call', '<SID>open_new_tab') 
nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> h       defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> l       defx#do_action('open', 'rightbelow vnew')
nnoremap <silent><buffer><expr> o       defx#do_action('open_tree', ['toggle'])
nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
nnoremap <silent><buffer><expr> cp      defx#do_action('copy')
nnoremap <silent><buffer><expr> mv      defx#do_action('move')
nnoremap <silent><buffer><expr> ps      defx#do_action('paste')
nnoremap <silent><buffer><expr> nd      defx#do_action('new_directory')
nnoremap <silent><buffer><expr> nf      defx#do_action('new_file')
nnoremap <silent><buffer><expr> rm      defx#do_action('remove')
nnoremap <silent><buffer><expr> rn      defx#do_action('rename')
nnoremap <silent><buffer><expr> xx      defx#do_action('execute_system')
nnoremap <silent><buffer><expr> yy      defx#do_action('yank_path')
nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
endfunction
autocmd FileType defx call s:settings()

" === FUNCTION ===
function s:open_this_tab(context) abort
  if defx#is_directory()
    call defx#call_action('open_tree', ['toggle'])
    return
  endif
  let l:path = join(a:context.targets)
  if !s:jump_or_open_right(l:path)
    silent! execute 'edit' . l:path
  endif
endfunction

function s:open_new_tab(context) abort
  if defx#is_directory()
    call defx#call_action('open_tree', ['toggle'])
    return
  endif
  let l:path = join(a:context.targets)
  if !s:jump_or_open_right(l:path)
    silent! execute 'tabnew ' . l:path
    Defx
  endif
endfunction

function s:jump(path) abort
  let l:tab_num_curr = tabpagenr()
  let l:win_id = -1
  tabdo let l:tab_win_id = bufwinid(a:path)
    \  |  if l:tab_win_id != -1
    \  |    let l:win_id = l:tab_win_id
    \  |  endif
  execute 'tabnext ' . l:tab_num_curr
  return win_gotoid(l:win_id)
endfunction

function s:jump_or_open_right(path) abort
  let l:win_num_curr = winnr()
  wincmd l
  if s:jump(a:path)
    return 1
  elseif l:win_num_curr == winnr()
    execute 'rightbelow vnew' . a:path
    wincmd h
    vertical resize 28
    wincmd l
    return 1
  else
    return 0
  endif
endfunction

function s:execute_in_defx(func, ...) abort
  let l:defx_win_num = -1
  for l:buf_num in tabpagebuflist()
    if bufname(l:buf_num) =~# '^\[defx\] -\d$'
      let l:defx_win_num = bufwinnr(l:buf_num)
      break
    endif
  endfor
  if l:defx_win_num != -1
    if winnr() != l:defx_win_num
      noautocmd execute l:defx_win_num . 'wincmd w'
      let l:switch_back = 1
    endif
    call call(function(a:func), a:000)
    if exists('l:switch_back')
      noautocmd wincmd p
    endif
  endif
endfunction
