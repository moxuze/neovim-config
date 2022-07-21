function util#find_project_root() abort
  let l:bufname = expand('%:p')
  if &buftype !=# '' || empty(l:bufname) || stridx(l:bufname, '://') != -1 | return | endif
  let l:path = escape(fnamemodify(l:bufname, ':p:h:gs!\!/!:gs!//!/!'), ' ')
  let l:patterns = get(g:, 'project_root_patterns', [
    \  '.git/',
    \  '.gitignore',
    \  'CMakeLists.txt',
    \])
  while 1
    for l:pattern in l:patterns
      let l:current = l:path . '/' . l:pattern
      if stridx(l:pattern, '*') != -1 && !empty(glob(l:current, 1))
        return l:path
      elseif l:pattern =~# '\m/$'
        if isdirectory(l:current) | return l:path | endif
      elseif filereadable(l:current)
        return l:path
      endif
    endfor
    let l:next = fnamemodify(l:path, ':h')
    if l:next ==# l:path || (has('win32') && l:next =~# '\m^//[^/]\+$') | return '' | endif
    let l:path = l:next
  endwhile
endfunction

function util#toggle_indent_space() abort
  if exists('s:show_indent_space')
    unlet s:show_indent_space
    set listchars-=tab:>_,space:·
  else
    let s:show_indent_space = 1
    set listchars+=tab:>_,space:·
  endif
endfunction

function util#toggle_background() abort
  if exists('*g:UpdateColorClap')
    call g:UpdateColorClap()
  endif
  let &background = &background ==# 'dark' ? 'light' : 'dark'
  if exists('*g:UpdateColorLightline')
    call g:UpdateColorLightline()
  endif
endfunction

function util#wrap_pairs() abort
  let l:line = getline('.')
  let l:line_number = line('.')
  let l:column = col('.') - 1
  if l:line[l:column] !~# '\m[)\]}>''"`]'
    call search('\m[)\]}>''"`]', 'We', l:line_number)
    return
  endif
  let l:column = l:column + 1
  let l:char = l:line[l:column]
  if empty(l:char) | return | endif
  let l:old = @"
  normal! x
  let l:line = l:line[l:column:]
  if l:char =~# '\m[''"`]'
    call search(l:char, 'We', l:line_number)
  else
    let l:open_index = match(l:line, '\m^\s*\zs.')
    let l:open = l:line[l:open_index]
    if l:open =~# '\m[([{]'
      let l:pairs = &matchpairs
      set matchpairs=(:),[:],{:}
      call cursor(l:line_number, l:column + l:open_index)
      normal! %
      let &matchpairs = l:pairs
    elseif l:open ==# '<' && l:line[l:open_index:] =~# '\m^<[0-9A-Za-z_()[\]{}<>, \t]*>'
      let l:pairs = &matchpairs
      set matchpairs=<:>
      normal! %
      if l:line_number != line('.')
        normal! %
      endif
      let &matchpairs = l:pairs
    elseif l:line[1] =~# '\m\w'
      normal! e
    endif
  endif
  normal! p
  let @" = l:old
endfunction

function util#highlight_data() abort
  return [
    \  synIDattr(synID(line('.'), col('.'), 1), 'name'),
    \  synIDattr(synID(line('.'), col('.'), 0), 'name'),
    \  synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), "name")
    \]
endfunction

function util#highlight_information() abort
  let [l:hi, l:trans, l:lo] = util#highlight_data()
  return printf('hi<%s> trans<%s> lo<%s>', l:hi, l:trans, l:lo)
endfunction
