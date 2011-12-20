" Vim syntax file
" Language:     Stratego And SDF
" Filenames:    *.str *.def *.sdf *.pp *.ppsdf *.ppdef
" Maintainers:  Pouillard Nicolas     <pouill_n@lrde.epita.fr>
" URL:          http://www.epita.fr/~pouill_n/vim/syntax/stratego.vim
" Last Change:  2008-03-19 00:17:37
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Stratego is case sensitive.
syn case match


" lowercase identifier - the standard way to match
syn match    strategoLCIdentifier /\<\(\l\|_\)\(\w\|'\)*\>/

syn match    strategoKeyChar    "|"

" Errors
syn match    strategoBraceErr    "}"
"syn match    strategoBrackErr    "\]"
syn match    strategoParenErr    ")"
syn match    strategoDbBrackErr  "\]|"
syn match    strategoDbBrackErr "\]\]"

syn match    strategoCommentErr "\*)"
syn match    strategoCommentErr "\*/"

" Some convenient clusters
syn cluster  strategoAllErrs contains=strategoBraceErr,strategoBrackErr,strategoParenErr,strategoCbBrackErr,strategoCommentErr,Error

syn cluster  strategoAENoParen contains=strategoBraceErr,strategoBrackErr,strategoDbBrackErr,strategoCommentErr

syn cluster  strategoContained contains=strategoTodo,strategoModule,strategoMatch,strategoSpecialString,strategoSpecialMatch,strategoVarPlain,strategoVarBlock,strategoSpecialBEOM,strategoVarSlash,Error


" Enclosing delimiters
syn region   strategoEncl transparent matchgroup=strategoKeyword start="(" matchgroup=strategoKeyword end=")" contains=ALLBUT,@strategoContained,strategoParenErr
syn region   strategoEncl transparent matchgroup=strategoKeyword start="{" matchgroup=strategoKeyword end="}"  contains=ALLBUT,@strategoContained,strategoBraceErr
syn region   strategoEncl transparent matchgroup=strategoKeyword start="\[" matchgroup=strategoKeyword end="\]" contains=ALLBUT,@strategoContained,strategoBrackErr
syn region   strategoEncl transparent matchgroup=strategoKeyword start="|\[" matchgroup=strategoKeyword end="\]|" contains=ALLBUT,@strategoContained,strategoDbBrackErr


" Comments
syn region   strategoComment start="(\*" end="\*)" contains=strategoComment,strategoTodo
syn region   strategoComment start="/\*" end="\*/" contains=strategoComment,strategoTodo
syn region   strategoComment start="\(%%\|//\)" end="\n" contains=strategoComment,strategoTodo
syn keyword  strategoTodo contained TODO FIXME XXX


syn region   strategoModule matchgroup=strategoKeyword start="\(^\|\s\)\(module\|imports\|exports\|lexical\|rules\|hiddens\)\(\s\|$\)" matchgroup=strategoKeyword end="\(^\|\s\)\(exports\|imports\|strategies\|rules\|context-free\|lexical\|signature\|hiddens\)\(\s\|$\)"me=e-12 contains=@strategoAllErrs,strategoComment,strategoMatch skipwhite skipempty

