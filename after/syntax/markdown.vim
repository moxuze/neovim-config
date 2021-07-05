" syntax defined in $VIMRUNTIME/syntax/markdown.vim conflicts with indentLine, redraw it
syntax region markdownItalic matchgroup=markdownItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" skip="\\\*" contains=markdownLineStart,@Spell
syntax region markdownItalic matchgroup=markdownItalicDelimiter start="\w\@<!_\S\@=" end="\S\@<=_\w\@!" skip="\\_" contains=markdownLineStart,@Spell
syntax region markdownBold matchgroup=markdownBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" skip="\\\*" contains=markdownLineStart,markdownItalic,@Spell
syntax region markdownBold matchgroup=markdownBoldDelimiter start="\w\@<!__\S\@=" end="\S\@<=__\w\@!" skip="\\_" contains=markdownLineStart,markdownItalic,@Spell
syntax region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" skip="\\\*" contains=markdownLineStart,@Spell
syntax region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\w\@<!___\S\@=" end="\S\@<=___\w\@!" skip="\\_" contains=markdownLineStart,@Spell
