" syntax defined in $VIMRUNTIME/syntax/json.vim conflicts with coc-json, redraw it
syntax region jsonKeyword matchgroup=jsonQuote start=/"/ end=/"\ze[[:blank:]\r\n]*\:/ contained
syntax region jsonString oneline matchgroup=jsonQuote start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=jsonEscape contained
