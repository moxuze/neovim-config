" === OPTION ===
let g:Lf_HideHelp = 1
let g:Lf_CacheDirectory = g:env.cache . '/leaderf'

" === APPEARANCE ===
let g:Lf_StlColorscheme = 'gruvbox_material'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }

" === KEY MAP ===
let g:Lf_ShortcutF = "<Leader>ff"
noremap  <Leader>fm :<C-u><C-r>=printf("Leaderf mru %s", "")<CR><CR>
noremap  <Leader>ft :<C-u><C-r>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap  <Leader>fl :<C-u><C-r>=printf("Leaderf line %s", "")<CR><CR>
noremap  <Leader>fb :<C-u><C-r>=printf("Leaderf buffer %s", "")<CR><CR>

noremap  <Leader>fg :<C-u><C-r>=printf("Leaderf rg --current-buffer -e ")<CR>
noremap  <Leader>fG :<C-u><C-r>=printf("Leaderf rg --hidden -e ")<CR>
noremap  <Leader>fr :<C-u>Leaderf rg --recall<CR>
noremap  <Leader>fw :<C-u><C-r>=printf("Leaderf rg -F --current-buffer %s ", expand("<cword>"))<CR><CR>
noremap  <Leader>fW :<C-u><C-r>=printf("Leaderf rg -F --hidden %s ", expand("<cword>"))<CR><CR>
xnoremap <Leader>fv :<C-u><C-r>=printf("Leaderf rg -F --current-buffer %s ", leaderf#Rg#visual())<CR><CR>
xnoremap <Leader>fV :<C-u><C-r>=printf("Leaderf rg -F --hidden %s ", leaderf#Rg#visual())<CR><CR>
