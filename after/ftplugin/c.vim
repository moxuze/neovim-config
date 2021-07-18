let s:project_root = util#find_project_root()
set commentstring=//%s
command! -nargs=* Cmake        call <SID>cmake('debug', '<args>')
command! -nargs=* CmakeRelease call <SID>cmake('release', '<args>')
command! -nargs=* Make         call <SID>make('debug', '<args>')
command! -nargs=* MakeRelease  call <SID>make('release', '<args>')
command! -nargs=* Run          call <SID>run('debug', '<args>')
command! -nargs=* RunRelease   call <SID>run('release', '<args>')
command! -nargs=* Go           call <SID>go('debug', '<args>')
command! -nargs=* GoRelease    call <SID>go('release', '<args>')

function! s:project_root_invalid() abort
  if !isdirectory(s:project_root)
    echoerr 'Project root is not valid!'
    return 1
  else
    return 0
  endif
endfunction

function! s:cmake(type, args) abort
  if (s:project_root_invalid()) | return | endif
  execute printf('!cmake -S %s -B %s/build/%s -DCMAKE_BUILD_TYPE=%s -DCMAKE_EXPORT_COMPILE_COMMANDS=ON %s',
              \  s:project_root, s:project_root, a:type, substitute(a:type, '^.', '\U\0', ''), a:args)
  return v:shell_error
endfunction

function! s:make(type, args) abort
  if (s:project_root_invalid()) | return | endif
  execute printf('!make --silent --directory=%s/build/%s %s',
              \  s:project_root, a:type, a:args)
  return v:shell_error
endfunction

function! s:run(type, args) abort
  if (s:project_root_invalid()) | return | endif
  execute printf('!%s/build/%s/%s %s', s:project_root, a:type,
              \  fnamemodify(s:project_root, ':t'), a:args)
  return v:shell_error
endfunction

function! s:go(type, args) abort
  if s:make(a:type, '') == 0
    call s:run(a:type, a:args)
  endif
  return v:shell_error
endfunction
