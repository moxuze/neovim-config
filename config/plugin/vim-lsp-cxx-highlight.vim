" === APPEARANCE ===
function s:highlight() abort
highlight link LspCxxHlGroupEnumConstant   CustomEnum
highlight link LspCxxHlGroupMemberVariable LspCxxHlSymVariable
highlight link LspCxxHlGroupNamespace      Include
highlight link LspCxxHlSymMacro            CustomMacro
highlight link LspCxxHlSymParameter        CustomParameter
endfunction
call s:highlight()
autocmd ColorScheme * call s:highlight()
