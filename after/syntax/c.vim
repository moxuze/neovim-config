syntax match cOperator '\(<<\|>>\|[-+*/%&^|<>!=]\)='
syntax match cOperator '<<\|>>\|&&\|||\|++\|--'
syntax match cOperator '[?:!~*&%<>^|=+-]'
syntax match cOperator '/[^/*=]'me=e-1

syntax match Delimiter '->'
syntax match Delimiter '[.,;{}()\[\]]'
