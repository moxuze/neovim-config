command! -bang -nargs=* Build call <SID>build(<bang>0, '<args>')
command! -bang -nargs=* Go    call <SID>go(<bang>0, '<args>')

function! s:prefix() abort
  return exists(':H') ? 'H' : '!'
endfunction

function! s:type(release)
  return a:release ? '--release' : ''
endfunction

function! s:build(release, args) abort
  execute printf('%s cargo build %s %s', s:prefix(), s:type(a:release), a:args)
  return v:shell_error
endfunction

function! s:go(release, args) abort
  execute printf('%s cargo run %s %s', s:prefix(), s:type(a:release), a:args)
  return v:shell_error
endfunction
