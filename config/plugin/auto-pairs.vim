" === OPTION ===
let g:AutoPairsMoveCharacter = "()[]{}<>\"'"
let g:AutoPairsShortcutJump = ''

" === TRIGGER ===
autocmd FileType rust,cpp let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})

" === KEY MAP ===
function! CustomAutoPairsJumpNext()
  call search('["\]'')}>]','W')
endfunction

function! CustomAutoPairsJumpPrev()
  call search('["\[''({<]','bW')
endfunction

inoremap <buffer> <silent> <M-j> <ESC>:call CustomAutoPairsJumpNext()<CR>a
inoremap <buffer> <silent> <M-k> <ESC>:call CustomAutoPairsJumpPrev()<CR>a
noremap  <buffer> <silent> <M-j> :call CustomAutoPairsJumpNext()<CR>
noremap  <buffer> <silent> <M-k> :call CustomAutoPairsJumpPrev()<CR>
