command! -bang -nargs=* Build call <SID>build(<bang>0, '<args>')
command! -bang -nargs=* Go    call <SID>go(<bang>0, '<args>')
command! -bang -nargs=* Test  call <SID>test(<bang>0, '<args>')
command! -bang -nargs=* Clean call <SID>clean(<bang>0, '<args>')

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

function! s:test(release, args) abort
  execute printf('%s cargo test %s %s', s:prefix(), s:type(a:release), a:args)
  return v:shell_error
endfunction

function! s:clean(release, args) abort
  execute printf('%s cargo clean %s %s', s:prefix(), s:type(a:release), a:args)
  return v:shell_error
endfunction
