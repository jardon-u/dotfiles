" ViM color file
" Maintainer:	SnP^ <gosu.snp@gmail.com>
" Last Change:	2008-03-19 00:08:31

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "snp"

hi Normal	ctermfg=Gray		ctermbg=none	guifg=Gray	guibg=Black

hi ErrorMsg	ctermfg=White		ctermbg=Red	guifg=White	guibg=Red
hi Visual	ctermfg=LightBlue	ctermbg=Gray	guifg=LightBlue guibg=Gray
hi VisualNOS	ctermfg=LightBlue	ctermbg=Gray	cterm=reverse,underline

hi Search	ctermfg=DarkBlue  	ctermbg=Gray
hi IncSearch	ctermfg=DarkBlue	ctermbg=Gray

hi SpecialKey	ctermfg=DarkBlue
hi Directory	ctermfg=Cyan
hi Title	ctermfg=Magenta		cterm=bold
hi WarningMsg	ctermfg=Red
hi WildMenu	ctermfg=Yellow		ctermbg=Black	cterm=none
hi ModeMsg	ctermfg=DarkGray
hi MoreMsg	ctermfg=Gray
hi Question	ctermfg=White		cterm=none
hi NonText	ctermfg=DarkBlue

" TODO
hi StatusLine	guifg=blue guibg=darkgray gui=none		ctermfg=blue ctermbg=gray term=none cterm=none
hi StatusLineNC	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=gray term=none cterm=none

hi Folded	ctermfg=Cyan		ctermbg=none	cterm=none
hi FoldColumn	ctermfg=Cyan		ctermbg=none	cterm=none
hi LineNr	ctermfg=DarkBlue	cterm=none

hi DiffAdd	guibg=darkblue	ctermbg=darkblue term=none cterm=none
hi DiffChange	guibg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
hi DiffText			cterm=bold ctermbg=red gui=bold guibg=Red

"hi Cursor			guifg=#000020 guibg=#ffaf38 ctermfg=FIXME ctermbg=brown
"hi lCursor			guifg=#ffffff guibg=#000000 ctermfg=FIXME ctermbg=darkgreen

"
" Syntax highlighting
"
  " Comments
hi Comment	ctermfg=DarkBlue
  " Constants
hi Constant	ctermfg=Red		cterm=none
  " Identifiers
hi Identifier	ctermfg=LightCyan	cterm=none
hi Function	ctermfg=DarkCyan
  " Statements (keywords)
hi Statement	ctermfg=Yellow		cterm=none
  " Pre-processing options
hi PreProc	ctermfg=Magenta		cterm=none
  " Types
hi Type		ctermfg=LightGreen	cterm=none
  " Special
hi Special	ctermfg=Magenta		cterm=none
  " Others
hi Error	ctermfg=Gray		ctermbg=DarkRed
"hi Ignore	ctermfg=FIXME
hi Todo		ctermfg=Gray		ctermbg=Red
hi Underlined	cterm=underline

