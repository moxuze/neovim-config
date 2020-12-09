syntax keyword cOperator struct typedef union enum
syntax match cOperator '\(<<\|>>\|[-+*/%&^|<>!=]\)='
syntax match cOperator '<<\|>>\|&&\|||\|++\|--'
syntax match cOperator '[?:!~*&%<>^|=+-]'
syntax match cOperator '/[^/*=]'me=e-1

syntax match CustomSymbolArrow     '->'
syntax match CustomSymbolDelimiter '[.,;]'
syntax match CustomSymbolPair      '[{}()\[\]]'
