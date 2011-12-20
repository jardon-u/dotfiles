" C/C++ code completion.
" Maintainer:	SnP^ <gosu.snp@gmail.com>
" Last Change:	2008-03-19 00:25:14

" Complete current line
function CTComp()
  let s:line = getline('.')

  let s:indent = substitute(s:line, '^\(\s*\)\(.*\)$', '\1', '')
  let s:type = substitute(s:line, '^\s*\(\w*\)\s*\w*.*$', '\1', '')
  let s:name = substitute(s:line, '^\s*\w*\s*\(\w*\).*$', '\1', '')

  " Checking if current line is one of the following
  " class, enum, namespace, struct, union
  if s:type =~ '\(class\|enum\|namespace\|struct\|union\)'
    let s:tpl = [ s:indent . '{' ]
    " in case of a class, add:
    "   public and private field
    "   default constructor and destructor
    if s:type =~ 'class'
      let s:tpl += [ s:indent . '  public:' ]
      let s:tpl += [ s:indent . '    ' . s:name . '();' ]
      let s:tpl += [ s:indent . '    ~' . s:name . '();' ]
      let s:tpl += [ '' ]
      let s:tpl += [ s:indent . '  private:' ]
      let s:tpl += [ '' ]
    else
      let s:tpl += [ s:indent . '  ' ]
    endif
    if s:type =~ 'namespace'
      let s:tpl += [ s:indent . '} // End of ' . s:type . ' ' . s:name ]
    else
      let s:tpl += [ s:indent . '}; // End of ' . s:type . ' ' . s:name ]
    endif
    let s:tpl += [ '' ]
    call append(line('.'), s:tpl)
  endif
endfunction

" bind CTComp on Ctrl + C
map <unique> <C-C> <ESC>mc:exec CTComp()<CR>`c<DOWN>zO<DOWN>$
imap <unique> <C-C> <ESC><LEFT> mc:exec CTComp()<CR>`c<DOWN>zO<DOWN>A

