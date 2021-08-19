function s:get_cache_home()
  let l:cache_home = $XDG_CACHE_HOME
  if strlen(l:cache_home) == 0
    let l:cache_home = $HOME . '/.cache'
  endif
  return l:cache_home
endfunction

function s:load_config(file_name) abort
  execute 'source ' . g:env.config . '/' . a:file_name
endfunction

let g:env = {}
let g:env.config = fnamemodify($MYVIMRC, ':h')
let g:env.cache  = s:get_cache_home() . '/nvim'
let g:env.bundle = {
  \  'config' : g:env.config . '/bundle',
  \  'cache'  : g:env.cache  . '/bundle',
  \}

call plug#begin(g:env.bundle.cache)
call s:load_config('bundle/bundle-list.vim')
call plug#end()

call s:load_config('common/global.vim' )
call s:load_config('common/keymap.vim' )
call s:load_config('common/trigger.vim')
call s:load_config('common/command.vim')

for s:bundle_item in keys(g:plugs)
  if isdirectory(g:plugs[s:bundle_item].dir)
    let s:config = g:env.bundle.config . '/' . s:bundle_item . '.vim'
    if filereadable(s:config)
      execute 'source ' . fnameescape(s:config)
    endif
  endif
endfor
