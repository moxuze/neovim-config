let g:terminal_default_mapping = 0
nnoremap <silent> <A-=> :call TerminalToggle()<CR>
if has('nvim')
  tnoremap <silent> <A-=> <C-\><C-n>:call TerminalToggle()<CR>
else
  tnoremap <silent> <A-=> <C-_>:call TerminalToggle()<CR>
endif
