" Vim syntax file
" Language:     Tiger
" Filenames:    *.tig
" Maintainers:  Timon Christl <me@christltimon.de>
" URL:          http://www.fmi.uni-passau.de/~christl/vim/tiger.vim
" Last Change:  2002 Nov 03 - Began writing (TC)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Tiger is case sensitive.
syn case match

syn keyword tigTodo TODO FIXME XXX

syn keyword tigDecls type var function
syn keyword tigNil nil
syn keyword tigTypes int string array of
syn keyword tigConditional while if then else
syn keyword tigLoops for to do while break
syn keyword tigLet let in end

syn match tigOp ":=" "|" "&" ">=" ">" "<=" "<" "<>" "=" "/" "*" "-" "+" "."
syn match tigPunctuation ";" ":" ","
syn match tigNumber /\d\+/
syn match tigID /\<\a\(\a\|\d\|_\)*\>/

syn region tigComment start=/\/\*/ end=/\*\// contains=tigTodo,tigComment
syn region tigBlock start=/{/ end=/}/ contains=ALL fold
syn region tigBrackets start=/\[/ end=/\]/ contains=ALL
syn region tigParens start=/(/ end=/)/ contains=ALL

syn match tigStringEscapes /\\\(\\\|n\|t\|^[@-_]\|\d\d\d\|\"\)/ contained

syn match tigStringLCWs /\s\+/ contained
syn region tigStringLC matchgroup=tigStringEscapes start=/\\$/ end=/^\\/ contained contains=tigStringLCWs

syn region tigString start=/\"/ skip=/\\\"/ end=/\"/ contains=tigStringEscapes,tigStringLC

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tiger_syntax_inits")
  if version < 508
    let did_tiger_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tigTODO            Todo

  HiLink tigDecls           Keyword
  HiLink tigNil             Constant
  HiLink tigTypes           Type
  HiLink tigConditional     Conditional
  HiLink tigLoops           Repeat
  HiLink tigLet             Keyword
  HiLink tigOp              Operator

  HiLink tigComment         Comment
  HiLink tigBlock           Delimiter
  HiLink tigBrackets        Delimiter
  HiLink tigParens          Delimiter

  HiLink tigPunctuation     Delimiter

  HiLink tigNumber          Number
  HiLink tigString          String
  HiLink tigStringEscapes   SpecialChar

  HiLink tigStringLC        Error
  HiLink tigStringLCErr     Error
  HiLink tigStringLCWs      String

  HiLink tigID              Identifier

  delcommand HiLink
endif

let b:current_syntax = "tiger"

" vim: ts=28

