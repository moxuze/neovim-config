" Clipboard
vnoremap <A-c> "+y
vnoremap <A-x> "+x
nnoremap <A-v> "+p

" Save
nnoremap <A-s> :w <CR>

" Tab
nnoremap <silent> <A-[> :tabprev<CR>
nnoremap <silent> <A-]> :tabprev<CR>
nnoremap <silent> <A-\> :tabclose<CR>

" == WINDOW ==
" Moving Cursur
nnoremap <silent> <A-H> :wincmd H<CR>
nnoremap <silent> <A-J> :wincmd J<CR>
nnoremap <silent> <A-K> :wincmd K<CR>
nnoremap <silent> <A-L> :wincmd L<CR>

" Moving Window
tnoremap <silent> <A-h> <C-\><C-N>:wincmd h<CR>
tnoremap <silent> <A-j> <C-\><C-N>:wincmd j<CR>
tnoremap <silent> <A-k> <C-\><C-N>:wincmd k<CR>
tnoremap <silent> <A-l> <C-\><C-N>:wincmd l<CR>
inoremap <silent> <A-h> <C-\><C-N>:wincmd h<CR>
inoremap <silent> <A-j> <C-\><C-N>:wincmd j<CR>
inoremap <silent> <A-k> <C-\><C-N>:wincmd k<CR>
inoremap <silent> <A-l> <C-\><C-N>:wincmd l<CR>
nnoremap <silent> <A-h> :call <SID>win_move('h')<CR>
nnoremap <silent> <A-j> :call <SID>win_move('j')<CR>
nnoremap <silent> <A-k> :call <SID>win_move('k')<CR>
nnoremap <silent> <A-l> :call <SID>win_move('l')<CR>

" Resizing
nnoremap <silent> <A->> :resize +2<CR>
nnoremap <silent> <A-<> :resize -2<CR>
nnoremap <silent> <A-.> :vertical resize +2<CR>
nnoremap <silent> <A-,> :vertical resize -2<CR>

" Terminal
tnoremap <A-n> <C-\><C-N>ZQ
nnoremap <silent> <A-n> :call <SID>terminal_toggle()<CR>

function s:win_move(direction) abort
  execute 'wincmd ' . a:direction
  if &buftype == 'terminal'
    execute 'normal i'
  endif
endfunction

function s:terminal_toggle() abort
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
