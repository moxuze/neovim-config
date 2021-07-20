" syntax defined in $VIMRUNTIME/syntax/json.vim conflicts with coc-json, redraw it
syntax region jsonKeyword matchgroup=jsonQuote start=/"/ end=/"\ze[[:blank:]\r\n]*\:/ contained
syntax region jsonString oneline matchgroup=jsonQuote start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=jsonEscape contained

highlight link jsonBraces       CustomPair
highlight link jsonKeyword      CustomKey
highlight link jsonKeywordMatch Operator
highlight link jsonNoise        CustomDelimiter
highlight link jsonNull         Constant
highlight link jsonQuote        CustomPair
highlight link jsonString       String
