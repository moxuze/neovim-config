" === OPTION ===
call defx#custom#option('_', {
  \  'auto_cd': 1,
  \  'buffer_name': '',
  \  'columns': 'mark:indent:icons:filename',
  \  'direction': 'topleft',
  \  'focus': 0,
  \  'root_marker': '',
  \  'split': 'vertical',
  \  'toggle': 1,
  \  'winwidth': 28,
  \})

" === APPEARANCE
let g:defx_icons_directory_icon = '▸'
let g:defx_icons_parent_icon = ''
let g:defx_icons_root_opened_tree_icon = '▾'
let g:defx_icons_nested_opened_tree_icon = '▾'
let g:defx_icons_nested_closed_tree_icon = '▸'

" === TRIGGER ===
autocmd BufWritePost,ShellCmdPost,TermLeave * call defx#redraw()

" === KEY MAP ===
nnoremap <silent> <A-b> :Defx<CR>
autocmd FileType defx call custom#defx#settings()
function! custom#defx#settings() abort
set nonumber
nnoremap <silent><buffer><expr> <CR>    defx#do_action('call', 'custom#defx#open_this_tab') 
nnoremap <silent><buffer><expr> <A-CR>  defx#do_action('call', 'custom#defx#open_new_tab') 
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

" === FUNCTIONS ===
function! custom#defx#open_this_tab(context) abort
  let l:path = join(a:context.targets)
  if !custom#defx#jump_or_open_right(l:path)
    silent! execute 'edit' . l:path
  endif
endfunction

function! custom#defx#open_new_tab(context) abort
  let l:path = join(a:context.targets)
  if !custom#defx#jump_or_open_right(l:path)
    silent! execute 'tabnew ' . l:path
    Defx
  endif
endfunction

function! custom#defx#jump(path) abort
  let l:tab_num_curr = tabpagenr()
  let l:win_id = -1
  tabdo let l:tab_win_id = bufwinid(a:path)
  \| if l:tab_win_id != -1
  \|   let l:win_id = l:tab_win_id
  \| endif
  execute 'tabnext ' . l:tab_num_curr
  return win_gotoid(l:win_id)
endfunction

function! custom#defx#jump_or_open_right(path) abort
  let l:win_num_curr = winnr()
  wincmd l
  if custom#defx#jump(a:path)
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
