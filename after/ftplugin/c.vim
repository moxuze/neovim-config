let s:project_root = util#find_project_root()
set commentstring=//%s
command! -nargs=* Cmake        call <SID>cmake(0, '<args>')
command! -nargs=* CmakeRelease call <SID>cmake(1, '<args>')
command! -nargs=* Make         call <SID>make(0, '<args>')
command! -nargs=* MakeRelease  call <SID>make(1, '<args>')
command! -nargs=* Run          call <SID>run(0, '<args>')
command! -nargs=* RunRelease   call <SID>run(1, '<args>')
command! -nargs=* Go           call <SID>go(0, '<args>')
command! -nargs=* GoRelease    call <SID>go(1, '<args>')

function! s:prefix() abort
  return exists(':H') ? 'H ' : '!'
endfunction

function! s:type(release) abort
  return a:release ? 'release' : 'debug'
endfunction

function! s:project_root_invalid() abort
  if !isdirectory(s:project_root)
    echoerr 'Project root is not valid!'
    return 1
  else
    return 0
  endif
endfunction

function! s:cmake(release, args) abort
  if (s:project_root_invalid()) | return | endif
  execute printf('%scmake -S %s -B %s/build/%s -DCMAKE_BUILD_TYPE=%s '
              \  . '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON %s',
              \  s:prefix(), s:project_root, s:project_root, s:type(a:release),
              \  substitute(s:type(a:release), '^.', '\U\0', ''), a:args)
  return v:shell_error
endfunction

function! s:make(release, args) abort
  if (s:project_root_invalid()) | return | endif
  execute printf('%smake --silent --directory=%s/build/%s %s',
              \  s:prefix(), s:project_root, s:type(a:release), a:args)
  return v:shell_error
endfunction

function! s:run(release, args) abort
  if (s:project_root_invalid()) | return | endif
  execute printf('%s%s/build/%s/%s %s', s:prefix(), s:project_root,
              \  s:type(a:release), fnamemodify(s:project_root, ':t'), a:args)
  return v:shell_error
endfunction

function! s:go(release, args) abort
  if s:make(a:release, '') == 0
    call s:run(a:release, a:args)
  endif
  return v:shell_error
endfunction
