" --- COMMON
" -- OPTION
syntax enable
filetype plugin indent on
set softtabstop=4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set mouse=a
set expandtab
set number
set nohlsearch
set signcolumn=yes
" -- TRIGGER
autocmd BufReadPost * call setpos('.', getpos('''"'))
" -- KEY MAP
" - SAVE
nnoremap <A-s> :w <CR>
" - CLIPBOARD
vnoremap <A-c> "+y
vnoremap <A-x> "+x
nnoremap <A-v> "+p
" - TAB
nnoremap <silent> <A-[> :tabprev<CR>
nnoremap <silent> <A-]> :tabprev<CR>
nnoremap <silent> <A-\> :tabclose<CR>
" - WINDOW
" TERMINAL
tnoremap <A-n> <C-\><C-N>ZQ
nnoremap <silent> <A-n> :call g:TermToggle()<CR>
function! g:TermToggle() abort
  if &buftype == 'terminal'
    quit
  else 
    below 8new
    terminal
    execute 'normal <CR>'
    set signcolumn=no
    set foldcolumn=1
    set nonumber
    execute 'normal i'
    endif
endfunction
" RESIZING
nnoremap <silent> <A->> :resize +2<CR>
nnoremap <silent> <A-<> :resize -2<CR>
nnoremap <silent> <A-.> :vertical resize +2<CR>
nnoremap <silent> <A-,> :vertical resize -2<CR>
" MOVING CURSUR
nnoremap <silent> <A-H> :wincmd H<CR>
nnoremap <silent> <A-J> :wincmd J<CR>
nnoremap <silent> <A-K> :wincmd K<CR>
nnoremap <silent> <A-L> :wincmd L<CR>
" MOVING WINDOW
tnoremap <silent> <A-h> <C-\><C-N>:wincmd h<CR>
tnoremap <silent> <A-j> <C-\><C-N>:wincmd j<CR>
tnoremap <silent> <A-k> <C-\><C-N>:wincmd k<CR>
tnoremap <silent> <A-l> <C-\><C-N>:wincmd l<CR>
inoremap <silent> <A-h> <C-\><C-N>:wincmd h<CR>
inoremap <silent> <A-j> <C-\><C-N>:wincmd j<CR>
inoremap <silent> <A-k> <C-\><C-N>:wincmd k<CR>
inoremap <silent> <A-l> <C-\><C-N>:wincmd l<CR>
nnoremap <silent> <A-h> :call g:WinMove('h')<CR>
nnoremap <silent> <A-j> :call g:WinMove('j')<CR>
nnoremap <silent> <A-k> :call g:WinMove('k')<CR>
nnoremap <silent> <A-l> :call g:WinMove('l')<CR>

function! g:WinMove(direction)
  execute 'wincmd ' . a:direction
  if &buftype == 'terminal'
    execute 'normal i'
  endif
endfunction

" --- PLUG
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'crusoexia/vim-monokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'puremourning/vimspector'
Plug 'liuchengxu/vista.vim'
call plug#end()

" --- COC
" -- PRESENTATION
highlight CocErrorFloat ctermfg=Red guifg=Red
" -- KEY MAP
" - CODE NAVIGATION
nnoremap gb <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)
vmap <silent> <A-f> <Plug>(coc-format-selected)
" - SHOW DOCUMENTATION
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h ' . expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" - SYMBOL RENAMING
nmap <silent> <A-r><A-n> <Plug>(coc-rename)
" - HIGHLIGHT SYMBOL
autocmd CursorHold * silent call CocActionAsync('highlight')
" - COMPLETION
inoremap <silent><expr> <A-f>   coc#refresh()
inoremap <silent><expr> <TAB>   pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr> <S-TAB> pumvisible() ? '<C-p>' : '<S-TAB>'
inoremap <silent><expr> <CR>    pumvisible() ?
  \  coc#_select_confirm() : '<C-g>u<CR><c-r>=coc#on_enter()<CR>'

" --- DEFX
" -- PRESENTATION
let g:defx_icons_directory_icon = '▸'
let g:defx_icons_parent_icon = ''
let g:defx_icons_root_opened_tree_icon = '▾'
let g:defx_icons_nested_opened_tree_icon = '▾'
let g:defx_icons_nested_closed_tree_icon = '▸'
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
" -- KEY MAP
nnoremap <silent> <A-b> :Defx<CR>
autocmd BufWritePost,ShellCmdPost,TermLeave * call defx#redraw()
autocmd FileType defx call s:DefxSettings()
function! s:DefxSettings() abort
set nonumber
nnoremap <silent><buffer><expr> <CR>    defx#do_action('call', 'DefxOpenThisTab') 
nnoremap <silent><buffer><expr> <A-CR>  defx#do_action('call', 'g:DefxOpenNewTab') 
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

function! g:DefxOpenThisTab(context) abort
  let l:path = join(a:context.targets)
  execute 'let l:ok = DefxJumpOrOpenRight(''' . l:path . ''')'
  if !l:ok
    execute 'edit' . l:path
  endif
endfunction

function! g:DefxOpenNewTab(context) abort
  let l:path = join(a:context.targets)
  execute 'let l:ok = DefxJumpOrOpenRight(''' . l:path . ''')'
  if !l:ok
    execute 'tabnew ' . l:path
    Defx
  endif
endfunction

function! g:DefxJumpOrOpenRight(path)
  let l:win_num_curr = winnr()
  wincmd l
  execute 'let l:ok = DefxJump(''' . a:path . ''')'
  if l:ok
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

function! g:DefxJump(path)
  let l:tab_num_curr = tabpagenr()
  let l:win_id = -1
  tabdo let l:tab_win_id = bufwinid(a:path)
  \| if l:tab_win_id != -1
  \|   let l:win_id = l:tab_win_id
  \| endif
  execute 'tabnext ' l:tab_num_curr
  return win_gotoid(l:win_id)
endfunction

" --- LIGHTLINE
let g:lightline = {
  \  'colorscheme': 'Tomorrow_Night',
  \  'active': {
  \    'left': [
  \      [ 'mode', 'paste' ],
  \      [ 'filename', 'modified' ],
  \      [ 'gitbranch', 'nearest' ]
  \    ],
  \    'right': [
  \      [ 'lineinfo' ],
  \      [ 'percent' , 'filesize' ],
  \      [ 'readonly', 'fileformat', 'fileencoding', 'filetype' ],
  \    ],
  \  },
  \  'component_function': {
  \    'filesize': 'LightlineFileSize',
  \    'readonly': 'LightlineReadOnly',
  \    'gitbranch': 'LightlineBranch',
  \    'nearest': 'LightlineNearest',
  \  },
  \  'separator':    { 'left': '', 'right': '' },
  \  'subseparator': { 'left': '•', 'right': '•' },
  \}

function! g:LightlineFileSize() abort
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

function! g:LightlineReadOnly() abort
  return &readonly ? '' : ''
endfunction

function! g:LightlineBranch() abort
  let l:branch = g:FugitiveHead()
  if strlen(l:branch) != 0
      let l:branch = ' ' . l:branch
  endif
  return l:branch
endfunction

function! g:LightlineNearest() abort
  let l:nearest = get(b:, 'vista_nearest_method_or_function', '')
  if strlen(l:nearest) != 0
    let l:nearest = ' ' . l:nearest
  endif
  return l:nearest
endfunction

" --- VISTA
nnorema <silent> <A-m> :Vista!!<CR>
let g:vista_default_executive = 'ctags'

" -- VIMSPECTOR
let g:vimspector_enable_mappings='HUMAN'

" --- COLOR
" -- MONOKAI
colorscheme monokai_pro
highlight Comment ctermfg=244
highlight FoldColumn ctermbg=235
highlight LineNr ctermbg=236
highlight Normal ctermbg=235
highlight NonText ctermbg=235
highlight SignColumn ctermbg=235
highlight SpecialKey ctermfg=220 ctermbg=235
highlight VertSplit ctermbg=236
highlight Visual ctermbg=238

