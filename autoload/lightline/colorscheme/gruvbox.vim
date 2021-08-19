" ----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Gruvbox colorscheme for Lightline (itchyny/lightline.vim)
" Author: gmoe <me@griffinmoe.com>
" Modifier: moxuze <moxuze@hotmail.com>
" Source: https://github.com/morhetz/gruvbox
" Last Modified: 19 Aug 2021
" -----------------------------------------------------------------------------

function! s:color(group)
  let guiColor  = synIDattr(hlID(a:group), 'fg', 'gui'  ) 
  let termColor = synIDattr(hlID(a:group), 'fg', 'cterm') 
  return [guiColor, termColor]
endfunction

if exists('g:lightline')
  let s:bg0 = s:color('GruvboxBg0')
  let s:bg1 = s:color('GruvboxBg1')
  let s:bg2 = s:color('GruvboxBg2')
  let s:bg4 = s:color('GruvboxBg4')
  let s:fg1 = s:color('GruvboxFg1')
  let s:fg2 = s:color('GruvboxFg2')
  let s:fg3 = s:color('GruvboxFg3')
  let s:fg4 = s:color('GruvboxFg4')

  let s:yellow = s:color('GruvboxYellow')
  let s:blue   = s:color('GruvboxBlue'  )
  let s:aqua   = s:color('GruvboxAqua'  )
  let s:orange = s:color('GruvboxOrange')
  let s:green  = s:color('GruvboxGreen' )
  let s:purple = s:color('GruvboxPurple')

  let s:p = {
    \  'normal' : {}, 'inactive': {}, 'insert' : {}, 'command' : {},
    \  'replace': {}, 'visual'  : {}, 'tabline': {}, 'terminal': {},
    \}
  let s:p.normal.left     = [[s:bg0, s:fg4   ], [s:fg2, s:bg2]]
  let s:p.normal.right    = [[s:bg0, s:fg4   ], [s:fg3, s:bg2]]
  let s:p.normal.middle   = [[s:fg4, s:bg1   ]]
  let s:p.inactive.right  = [[s:bg4, s:bg1   ], [s:bg4, s:bg1]]
  let s:p.inactive.left   = [[s:bg4, s:bg1   ], [s:bg4, s:bg1]]
  let s:p.inactive.middle = [[s:bg4, s:bg1   ]]
  let s:p.insert.left     = [[s:bg0, s:blue  ], [s:fg1, s:bg2]]
  let s:p.insert.right    = [[s:bg0, s:blue  ], [s:fg3, s:bg2]]
  let s:p.insert.middle   = [[s:fg4, s:bg1   ]]
  let s:p.command.left    = [[s:bg0, s:yellow], [s:fg1, s:bg2]]
  let s:p.command.right   = [[s:bg0, s:yellow], [s:fg3, s:bg2]]
  let s:p.command.middle  = [[s:fg4, s:bg1   ]]
  let s:p.terminal.left   = [[s:bg0, s:green ], [s:fg1, s:bg2]]
  let s:p.terminal.right  = [[s:bg0, s:fg4   ], [s:fg3, s:bg2]]
  let s:p.terminal.middle = [[s:fg4, s:bg1   ]]
  let s:p.replace.left    = [[s:bg0, s:orange], [s:fg1, s:bg2]]
  let s:p.replace.right   = [[s:bg0, s:orange], [s:fg3, s:bg2]]
  let s:p.replace.middle  = [[s:fg4, s:bg1   ]]
  let s:p.visual.left     = [[s:bg0, s:purple], [s:bg0, s:bg4]]
  let s:p.visual.right    = [[s:bg0, s:purple], [s:bg0, s:bg4]]
  let s:p.visual.middle   = [[s:fg4, s:bg1   ]]
  let s:p.tabline.left    = [[s:fg4, s:bg2   ]]
  let s:p.tabline.tabsel  = [[s:bg0, s:fg4   ]]
  let s:p.tabline.middle  = [[s:bg0, s:bg0   ]]
  let s:p.tabline.right   = [[s:bg0, s:aqua  ]]
  let s:p.normal.error    = [[s:bg0, s:orange]]
  let s:p.normal.warning  = [[s:bg2, s:yellow]]

  let g:lightline#colorscheme#gruvbox#palette = lightline#colorscheme#flatten(s:p)
endif
