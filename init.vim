let g:env = {}
let g:env.config = fnamemodify($MYVIMRC, ':h')
let g:env.cache  = has('nvim')
  \? stdpath('cache')
  \: (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME) . '.cache/nvim'
let g:env.bundle = {
  \  'config' : g:env.config . '/bundle',
  \  'cache'  : g:env.cache  . '/bundle',
  \}

function s:load_config(file_name) abort
  execute 'source ' . g:env.config . '/' . a:file_name
endfunction

call s:load_config('bundle/bundle-init.vim')

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
