" Header doxygen for ViM
" Maintainer:	SnP^ <ma_j@epita.fr>
" Last Change:	2006 Nov 11

" Format a list a param separated by commas for printing
function! DoxyHeadersParm(parms)
  let s:parms = substitute(a:parms, '\({\|}\)', '', "g")
  return "** \\param\t" . substitute(s:parms, '\,', ',** \\param' . "\t", "g")
endfunction

function! DoxyFileHeaders()
  " Finding where to place the header
  call cursor(1, 1)
  let s:line = getline(".")
  if s:line =~ '^/*'
    let s:line = search('*/')
    call cursor(line(".") + 1, 1)
  endif
  " Insert the header
  call append(line('.') - 1, '/*!')
  call append(line('.') - 1, "** \\file\t" . expand('%:p:t'))
  call append(line('.') - 1, "** \\author\t" . $LOGINEPITA)
  call append(line('.') - 1, "**")
  call append(line('.') - 1, "** \\brief\t")
  call append(line('.') - 1, '*/')
endfunction

function! DoxyHeadersEnum()
  " get struct name
  let s:fname = getline(".")
  let s:fname = substitute(s:fname, '^.*enum\(\s\+\(.\+\)\)*$', '\2', "")
  " get param list
  let s:fparmbegin = search("{") + 1
  let s:line = getline(".")
  let s:fparmend = search("}") - 1
  let i = s:fparmbegin
  let s:fparm1 = substitute(getline(i), '^\(\s\+\)\(.\+\)$', '\2', "")
  let s:fparm = substitute(s:fparm1, '\(.\+\)\s*=\s*.\+', '\1', '')
  let i = i + 1
  while i <= s:fparmend
    let s:fparm1 = substitute(getline(i), '^\(\s\+\)\(.\+\)$', '\2', "")
    let s:fparm = substitute(s:fparm1, '\(.\+\)\s*=\s*.\+', '\1', '') . ',' . s:fparm
    let i = i + 1
  endwhile
  let s:fparm = substitute(s:fparm, '\,\,', ',', "g")
  let s:fparm = substitute(s:fparm, ' ', '', "g")
  " printing
  let s:pos = line('.') - (s:fparmend - s:fparmbegin) - 3
  call cursor(s:pos, 1)
  call append(line('.') - 1, '/*!')
  call append(line('.') - 1, "** \\author\t" . $LOGINEPITA)
  if s:fname =~ '^.\+$'
    call append(line('.') - 1, "** \\enum\t" . s:fname)
  endif
  call append(line('.') - 1, "** \\brief\t")
  call append(line('.') - 1, "**")
  " printing params
  if s:fparm =~ '^.\+$'
    let s:fparm = DoxyHeadersParm(s:fparm)
    while s:fparm =~ ','
      let s:fparmp = substitute(s:fparm, '^\(.\+\),\(.\+\)$', '\2', "")
      call append(line('.') - 1, s:fparmp)
      let s:fparm = substitute(s:fparm, '^\(.\+\),\(.\+\)$', '\1', "")
    endwhile
    call append(line('.') - 1, s:fparm)
  endif
  call append(line('.') - 1, '*/')
endfunction

