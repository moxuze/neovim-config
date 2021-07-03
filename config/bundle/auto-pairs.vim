" === OPTION ===
let g:AutoPairsMoveCharacter = "()[]{}<>\"'"
let g:AutoPairsShortcutJump = ''

" === TRIGGER ===
autocmd FileType rust,cpp let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
autocmd FileType vim
  \  if has_key(g:AutoPairs, '"')
  \|   let b:AutoPairs = copy(g:AutoPairs)
  \|   call remove(b:AutoPairs, '"')
  \| endif

" === KEY MAP ===
function! CustomAutoPairsJumpNext()
  call search('["\]'')}>]','W')
endfunction

function! CustomAutoPairsJumpPrev()
  call search('["\[''({<]','bW')
endfunction

inoremap <buffer> <silent> <M-h> <Esc>:call CustomAutoPairsJumpPrev()<CR>a
inoremap <buffer> <silent> <M-l> <Esc>:call CustomAutoPairsJumpNext()<CR>a
noremap  <buffer> <silent> <M-h> :call CustomAutoPairsJumpPrev()<CR>
noremap  <buffer> <silent> <M-l> :call CustomAutoPairsJumpNext()<CR>
