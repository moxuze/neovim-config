runtime colors/gruvbox.vim

" Overwrite
highlight link cOperator                   Operator
highlight link Delimiter                   GruvboxFg3
highlight      LineNr                      ctermbg=236
highlight      Operator                    ctermfg=216

" C/C++        BUNDLE: vim-lsp-cxx-highlight
highlight link LspCxxHlGroupEnumConstant   cConstant
highlight link LspCxxHlGroupMemberVariable LspCxxHlSymVariable
highlight link LspCxxHlGroupNamespace      cInclude
highlight link LspCxxHlSymConstructor      Type
highlight link LspCxxHlSymMacro            GruvboxBlue
highlight      LspCxxHlSymParameter        cterm=italic

" CSS
highlight link cssAnimationProp            GruvboxOrange
highlight link cssAttrComma                Delimiter
highlight link cssBackgroundProp           GruvboxOrange
highlight link cssBorderOutlineProp        GruvboxOrange
highlight link cssBoxProp                  GruvboxOrange
highlight link cssBraces                   Delimiter
highlight link cssClassDot                 Delimiter
highlight link cssClassName                GruvboxGreen
highlight link cssColor                    GruvboxBlue
highlight link cssColorProp                GruvboxOrange
highlight link cssCustomProp               GruvboxAqua
highlight link cssDimensionProp            GruvboxOrange
highlight link cssFlexibleBoxProp          GruvboxOrange
highlight link cssFontDescriptorProp       GruvboxOrange
highlight link cssFontProp                 GruvboxOrange
highlight link cssGeneratedContentProp     GruvboxOrange
highlight link cssIdentifier               GruvboxYellow
highlight link cssListProp                 GruvboxOrange
highlight link cssMarginPro                GruvboxOrange
highlight link cssNoise                    Delimiter
highlight link cssPaddingProp              GruvboxOrange
highlight link cssPositioningProp          GruvboxOrange
highlight link cssPrintProp                GruvboxOrange
highlight link cssRenderProp               GruvboxOrange
highlight link cssTableProp                GruvboxOrange
highlight link cssTagName                  GruvboxBlue
highlight link cssTextProp                 GruvboxOrange
highlight link cssTransformProp            GruvboxOrange
highlight link cssTransitionProp           GruvboxOrange
highlight link cssUIProp                   GruvboxOrange
highlight link cssUnitDecorators           GruvboxBlue
highlight link cssVendorProp               GruvboxYellow

" Git          BUNDLE: vim-gitgutter
highlight link GitGutterAdd                DiffAdd
highlight link GitGutterChange             DiffChange
highlight link GitGutterChangeDelete       DiffText
highlight link GitGutterDelete             DiffDelete

" HTML
highlight link htmlArg                     GruvboxYellow
highlight link htmlTitle                   NONE

" Java
highlight link javaDelimiter               Delimiter
highlight link javaIdentifier              NONE

" JavaScript   BUNDLE vim-javascript
highlight link jsArrowFunction             Operator
highlight link jsBraces                    Delimiter
highlight link jsBrackets                  Delimiter
highlight link jsClassBraces               Delimiter
highlight link jsClassDefinition           Type
highlight link jsClassKeyword              Keyword
highlight link jsClassNoise                Delimiter
highlight link jsDot                       Delimiter
highlight link jsExport                    Keyword
highlight link jsExportDefault             Type
highlight link jsExportDefaultGroup        Type
highlight link jsExtendsKeyword            Keyword
highlight link jsFinallyBraces             Delimiter
highlight link jsFrom                      Keyword
highlight link jsFuncArgCommas             Delimiter
highlight link jsFuncBraces                Delimiter
highlight link jsFuncParens                Delimiter
highlight link jsFunction                  Identifier
highlight link jsFunctionKey               Function
highlight link jsGlobalNodeObjects         Constant
highlight link jsGlobalObjects             Constant
highlight link jsIfElseBraces              Delimiter
highlight link jsImport                    Keyword
highlight link jsModuleAs                  Keyword
highlight link jsModuleBraces              Delimiter
highlight link jsModuleKeyword             Identifier
highlight link jsNull                      Constant
highlight link jsNoise                     Delimiter
highlight link jsObjectBraces              Delimiter
highlight link jsObjectColon               Operator
highlight link jsObjectSeparator           Delimiter
highlight link jsObjectKey                 Identifier
highlight link jsOperatorKeyWord           Keyword
highlight link jsParens                    Delimiter
highlight link jsRepeatBraces              Delimiter
highlight link jsStorageClass              Identifier
highlight link jsSwitchBraces              Delimiter
highlight link jsSwitchColon               Delimiter
highlight link jsTemplateBraces            Delimiter
highlight link jsTryCatchBraces            Delimiter
highlight link jsUndefined                 Constant

" JSON
highlight link jsonBraces                  Delimiter
highlight link jsonKeyword                 Identifier
highlight link jsonKeywordMatch            Operator
highlight link jsonNoise                   Delimiter
highlight link jsonNull                    Constant
highlight link jsonQuote                   Delimiter
highlight link jsonString                  String

" VIM
highlight link vimUserFunc                 NONE
