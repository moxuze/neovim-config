let g:env#root_path = fnamemodify($MYVIMRC, ':h')
let g:env#config_path = g:env#root_path . '/config'
let g:env#cache_path = $HOME .'/.cache/nvim'
let g:env#plugin_config_path = g:env#config_path . '/plugin'
let g:env#plugin_install_path = g:env#cache_path . '/plugged'
