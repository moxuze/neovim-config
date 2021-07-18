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
