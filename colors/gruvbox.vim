" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Modifier: moxuze <moxuze@hotmai.com>
" Source: https://github.com/morhetz/gruvbox
" Last Modified: 20 Aug 2021
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Settings: {{{

" only load once
if (!exists('s:loaded'))
  let g:gruvbox_italic = 1
  let g:gruvbox_italicize_comments = 0
  let g:gruvbox_contrast_light = 'soft'
endif

" }}}
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvbox'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:gruvbox_bold')
  let g:gruvbox_bold = 1
endif
if !exists('g:gruvbox_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:gruvbox_italic = 1
  else
    let g:gruvbox_italic = 0
  endif
endif
if !exists('g:gruvbox_undercurl')
  let g:gruvbox_undercurl = 1
endif
if !exists('g:gruvbox_underline')
  let g:gruvbox_underline = 1
endif
if !exists('g:gruvbox_inverse')
  let g:gruvbox_inverse = 1
endif

if !exists('g:gruvbox_guisp_fallback') || index(['fg', 'bg'], g:gruvbox_guisp_fallback) == -1
  let g:gruvbox_guisp_fallback = 'NONE'
endif

if !exists('g:gruvbox_improved_strings')
  let g:gruvbox_improved_strings = 0
endif

if !exists('g:gruvbox_improved_warnings')
  let g:gruvbox_improved_warnings = 0
endif

if !exists('g:gruvbox_termcolors')
  let g:gruvbox_termcolors = 256
endif

if !exists('g:gruvbox_invert_indent_guides')
  let g:gruvbox_invert_indent_guides = 0
endif

if exists('g:gruvbox_contrast')
  echo 'g:gruvbox_contrast is deprecated; use g:gruvbox_contrast_light and g:gruvbox_contrast_dark instead'
endif

if !exists('g:gruvbox_contrast_dark')
  let g:gruvbox_contrast_dark = 'medium'
endif

if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light = 'medium'
endif

let s:is_dark = (&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234] " 29-32-33
let s:gb.dark0       = ['#282828', 235] " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236] " 50-48-47
let s:gb.dark1       = ['#3c3836', 237] " 60-56-54
let s:gb.dark2       = ['#504945', 239] " 80-73-69
let s:gb.dark3       = ['#665c54', 241] " 102-92-84
let s:gb.dark4       = ['#7c6f64', 243] " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243] " 124-111-100

let s:gb.gray_245    = ['#928374', 245] " 146-131-116
let s:gb.gray_244    = ['#928374', 244] " 146-131-116

let s:gb.light0_hard = ['#f9f5d7', 230] " 249-245-215
let s:gb.light0      = ['#fbf1c7', 229] " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228] " 242-229-188
let s:gb.light1      = ['#ebdbb2', 223] " 235-219-178
let s:gb.light2      = ['#d5c4a1', 250] " 213-196-161
let s:gb.light3      = ['#bdae93', 248] " 189-174-147
let s:gb.light4      = ['#a89984', 246] " 168-153-132
let s:gb.light4_256  = ['#a89984', 246] " 168-153-132

let s:gb.bright_red     = ['#fb4934', 167] " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142] " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214] " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109] " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175] " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108] " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208] " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124] " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106] " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172] " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66 ] " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132] " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72 ] " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166] " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88 ] " 157-0-6
let s:gb.faded_green    = ['#79740e', 100] " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136] " 181-118-20
let s:gb.faded_blue     = ['#076678', 24 ] " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96 ] " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66 ] " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130] " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:gruvbox_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:gruvbox_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:gruvbox_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:gruvbox_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:gruvbox_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  let s:bge0 = s:gb.dark0_soft
  let s:bge1 = s:gb.dark1
  let s:bge2 = s:gb.dark2
  let s:bge3 = s:gb.dark3
  if g:gruvbox_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
    let s:bge0 = s:gb.dark1
    let s:bge1 = s:gb.dark2
    let s:bge2 = s:gb.dark3
    let s:bge3 = s:gb.dark4
  elseif g:gruvbox_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
    let s:bge0 = s:gb.dark0
    let s:bge1 = s:gb.dark0_soft
    let s:bge2 = s:gb.dark1
    let s:bge3 = s:gb.dark2
  endif

  let s:bg1 = s:gb.dark1
  let s:bg2 = s:gb.dark2
  let s:bg3 = s:gb.dark3
  let s:bg4 = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  let s:bge0 = s:gb.light0_soft
  let s:bge1 = s:gb.light1
  let s:bge2 = s:gb.light2
  let s:bge3 = s:gb.light3
  if g:gruvbox_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
    let s:bge0 = s:gb.light1
    let s:bge1 = s:gb.light2
    let s:bge2 = s:gb.light3
    let s:bge3 = s:gb.light4
  elseif g:gruvbox_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
    let s:bge0 = s:gb.light0
    let s:bge1 = s:gb.light0_soft
    let s:bge2 = s:gb.light1
    let s:bge3 = s:gb.light2
  endif

  let s:bg1 = s:gb.light1
  let s:bg2 = s:gb.light2
  let s:bg3 = s:gb.light3
  let s:bg4 = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:gruvbox_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray
