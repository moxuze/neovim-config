let g:env = { 'root': fnamemodify($MYVIMRC, ':h') }
let g:env.config = g:env.root . '/config'
let g:env.cache  = $HOME .'/.cache/nvim'
let g:env.bundle = {
  \  'config' : g:env.config . '/bundle',
  \  'cache': g:env.cache  . '/bundle',
  \}

function s:load_config(file_name) abort
  execute 'source ' . g:env.config . '/' . a:file_name
endfunction

call plug#begin(g:env.bundle.cache)
call s:load_config('bundle-list.vim')
call plug#end()

call s:load_config('common/global.vim')
call s:load_config('common/keymap.vim')
call s:load_config('common/trigger.vim')
call s:load_config('common/command.vim')

for s:bundle_name in keys(g:plugs)
  if isdirectory(g:plugs[s:bundle_name].dir)
    let s:config = g:env.bundle.config . '/' . s:bundle_name . '.vim'
    if filereadable(s:config)
      execute 'source ' . fnameescape(s:config)
    endif
  endif
endfor
