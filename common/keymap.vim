" Leader
let mapleader=' '

" Common
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>

" Clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
vnoremap <Leader>x "+x
nnoremap <Leader>x "+x
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>d "+d
vnoremap <Leader>d "+d

" Quick Quit
autocmd FileType help,qf nnoremap <buffer> <silent> <Esc> :q!<CR>

" Buffer
nnoremap <silent> <M-n> :bnext<CR>
nnoremap <silent> <M-p> :bprevious<CR>

" Tab
nnoremap <silent> <M-[> :tabprev<CR>
nnoremap <silent> <M-]> :tabnext<CR>
nnoremap <silent> <M-\> :tabclose<CR>

" Resizing
nnoremap <silent> <M-"> :resize +2<CR>
nnoremap <silent> <M-:> :resize -2<CR>
nnoremap <silent> <M-'> :vertical resize +2<CR>
nnoremap <silent> <M-;> :vertical resize -2<CR>
tnoremap <silent> <M-"> <C-\><C-n>:resize +2<CR>a
tnoremap <silent> <M-:> <C-\><C-n>:resize -2<CR>a
tnoremap <silent> <M-'> <C-\><C-n>:vertical resize +2<CR>a
tnoremap <silent> <M-;> <C-\><C-n>:vertical resize -2<CR>a

" Cursor
function s:check() abort
  if &buftype ==# 'terminal' | startinsert | endif
endfunction
nnoremap <silent> <M-H> <C-w>h:call <SID>check()<CR>
nnoremap <silent> <M-J> <C-w>j:call <SID>check()<CR>
nnoremap <silent> <M-K> <C-w>k:call <SID>check()<CR>
nnoremap <silent> <M-L> <C-w>l:call <SID>check()<CR>
inoremap <silent> <M-H> <Esc><C-w>h:call <SID>check()<CR>
inoremap <silent> <M-J> <Esc><C-w>j:call <SID>check()<CR>
inoremap <silent> <M-K> <Esc><C-w>k:call <SID>check()<CR>
inoremap <silent> <M-L> <Esc><C-w>l:call <SID>check()<CR>
tnoremap <M-H> <C-\><C-n><C-w>h
tnoremap <M-J> <C-\><C-n><C-w>j
tnoremap <M-K> <C-\><C-n><C-w>k
tnoremap <M-L> <C-\><C-n><C-w>l
tnoremap <M--> <C-\><C-n>"0pi

" Up & Down In Wrapped Line
noremap <C-k> g<Up>
noremap <C-j> g<Down>

" Command
cnoremap <M-h> <Left>
cnoremap <M-l> <Right>
cnoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>

" Pair
inoremap <buffer> <silent> <M-k> <Esc>:call search('["\[''({<]','bW')<CR>a
inoremap <buffer> <silent> <M-j> <Esc>:call search('["\]'')}>]','W')<CR>a
noremap  <buffer> <silent> <M-k> :call search('["\[''({<]','bW')<CR>
noremap  <buffer> <silent> <M-j> :call search('["\]'')}>]','W')<CR>
