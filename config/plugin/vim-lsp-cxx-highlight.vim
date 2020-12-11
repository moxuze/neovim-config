" === APPEARANCE ===
function s:highlight() abort
highlight link LspCxxHlSymParameter        CustomParameter
highlight link LspCxxHlSymMacro            CustomMacro
highlight link LspCxxHlGroupEnumConstant   CustomEnum
highlight link LspCxxHlGroupMemberVariable LspCxxHlSymVaraible
endfunction
call s:highlight()
autocmd ColorScheme * call s:highlight()
