function s:load_config(file_name) abort
  execute 'source ' . g:env#config_path . '/' . a:file_name
endfunction

call plug#begin(g:env#plugin_install_path)
call s:load_config('plugin-list.vim')
call plug#end()

call s:load_config('common/global.vim')
call s:load_config('common/keymap.vim')
call s:load_config('common/trigger.vim')
call s:load_config('common/command.vim')

for s:plugin_name in keys(g:plugs)
  if isdirectory(g:plugs[s:plugin_name].dir)
    let s:config = g:env#plugin_config_path . '/' . s:plugin_name . '.vim'
    if filereadable(s:config)
      execute 'source ' . fnameescape(s:config)
    endif
  endif
endfor
