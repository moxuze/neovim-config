syntax keyword Keyword struct typedef union enum
syntax match cOperator '\(<<\|>>\|[-+*/%&^|<>!=]\)='
syntax match cOperator '<<\|>>\|&&\|||\|++\|--'
syntax match cOperator '[?:!~*&%<>^|=+-]'
syntax match cOperator '/[^/*=]'me=e-1

syntax match CustomArrow     '->'
syntax match CustomDelimiter '[.,;]'
syntax match CustomPair      '[{}()\[\]]'
