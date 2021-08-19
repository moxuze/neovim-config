function util#find_project_root() abort
  let l:bufname = expand('%:p')
  if &buftype !=# '' || empty(l:bufname) || stridx(l:bufname, '://') !=# -1 | return | endif
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
      elseif l:pattern =~# '/$'
        if isdirectory(l:current) | return l:path | endif
      elseif filereadable(l:current)
        return l:path
      endif
    endfor
    let l:next = fnamemodify(l:path, ':h')
    if l:next ==# l:path || (has('win32') && l:next =~# '^//[^/]\+$') | return '' | endif
    let l:path = l:next
  endwhile
endfunction

function util#toggle_indent_space() abort
  if exists('s:origin_listchars')
    let &listchars = s:origin_listchars
    unlet s:origin_listchars
  else
    let s:origin_listchars = &listchars
    let l:dict = {}
    for l:item in split(s:origin_listchars, ',')
      let [l:key, l:value] = split(l:item, ':')
      let l:dict[l:key] = l:value
    endfor
    let l:dict.tab = '>_'
    let l:dict.space = '·'
    let &listchars = ''
    for [l:key, l:value] in items(l:dict)
      let &listchars .= l:key . ':' . l:value . ','
    endfor
  endif
endfunction

function util#toggle_background() abort
  let &background = &background ==# 'dark' ? 'light' : 'dark'
  if (exists('g:lightline'))
    call lightline#colorscheme#update()
  endif
endfunction
