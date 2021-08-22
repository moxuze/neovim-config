let s:project_root = util#find_project_root()
let s:cmake_args = ''
let s:make_args = ''
let s:run_args = ''

set commentstring=//%s

command! -bang -nargs=* Cmake call <SID>cmake(<bang>0, '<args>')
command! -bang -nargs=* Make  call <SID>make(<bang>0, '<args>')
command! -bang -nargs=* Run   call <SID>run(<bang>0, '<args>')
command! -bang -nargs=0 Go    call <SID>go(<bang>0)

function! s:prefix() abort
  return exists(':H') ? 'H' : '!'
endfunction

function! s:type(release) abort
  return a:release ? 'release' : 'debug'
endfunction

function! s:project_root_invalid() abort
  if !isdirectory(s:project_root)
    echohl ErrorMsg
    echo 'Project root is invalid!'
    echohl NONE
    return 1
  else
    return 0
  endif
endfunction

function! s:cmake(release, args) abort
  if s:project_root_invalid() | return | endif
  if !empty(a:args) | let s:cmake_args = a:args ==# '--' ? '' : a:args | endif
  execute printf(
    \  '%s cmake -S %s -B %s/build/%s '
    \. '-DCMAKE_BUILD_TYPE=%s '
    \. '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON %s',
    \  s:prefix(), s:project_root, s:project_root, s:type(a:release),
    \  substitute(s:type(a:release), '^.', '\U\0', ''), s:cmake_args
    \)
endfunction

function! s:make(release, args) abort
  if s:project_root_invalid() | return | endif
  if !empty(a:args) | let s:make_args = a:args ==# '--' ? '' : a:args | endif
  execute printf(
    \  '%s make --silent --directory=%s/build/%s %s',
    \  s:prefix(), s:project_root, s:type(a:release), s:make_args
    \)
endfunction

function! s:run(release, args) abort
  if s:project_root_invalid() | return | endif
  if !empty(a:args) | let s:run_args = a:args ==# '--' ? '' : a:args | endif
  execute printf(
    \  '%s %s/build/%s/%s %s', s:prefix(), s:project_root,
    \  s:type(a:release), fnamemodify(s:project_root, ':t'), s:run_args
    \)
endfunction

function! s:go(release) abort
  if s:project_root_invalid() | return | endif
  execute printf(
    \  '%s make --silent --directory=%s/build/%s %s && %s/build/%s/%s %s',
    \  s:prefix(), s:project_root, s:type(a:release), s:make_args, s:project_root,
    \  s:type(a:release), fnamemodify(s:project_root, ':t'), s:run_args
    \)
endfunction
