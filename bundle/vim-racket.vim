"=== TRIGGER ===
autocmd FileType racket let b:undo_ftplugin =
  \ "setl iskeyword< lispwords< lisp< comments< formatoptions<"
  \ . "| setl makeprg< commentstring<"

"=== KEY MAP ===
autocmd FileType racket nmap <buffer> K <Plug>RacketDoc
