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
inoremap <silent> <M-H> <ESC><C-w>h:call <SID>check()<CR>
inoremap <silent> <M-J> <ESC><C-w>j:call <SID>check()<CR>
inoremap <silent> <M-K> <ESC><C-w>k:call <SID>check()<CR>
inoremap <silent> <M-L> <ESC><C-w>l:call <SID>check()<CR>
tnoremap <M-H> <C-\><C-n><C-w>h
tnoremap <M-J> <C-\><C-n><C-w>j
tnoremap <M-K> <C-\><C-n><C-w>k
tnoremap <M-L> <C-\><C-n><C-w>l
tnoremap <M--> <C-\><C-n>"0pi
