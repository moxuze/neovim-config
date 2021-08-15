command! -nargs=* Build        call <SID>build(0, '<args>')
command! -nargs=* BuildRelease call <SID>build(1, '<args>')
command! -nargs=* Go           call <SID>go(0, '<args>')
command! -nargs=* GoRelease    call <SID>go(1, '<args>')

function! s:prefix() abort
  return exists(':H') ? 'H ' : '!'
endfunction

function! s:type(release)
  return a:release ? '--release' : ''
endfunction

function! s:build(release, args) abort
  execute printf('%scargo build %s %s', s:prefix(), s:type(a:release), a:args)
  return v:shell_error
endfunction

function! s:go(release, args) abort
  execute printf('%scargo run %s %s', s:prefix(), s:type(a:release), a:args)
  return v:shell_error
endfunction