function! DoxyHeadersFunc()
  " get linetype
  let s:ftype = getline(".")
  let s:ftype = substitute(s:ftype, '\s\s*', ' ', "g")
  let s:fname = substitute(s:ftype, '^\(.*\)\s\(.*\)(.*$', '\2', "")
  let s:ftype = substitute(s:ftype, '^\(static \)*\(.*\)\s\(.*\)(.*$', '\2', "")
  " get param list
  let s:fparmbegin = line(".")
  let s:line = getline(".")
  if s:line =~ '(\(void\|\s*\))'
    let s:fparmend = s:fparmbegin
    let s:fparm = ''
  else
    let s:fparmend = search(")")
    let i = s:fparmbegin
    let s:fparm = substitute(getline(i), '^\(.\+(\|\s\+\)\(.\+\)\s\+\**\(.\+\)\(,\|)\;*\)$', '\3', "")
    let i = i + 1
    while i <= s:fparmend
      let s:fparm = substitute(getline(i), '^\(.\+(\|\s\+\)\(.\+\)\s\+\**\(.\+\)\(,\|)\;*\)$', '\3', "") . ',' . s:fparm
      let i = i + 1
    endwhile
  endif
  " printing
  let s:pos = line('.') - (s:fparmend - s:fparmbegin)
  call cursor(s:pos, 1)
  call append(line('.') - 1, '/*!')
  call append(line('.') - 1, "** \\author\t" . $LOGINEPITA)
  call append(line('.') - 1, "** \\brief\t")
  call append(line('.') - 1, "**")
    " printing params
  if s:fparm =~ '^.\+$'
    let s:fparm = DoxyHeadersParm(s:fparm)
    while s:fparm =~ ','
      let s:fparmp = substitute(s:fparm, '^\(.\+\),\(.\+\)$', '\2', "")
      call append(line('.') - 1, s:fparmp)
      let s:fparm = substitute(s:fparm, '^\(.\+\),\(.\+\)$', '\1', "")
    endwhile
    call append(line('.') - 1, s:fparm)
    call append(line('.') - 1, "**")
  endif
  call append(line('.') - 1, "** \\retval\t" . s:ftype)
  call append(line('.') - 1, '*/')
endfunction

function! DoxyHeadersStruct()
  " get struct name
  let s:fname = getline(".")
  let s:fname = substitute(s:fname, '^.*struct\(\s\+\(.\+\)\)*$', '\2', "")
  " get param list
  let s:fparmbegin = search("{") + 1
  let s:line = getline(".")
  let s:fparmend = search("}") - 1
  let i = s:fparmbegin
  let s:fparm = substitute(getline(i), '^\(.\+(\|\s\+\)\(.\+\)\s\+\**\(.\+\)\()*\;\)$', '\3', "")
  let i = i + 1
  while i <= s:fparmend
    let s:fparm = substitute(getline(i), '^\(.\+(\|\s\+\)\(.\+\)\s\+\**\(.\+\)\()*\;\)$', '\3', "") . ',' . s:fparm
    let i = i + 1
  endwhile
  " printing
  let s:pos = line('.') - (s:fparmend - s:fparmbegin) - 3
  call cursor(s:pos, 1)
  call append(line('.') - 1, '/*!')
  call append(line('.') - 1, "** \\author\t" . $LOGINEPITA)
  if s:fname =~ '^.\+$'
    call append(line('.') - 1, "** \\struct\t" . s:fname)
  endif
  call append(line('.') - 1, "** \\brief\t")
  call append(line('.') - 1, "**")
    " printing params
  if s:fparm =~ '^.\+$'
    let s:fparm = DoxyHeadersParm(s:fparm)
    while s:fparm =~ ','
      let s:fparmp = substitute(s:fparm, '^\(.\+\),\(.\+\)$', '\2', "")
      call append(line('.') - 1, s:fparmp)
      let s:fparm = substitute(s:fparm, '^\(.\+\),\(.\+\)$', '\1', "")
    endwhile
    call append(line('.') - 1, s:fparm)
  endif
  call append(line('.') - 1, '*/')
endfunction

function! DoxyHeaders()
  let s:line = getline(".")
  if s:line =~ '^.\+\s\+.\+(.\+'
    exec DoxyHeadersFunc()
  elseif s:line =~ '^\(.\+\s\)*enum.*'
    exec DoxyHeadersEnum()
  elseif s:line =~ '^\(.\+\s\)*struct.*'
    exec DoxyHeadersStruct()
  endif
endfunction

" mapping
" Insertion of file headers on \h
map <unique> <Leader>h :exec DoxyFileHeaders()<CR>:exec search("brief")<CR>:call cursor(line("."), 13)<CR>a
" Insertion of headers on \f
map <unique> <Leader>f mc:exec DoxyHeaders()<CR>`c?brief<CR>:call cursor(line("."), 13)<CR>a

