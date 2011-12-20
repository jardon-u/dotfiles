" Automatically handle headers:
"   Create new headers using predifined templates.
"   Update date existing headers.
"
" Maintainer:	SnP^ <gosu.snp@gmail.com>
" Last Change:	2008-05-03 10:30:17
" Version:	1

" define autocmds
autocmd BufNewFile  *.c{,c,++,pp,xx}	call AutoHeaderInsert('C')
autocmd BufNewFile  *.h{,h,++,pp,xx}	call AutoHeaderInsert('H')
autocmd BufNewFile  *.rb		call AutoHeaderInsert('Ruby')
autocmd BufNewFile  *.sh		call AutoHeaderInsert('Shell')
autocmd BufWritePre *			call AutoHeaderUpdate()

" Insert headers upon file creation
function AutoHeaderInsert(ftype)
  let i = confirm('Insert header?', "&No\n&Yes")
  if i != 1
    echo 'Select the header to insert:'
    let hlist = []
    call add(hlist, '')
    call add(hlist, '1. Vaucanson')

    let i = inputlist(hlist)
    if i > 0
      if i == 1
	0r ~/.vim/skel/headers/vcsn.tpl
	$d
      end
      if a:ftype == 'C' || a:ftype == 'H'
	if a:ftype == 'H'
	  call append(line('$'), '#ifndef @CGUARD@')
	  call append(line('$'), '# define @CGUARD@')
	  call append(line('$'), '#endif // ! @CGUARD@')
	end
	call AutoHeaderReplace('//', '//', '//')
      elseif a:ftype == 'Ruby' || a:ftype == 'Shell'
	let shebang = {}
	let shebang['Ruby'] = '#! /usr/bin/ruby'
	let shebang['Shell'] = '#! /bin/sh'
	if has_key(shebang, a:ftype)
	  call append(0, shebang[a:ftype])
	end
	call AutoHeaderReplace('##', '##', '##')
      end
    end
  end
endfun

" Automatically update header based on pattern recognition.
" It recognizes the following patterns:
"   - `" Last Change:'
"   - `.. Copyright (C)'
function AutoHeaderUpdate()
  let curline = line(".")
  let curcol = col(".")
  call cursor(1,1)

"   - `" Last Change:'
  let n = search('^"\s*Last\s*Change:\s*')
  if n
    execute n . 's/^\("\s*Last\s*Change:\s*\).*/\1' . strftime('%Y-%m-%d %H:%M:%S', localtime()) . '/'
  end

"   - `(//|#|*) Copyright (C)'
  let n = search('^\(//\+\|#\+\|\**\)\s*Copyright\s*(C)')
  if n
    let line = getline('.')
    let year = strftime('%Y', localtime())
    if ! search(year, '', n)
      execute n . 's/^\(.*Copyright\s*(C)\s*\(,\?\s*[0-9]\{4}\)\+\)/\1, ' . year . '/'
    end
  end

  call cursor(curline, curcol)
endfun

" Template tag replacement
function AutoHeaderReplace(cs, cm, ce)
  execute '% s,@CS@,' . a:cs . ',ge'
  execute '% s,@CM@,' . a:cm . ',ge'
  execute '% s,@CE@,' . a:ce . ',ge'
  execute '% s,@DATE-STAMP@,' . strftime('%Y-%m-%d %H:%M:%S', localtime()) . ',ge'
  execute '% s,@DATE-YEAR@,' . strftime('%Y') . ',ge'
  execute '% s,@FILE-NAME@,' . expand('%:t') . ',ge'
  let dir = finddir('include', '.;')
  if dir != ''
    let guard = substitute(substitute(toupper(expand('%:p')), '\(\.\|/\)', '_', 'g'), '^\(.*INCLUDE_\)', '', 'g')
    execute '% s,@CGUARD@,' . guard . ',ge'
  else
    execute '% s,@CGUARD@,@LARGE-FILE-NAME@,ge'
  end
  execute '% s,@LARGE-FILE-NAME@,' . substitute(toupper(expand('%:t')), '\.', '_', 'g') . ',ge'
endfun