let s:gb.bge0 = s:bge0
let s:gb.bge1 = s:bge1
let s:gb.bge2 = s:bge2

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:gruvbox_hls_cursor')
  let s:hls_cursor = get(s:gb, g:gruvbox_hls_cursor)
endif

let s:number_column = exists('g:gruvbox_number_column')
  \? get(s:gb, g:gruvbox_number_column) : s:gb.bge0

if exists('g:gitgutter_override_sign_column_highlight') &&
  \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0
  let s:sign_column = exists('g:gruvbox_sign_column')
    \? get(s:gb, g:gruvbox_sign_column) : s:gb.bge1
endif

let s:color_column = s:bg1
if exists('g:gruvbox_color_column')
  let s:color_column = get(s:gb, g:gruvbox_color_column)
endif

let s:vert_split = s:bg0
if exists('g:gruvbox_vert_split')
  let s:vert_split = get(s:gb, g:gruvbox_vert_split)
endif

let s:invert_signs = ''
if exists('g:gruvbox_invert_signs')
  if g:gruvbox_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:gruvbox_invert_selection')
  if g:gruvbox_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:gruvbox_invert_tabline')
  if g:gruvbox_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:gruvbox_italicize_comments')
  if g:gruvbox_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:gruvbox_italicize_strings')
  if g:gruvbox_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [
    \  'hi',
    \  a:group,
    \  'guifg=' . fg[0], 'ctermfg=' . fg[1],
    \  'guibg=' . bg[0], 'ctermbg=' . bg[1],
    \  'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
    \]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Gruvbox Hi Groups: {{{

" memoize common hi groups
call s:HL('GruvboxFg0'  , s:fg0 )
call s:HL('GruvboxFg1'  , s:fg1 )
call s:HL('GruvboxFg2'  , s:fg2 )
call s:HL('GruvboxFg3'  , s:fg3 )
call s:HL('GruvboxFg4'  , s:fg4 )
call s:HL('GruvboxGray' , s:gray)
call s:HL('GruvboxBg0'  , s:bg0 )
call s:HL('GruvboxBg1'  , s:bg1 )
call s:HL('GruvboxBg2'  , s:bg2 )
call s:HL('GruvboxBg3'  , s:bg3 )
call s:HL('GruvboxBg4'  , s:bg4 )
call s:HL('GruvboxBgEx0', s:bge0)
call s:HL('GruvboxBgEx1', s:bge1)
call s:HL('GruvboxBgEx2', s:bge2)
call s:HL('GruvboxBgEx3', s:bge3)

call s:HL('GruvboxRed'   , s:red   )
call s:HL('GruvboxGreen' , s:green )
call s:HL('GruvboxYellow', s:yellow)
call s:HL('GruvboxBlue'  , s:blue  )
call s:HL('GruvboxPurple', s:purple)
call s:HL('GruvboxAqua'  , s:aqua  )
call s:HL('GruvboxOrange', s:orange)

call s:HL('GruvboxRedBold'   , s:red   , s:none, s:bold)
call s:HL('GruvboxGreenBold' , s:green , s:none, s:bold)
call s:HL('GruvboxYellowBold', s:yellow, s:none, s:bold)
call s:HL('GruvboxBlueBold'  , s:blue  , s:none, s:bold)
call s:HL('GruvboxPurpleBold', s:purple, s:none, s:bold)
call s:HL('GruvboxAquaBold'  , s:aqua  , s:none, s:bold)
call s:HL('GruvboxOrangeBold', s:orange, s:none, s:bold)

call s:HL('GruvboxRedSign'   , s:red   , s:sign_column, s:invert_signs)
call s:HL('GruvboxGreenSign' , s:green , s:sign_column, s:invert_signs)
call s:HL('GruvboxYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GruvboxBlueSign'  , s:blue  , s:sign_column, s:invert_signs)
call s:HL('GruvboxPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GruvboxAquaSign'  , s:aqua  , s:sign_column, s:invert_signs)
call s:HL('GruvboxOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine', s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn', s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bge1)
endif

hi! link NonText GruvboxBg2
hi! link SpecialKey GruvboxBg2

call s:HL('Visual', s:none, s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search', s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine', s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory GruvboxGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title GruvboxGreenBold

" Error messages on the command line
call s:HL('ErrorMsg', s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg GruvboxYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg GruvboxYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question GruvboxOrangeBold
" Warning messages
hi! link WarningMsg GruvboxRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:gruvbox_improved_strings == 0
  hi! link Special GruvboxOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement GruvboxRed
" if, then, else, endif, swicth, etc.
hi! link Conditional GruvboxRed
" for, do, while, etc.
hi! link Repeat GruvboxRed
" case, default, etc.
hi! link Label GruvboxRed
" try, catch, throw
hi! link Exception GruvboxRed
" sizeof, "+", "*", etc.
hi! link Operator GruvboxAqua
" Any other keyword
hi! link Keyword GruvboxRed
" ",", ".", ":" etc.
hi! link Delimiter GruvboxFg3

" Variable name
hi! link Identifier GruvboxBlue
" Function name
hi! link Function GruvboxGreenBold

" Generic preprocessor
hi! link PreProc GruvboxAqua
" Preprocessor #include
hi! link Include GruvboxAqua
" Preprocessor #define
hi! link Define GruvboxAqua
" Same as Define
hi! link Macro GruvboxAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit GruvboxAqua

" Generic constant
hi! link Constant GruvboxPurple
" Character constant: 'c', '/n'
hi! link Character GruvboxPurple
" String constant: "this is a string"
if g:gruvbox_improved_strings == 0
  call s:HL('String', s:green, s:none, s:italicize_strings)
else
  call s:HL('String', s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean GruvboxPurple
" Number constant: 234, 0xff
hi! link Number GruvboxPurple
" Floating point constant: 2.3e10
hi! link Float GruvboxPurple

" Generic type
hi! link Type GruvboxYellow
" static, register, volatile, etc
hi! link StorageClass GruvboxOrange
" struct, union, enum, etc.
hi! link Structure GruvboxAqua
" typedef
hi! link Typedef GruvboxYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd', s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText', s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:gruvbox_improved_warnings == 0
    call s:HL('SpellCap', s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap', s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad', s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare', s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" BUNDLE coc.nvim: {{{

hi! link CocCodeLens           GruvboxGray
hi! link CocDiagnosticsError   GruvboxRed
hi! link CocDiagnosticsHint    GruvboxBlue
hi! link CocDiagnosticsInfo    GruvboxYellow
hi! link CocDiagnosticsWarning GruvboxOrange
hi! link CocErrorFloat         GruvboxRed
hi! link CocErrorSign          GruvboxRedSign
hi! link CocHintFloat          GruvboxBlue
hi! link CocHintSign           GruvboxBlueSign
hi! link CocInfoFloat          GruvboxYellow
hi! link CocInfoSign           GruvboxYellowSign
hi! link CocSelectedText       GruvboxRed
hi! link CocWarningFloat       GruvboxOrange
hi! link CocWarningSign        GruvboxOrangeSign

call s:HL('CocErrorHighlight'  , s:none, s:none, s:undercurl, s:red   )
call s:HL('CocHintHighlight'   , s:none, s:none, s:undercurl, s:blue  )
call s:HL('CocInfoHighlight'   , s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)

" }}}
" BUNDLE vim-clap: {{{

call s:HL('ClapShadow', s:bge0, s:bge0)

" }}}
" BUNDLE vim-gitgutter: {{{

hi! link GitGutterAdd          DiffAdd
hi! link GitGutterChange       DiffChange
hi! link GitGutterChangeDelete DiffText
hi! link GitGutterDelete       DiffDelete

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded   GruvboxGreen
hi! link diffChanged GruvboxAqua
hi! link diffFile    GruvboxOrange
hi! link diffLine    GruvboxBlue
hi! link diffNewFile GruvboxYellow
hi! link diffRemoved GruvboxRed

" }}}
" GitCommit: "{{{

hi! link gitcommitDiscardedFile GruvboxRed
hi! link gitcommitSelectedFile  GruvboxGreen

" }}}
" Html: {{{

hi! link htmlArg            GruvboxYellow
hi! link htmlEndTag         GruvboxBlue
hi! link htmlScriptTag      GruvboxPurple
hi! link htmlSpecialChar    GruvboxOrange
hi! link htmlSpecialTagName GruvboxAquaBold
hi! link htmlTag            GruvboxBlue
hi! link htmlTagN           GruvboxFg1
hi! link htmlTagName        GruvboxAquaBold
hi! link htmlTitle          NONE

call s:HL('htmlBold'               , s:vim_fg, s:vim_bg, s:bold                         )
call s:HL('htmlBoldItalic'         , s:vim_fg, s:vim_bg, s:bold . s:italic              )
call s:HL('htmlBoldUnderline'      , s:vim_fg, s:vim_bg, s:bold . s:underline           )
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)
call s:HL('htmlItalic'             , s:vim_fg, s:vim_bg, s:italic                       )
call s:HL('htmlLink'               , s:fg4   , s:none  , s:underline                    )
call s:HL('htmlUnderline'          , s:vim_fg, s:vim_bg, s:underline                    )
call s:HL('htmlUnderlineItalic'    , s:vim_fg, s:vim_bg, s:underline . s:italic         )

" }}}
" Xml: {{{

hi! link dtdFunction          GruvboxGray
hi! link dtdParamEntityPunct  GruvboxGray
hi! link dtdParamEntityDPunct GruvboxGray
hi! link dtdTagName           GruvboxPurple
hi! link docbkKeyword         GruvboxAquaBold
hi! link xmlAttrib            GruvboxAqua
hi! link xmlAttribPunct       GruvboxGray
hi! link xmlCdataCdata        GruvboxPurple
hi! link xmlCdataStart        GruvboxGray
hi! link xmlDocTypeDecl       GruvboxGray
hi! link xmlDocTypeKeyword    GruvboxPurple
hi! link xmlEntity            GruvboxOrange
hi! link xmlEntityPunct       GruvboxOrange
hi! link xmlEndTag            GruvboxBlue
hi! link xmlEqual             GruvboxBlue
hi! link xmlProcessingDelim   GruvboxGray
hi! link xmlTag               GruvboxBlue
hi! link xmlTagName           GruvboxBlue
" }}}
" Vim: {{{

hi! link vimBracket  vimMapModKey
hi! link vimFunction Function
hi! link vimUserFunc Function

" }}}
" C/C++ BUNDLE vim-lsp-cxx-highlight: {{{

hi! link cStructure                  GruvboxOrange
hi! link LspCxxHlGroupEnumConstant   cConstant
hi! link LspCxxHlGroupMemberVariable LspCxxHlSymVariable
hi! link LspCxxHlGroupNamespace      cInclude
hi! link LspCxxHlSymConstructor      Type
hi! link LspCxxHlSymMacro            GruvboxBlue

call s:HL('LspCxxHlSymParameter', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Python: {{{

hi! link pythonBoolean     GruvboxPurple
hi! link pythonBuiltin     GruvboxOrange
hi! link pythonBuiltinFunc GruvboxOrange
hi! link pythonBuiltinObj  GruvboxOrange
hi! link pythonCoding      GruvboxBlue
hi! link pythonConditional GruvboxRed
hi! link pythonDecorator   GruvboxRed
hi! link pythonDot         GruvboxFg3
hi! link pythonDottedName  GruvboxGreenBold
hi! link pythonException   GruvboxRed
hi! link pythonExceptions  GruvboxPurple
hi! link pythonFunction    GruvboxAqua
hi! link pythonInclude     GruvboxBlue
hi! link pythonImport      GruvboxBlue
hi! link pythonOperator    GruvboxRed
hi! link pythonRun         GruvboxBlue
hi! link pythonRepeat      GruvboxRed

" }}}
" CSS: {{{

hi! link cssAnimationProp        GruvboxOrange
hi! link cssAttrComma            Delimiter
hi! link cssBackgroundProp       GruvboxOrange
hi! link cssBorderOutlineProp    GruvboxOrange
hi! link cssBoxProp              GruvboxOrange
hi! link cssBraces               Delimiter
hi! link cssClassDot             Delimiter
hi! link cssClassName            GruvboxGreen
hi! link cssColor                GruvboxBlue
hi! link cssColorProp            GruvboxOrange
hi! link cssCustomProp           GruvboxAqua
hi! link cssDimensionProp        GruvboxOrange
hi! link cssFlexibleBoxProp      GruvboxOrange
hi! link cssFontDescriptorProp   GruvboxOrange
hi! link cssFontProp             GruvboxOrange
hi! link cssFunctionName         GruvboxYellow
hi! link cssGeneratedContentProp GruvboxOrange
hi! link cssIdentifier           GruvboxYellow
hi! link cssImportant            GruvboxGreen
hi! link cssListProp             GruvboxOrange
hi! link cssMarginPro            GruvboxOrange
hi! link cssNoise                Delimiter
hi! link cssPaddingProp          GruvboxOrange
hi! link cssPositioningProp      GruvboxOrange
hi! link cssPrintProp            GruvboxOrange
hi! link cssRenderProp           GruvboxOrange
hi! link cssSelectorOp           GruvboxBlue
hi! link cssSelectorOp2          GruvboxBlue
hi! link cssTableProp            GruvboxOrange
hi! link cssTagName              GruvboxBlue
hi! link cssTextProp             GruvboxOrange
hi! link cssTransformProp        GruvboxOrange
hi! link cssTransitionProp       GruvboxOrange
hi! link cssUIProp               GruvboxOrange
hi! link cssUnitDecorators       GruvboxBlue
hi! link cssVendor               GruvboxFg1
hi! link cssVendorProp           GruvboxYellow

" }}}
" Java: {{{

hi! link javaAnnotation   GruvboxBlue
hi! link javaDelimiter    Delimiter
hi! link javaDocTags      GruvboxAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaIdentifier   NONE
hi! link javaOperator     GruvboxOrange
hi! link javaParen        GruvboxFg3
hi! link javaParen1       GruvboxFg3
hi! link javaParen2       GruvboxFg3
hi! link javaParen3       GruvboxFg3
hi! link javaParen4       GruvboxFg3
hi! link javaParen5       GruvboxFg3
hi! link javaVarArg       GruvboxGreen

" }}}
" JavaScript BUNDLE vim-javascript: {{{

hi! link jsArrowFunction       Operator
hi! link jsBraces              Delimiter
hi! link jsBrackets            Delimiter
hi! link jsClassBraces         Delimiter
hi! link jsClassDefinition     Type
hi! link jsClassKeyword        Keyword
hi! link jsClassNoise          Delimiter
hi! link jsDot                 Delimiter
hi! link jsDestructuringBraces Delimiter
hi! link jsDestructuringNoise  Delimiter
hi! link jsExport              Keyword
hi! link jsExportDefault       Type
hi! link jsExportDefaultGroup  Type
hi! link jsExtendsKeyword      Keyword
hi! link jsFinallyBraces       Delimiter
hi! link jsFrom                Keyword
hi! link jsFuncArgCommas       Delimiter
hi! link jsFuncBraces          Delimiter
hi! link jsFuncParens          Delimiter
hi! link jsFunction            GruvboxAqua
hi! link jsFunctionKey         Function
hi! link jsGlobalNodeObjects   GruvboxYellowBold
hi! link jsGlobalObjects       GruvboxYellowBold
hi! link jsIfElseBraces        Delimiter
hi! link jsImport              Keyword
hi! link jsModuleAs            Keyword
hi! link jsModuleBraces        Delimiter
hi! link jsModuleKeyword       Identifier
hi! link jsNull                Constant
hi! link jsNoise               Delimiter
hi! link jsObjectBraces        Delimiter
hi! link jsObjectColon         Operator
hi! link jsObjectSeparator     Delimiter
hi! link jsObjectKey           Identifier
hi! link jsOperatorKeyWord     Keyword
hi! link jsParens              Delimiter
hi! link jsPrototype           GruvboxBlue
hi! link jsRepeatBraces        Delimiter
hi! link jsStorageClass        StorageClass
hi! link jsSwitchBraces        Delimiter
hi! link jsSwitchColon         Delimiter
hi! link jsTemplateBraces      GruvboxAqua
hi! link jsTryCatchBraces      Delimiter
hi! link jsUndefined           Constant

" }}}
" Json: {{{

hi! link jsonBraces       Delimiter
hi! link jsonKeyword      Identifier
hi! link jsonKeywordMatch Operator
hi! link jsonNoise        Delimiter
hi! link jsonNull         Constant
hi! link jsonQuote        Delimiter
hi! link jsonString       String

" }}}
" Markdown BUNDLE vim-markdown: {{{

hi! link mkdBold       htmlBold
hi! link mkdBoldItalic htmlBoldItalic
hi! link mkdItalic     htmlItalic

" }}}

" Commands --------------------------------------------------------------------
" Toggle Gruvbox Contrast: {{{

if (!exists('s:loaded'))
  function s:toggle_contrast() abort
    let l:is_dark = &background ==# 'dark'
    let l:contrast = l:is_dark ? g:gruvbox_contrast_dark : g:gruvbox_contrast_light
    let l:next = get({ 'soft': 'medium', 'medium': 'hard', 'hard': 'soft' }, l:contrast)
    if (l:is_dark)
      let g:gruvbox_contrast_dark = l:next
    else
      let g:gruvbox_contrast_light = l:next
    endif
    colorscheme gruvbox
    if (exists('*g:UpdateColorLightline'))
      call g:UpdateColorLightline()
    endif
    echomsg l:next
  endfunction
  command! -nargs=0 Contrast call <SID>toggle_contrast()
endif

" }}}

if (!exists('s:loaded')) | let s:loaded = 1 | endif

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
