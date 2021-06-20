let g:terminal_default_mapping = 0
nnoremap <silent> <M-=> :call TerminalToggle()<CR>
if has('nvim')
  tnoremap <silent> <M-=> <C-\><C-n>:call TerminalToggle()<CR>
else
  tnoremap <silent> <M-=> <C-_>:call TerminalToggle()<CR>
endif