"syn region   strategoModule matchgroup=strategoKeyword start="\<imports\>" matchgroup=strategoModule end="\<\u\(\w\|'\|-\)*\>" contains=@strategoAllErrs,strategoComment,strategoUId skipwhite skipempty nextgroup=strategoImports
"syn match    strategoImports "\<imports\>" contained skipwhite skipempty
"
"syn match    strategoExports "\<exports\>" contained skipwhite skipempty
"
"syn region   strategoRules matchgroup=strategoKeyword start="\<rules\>" matchgroup=strategoKeyword end="\<end\>" contained contains=@strategoContained,strategoAllErr
"syn region   strategoStra matchgroup=strategoStra start="\<strategies\>" matchgroup=strategoModule end="\<end\>" contained contains=ALLBUT,@strategoContained,strategoEndErr,strategoModule
"syn region   strategoFree matchgroup=strategoFree start="\<free-context grammar\>" matchgroup=strategoModule end="\<end\>" contained contains=ALLBUT,@strategoContained,strategoEndErr,strategoModule
"syn region   strategoLex matchgroup=strategoLex start="\<lexical\>" matchgroup=strategoModule end="\<end\>" contained contains=ALLBUT,@strategoContained,strategoEndErr,strategoModule

syn match    strategoKeyword "\(^\|\s\)\(context-free\|definition\|hiddens\|sorts\|exports\|rules\|strategies\|syntax\|restrictions\|priorities\|variables\|lexical\|where\|signature\|constructors\|overlays\)\(\s\|$\)"
syn keyword  strategoStrategies iowrap one some all topdown bottomup try rec

syn match    strategoConstructor  "(\s*>)"
"syn match    strategoConstructor  "\[\s*\]"
syn match    strategoConstructor  "|\[\s*\]|"
syn match    strategoConstructor  "\[\[\s*>\]\]"
syn match    strategoConstructor  "{\s*>}"
syn match    strategoUId          "\u\(\w\|'\|-\)*\>"
syn match    strategoRule         "\(\w\|'\|-\)\+\s*\(,\s*\(\w\|'\|-\)\+\s*\)*:"
syn match    strategoStrategies  "\(\w\|'\|-\)\+\s*="me=e-1
syn match    strategoNoMatch     "\(\w\|'\|-\)\+\s*=>"me=e-2
syn match    strategoStrategies  "\(\w\|'\|-\)\+\s*([^)]*)\s*="me=e-1
syn match    strategoNoMatch     "\(\w\|'\|-\)\+\s*([^)]*)\s*=>"me=e-2

syn region   strategoString       start=+"+ skip=+\\\\\|\\"+ end=+"+

syn match    strategoFunDef       "->"
syn match    strategoRestriction  "-/-"
syn match    strategoHashFDef     "=>"
syn match    strategoKeyChar      "!"
syn match    strategoKeyChar      "|"
syn match    strategoKeyChar      "\~"
syn match    strategoKeyChar      "?"
syn match    strategoKeyChar      "#"
syn match    strategoKeyChar      "\*"
syn match    strategoKeyChar      "+"
syn match    strategoKeyChar      "\\"
syn match    strategoKeyChar      "/[^*/]"me=e-1

syn match    strategoStrategiesOp "<"
syn match    strategoStrategiesOp ">"  " because <s>t
syn match    strategoStrategiesOp "<+"
syn match    strategoStrategiesOp ";"

"syn match    strategoStrategies   "<\(\w\|-\)\+>"

syn match    strategoNumber       "\<-\=\d\+\>"
syn match    strategoNumber       "\<-\=0[x|X]\x\+\>"
syn match    strategoNumber       "\<-\=0[o|O]\o\+\>"
syn match    strategoNumber       "\<-\=0[b|B][01]\+\>"
syn match    strategoFloat        "\<-\=\d\+\.\d*\([eE][-+]\=\d\+\)\=[fl]\=\>"

" Special characters in strings and matches
syn match  strategoSpecialString	"\\\(\d\+\|[xX]\x\+\|c\u\|.\)" contained
syn match  strategoSpecialStringU	"\\['\\]" contained
"syn match  strategoSpecialMatch	"{\d\(,\d\)\=}" contained
"syn match  strategoMatch	"\[\(\]\|-\)\=[^\[\]]*\(\[\|\-\)\=\]" " contained
"syn match  strategoSpecialMatch	"[+*()?.]" contained
"syn match  strategoSpecialMatch	"(?[#:=!]" contained
"syn match  strategoSpecialMatch	"(?[imsx]\+)" contained

" Simple version of searches and matches in []
syn region strategoMatch	matchgroup=strategoMatchStartEnd start=+\[\]\?+me=e-1 end=+\]+ contains=strategoSpecialString,strategoSpecialMatch,strategoVarPlain,strategoVarBlock,strategoSpecialBEOM,strategoVarSlash,Error contained

syn match Error '\s\+$'

" Synchronization
syn sync minlines=50
syn sync maxlines=500

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_stratego_syntax_inits")
  if version < 508
    let did_stratego_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink strategoBraceErr     Error
  HiLink strategoBrackErr     Error
  HiLink strategoParenErr     Error
  HiLink strategoDbBrackErr   Error

  HiLink strategoCommentErr   Error

  HiLink strategoComment      Comment

  HiLink strategoModule       Include
"  HiLink strategoImports      Keyword
"  HiLink strategoExports      Keyword

"  HiLink strategoFree         Include
"  HiLink strategoLex          Include
"  HiLink strategoRules        Include
"  HiLink strategoStra         Include

  HiLink strategoConstructor  Constant

  HiLink strategoKeyword      Keyword
  HiLink strategoFunDef       Keyword
  HiLink strategoHashFDef     Keyword
  HiLink strategoKeyChar      Keyword
  HiLink strategoAnyVar       Keyword
  HiLink strategoTopStop      Keyword
  HiLink strategoOperator     Keyword
  HiLink strategoRestriction  Keyword

  HiLink strategoBoolean      Boolean
  HiLink strategoCharacter    Character
  HiLink strategoNumber       Number
  HiLink strategoFloat        Float
  HiLink strategoString       String
  HiLink strategoMatch	  String
  HiLink strategoMatchStartEnd Include

  HiLink strategoStrategies   Identifier
  HiLink strategoStrategiesOp Identifier

  HiLink strategoRule         Type

  HiLink strategoUId          String
  HiLink strategoSpecialMatch Include
  HiLink strategoSpecialString Include
  HiLink strategoSpecialStringU Include

  HiLink strategoTodo         Todo

  HiLink strategoEncl         Keyword

  delcommand HiLink
endif

let b:current_syntax = "stratego"

