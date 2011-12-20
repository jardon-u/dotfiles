" Vim syntax file
" Language:     Yapp
" Filenames:    *.*
" Maintainers:  Pouillard Nicolas     <pouill_n@lrde.epita.fr>
" URL:          http://www.epita.fr/~pouill_n/vim/syntax/yapp.vim
" Last Change:  2004 Mar 29 - new style matching
" 		2004 Feb 22 - first version
"

" Yapp is case sensitive.
syn case match
syn region   yappDirective matchgroup=yappKeyword start="^\\\(use\|require\|imports\|language\|executable\|library\|dynlib\|package\|prepackage\|interface\|target\|distribution\|distribute\)" matchgroup=yappComment end=';.*$'re=s+1 keepend oneline contains=yappModule,yappOp,yappString,yappKeyword transparent

syn keyword  yappKeyword include standard library cflags	contained
syn keyword  yappKeyword lflags back_cflags back_lflags		contained
syn keyword  yappKeyword linker transformer interpreter		contained
"syn region   yappString start=+'+ skip=+\\\\\|\\'+ end=+'+	contained
syn match    yappModule	"\<\(std::\)\?\(\u\|\d\+[a-zA-Z+-]\)\(\w\|[+-]\)*\(::\.\?\(\u\|\d\+[a-zA-Z+-]\)\(\w\|[+-]\)*\)*\>" contained contains=yappInfix
syn match    yappInfix	"::\.\?"				contained
syn match    yappOp	";"					contained

"syn match   yappDirective "^\\use\s\+\(include\|standard\|library\|cflags\|lflags\|back_cflags\|back_lflags\)\s\+'[^']\+'\s*;"
"syn match   yappDirective "^\\\(use\|language\|interface\|target\|package\|prepackage\)\s\+\(std::\)\?\(\u\|\d\)\(\w\|['+-]\)*\(::\(\u\|\d\)\(\w\|['+-]\)*\)*\s*;"
"syn match   yappDirective "^\\\(executable\|library\|dynlib\)\s\+\(std::\)\?\(\u\|\d\)\(\w\|['+-]\)*\(::\(\u\|\d\)\(\w\|['+-]\)*\)*\s\+'[^']\+'\s*;"
"syn match   yappDirective "^\\distribution\s\+'[^']\+'\s*;"

if version >= 508 || !exists("did_yapp_syntax_inits")
  hi def link yappModule	Include
  hi def link yappInfix		Function
  hi def link yappOp		Function
"  hi def link yappDirective    Constant
  hi def link yappDirective	Error
  hi def link yappKeyword	Keyword
  hi def link yappString	String
  hi def link yappComment	Comment
endif

