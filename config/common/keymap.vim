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

" Quit Help
autocmd FileType help noremap <buffer> <silent> <ESC> :q!<CR>

" Buffer
nnoremap <silent> <A-n> :bnext<CR>
nnoremap <silent> <A-p> :bprevious<CR>

" Tab
nnoremap <silent> <A-[> :tabprev<CR>
nnoremap <silent> <A-]> :tabnext<CR>
nnoremap <silent> <A-\> :tabclose<CR>

" Resizing
nnoremap <silent> <A-"> :resize +2<CR>
nnoremap <silent> <A-:> :resize -2<CR>
nnoremap <silent> <A-'> :vertical resize +2<CR>
nnoremap <silent> <A-;> :vertical resize -2<CR>

" Window
nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L
tnoremap <A-H> <C-\><C-n><C-w>H
tnoremap <A-J> <C-\><C-n><C-w>J
tnoremap <A-K> <C-\><C-n><C-w>K
tnoremap <A-L> <C-\><C-n><C-w>L

" Cursor
function s:check() abort
  if &buftype ==# 'terminal' | startinsert | endif
endfunction
nnoremap <silent> <A-h> <C-w>h:call <SID>check()<CR>
nnoremap <silent> <A-j> <C-w>j:call <SID>check()<CR>
nnoremap <silent> <A-k> <C-w>k:call <SID>check()<CR>
nnoremap <silent> <A-l> <C-w>l:call <SID>check()<CR>
inoremap <silent> <A-h> <ESC><C-w>h:call <SID>check()<CR>
inoremap <silent> <A-j> <ESC><C-w>j:call <SID>check()<CR>
inoremap <silent> <A-k> <ESC><C-w>k:call <SID>check()<CR>
inoremap <silent> <A-l> <ESC><C-w>l:call <SID>check()<CR>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <A--> <C-\><C-n>"0pi
