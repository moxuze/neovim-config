command! -nargs=* Go call <SID>go('<args>')

function! s:prefix() abort
  return exists(':H') ? 'H ' : '!'
endfunction

function! s:go(args) abort
  execute printf('%sracket %s %s', s:prefix(), expand('%:p'), a:args)
  return v:shell_error
endfunction
