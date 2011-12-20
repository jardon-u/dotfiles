" Filename:    outline.vim
" Purpose:     Vim syntax file
" Language:    outline: emacs TODO lists
" Maintainer:  Thierry Vignaud tvignaud@mandrakesoft.com
" URL:         <none>
" Last Change: 2008-03-19 00:15:04

" For version 6.x: Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

"syn sync minlines=1000

"syn region EmacsMode oneline matchgroup=Comment start='-\*-\soutline\s-\*-' end='$'
"syn region FirstLevel oneline matchgroup=Function start='^\*[^*]' end='$'
"syn region SecondLevel oneline matchgroup=Structure start='^\*\*[^*]' end='$'
"syn region ThirdLevel oneline matchgroup=Statement start='^\*\*\*[^*]' end='$'
"syn region OtherLevels oneline matchgroup=Type start='^\*\{4,\}[^*]' end='$'

syn match Comment '-\*-\soutline\s-\*-'			" Mode
syn match Function '^\*[^*].*$'				" FirstLevel
syn match Structure '^\*\*[^*].*$'			" SecondLevel
syn match Statement '^\*\*\*[^*].*$'			" ThirdLevel
syn match Type '^\*\{4,\}[^*].*$'			" OtherLevels

syn match String '\s_[^_\s]\+_\s'			" underline
syn match Keyword '\s\*[^\*\s]\+\*\s'			" bold font

let b:current_syntax = "outline"

" vim: ts=8

