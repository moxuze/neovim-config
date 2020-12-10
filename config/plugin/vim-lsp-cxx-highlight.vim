" === APPEARANCE ===
function s:highlight() abort
highlight link LspCxxHlSymParameter  CustomSymbolParameter
highlight link LspCxxHlSymMacro      CustomSymbolMacro
highlight link LspCxxHlSymEnumMember CustomSymbolEnumMember
endfunction
call s:highlight()
autocmd ColorScheme * call s:highlight()
