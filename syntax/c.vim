" Vim syntax file
" Language:	C Additions
" Maintainer:	Mikhail Wolfson <mywolfson@gmail.com>
" URL: http://web.mit.edu/wolfsonm
" Last Change:	2010 Dec. 3
" Version: 0.4
"
" Changelog:
"   0.4 - updates and fixes to cDelimiter to fix break with foldmethod=syntax,
"         entirely suggested and solved by Ivan Freitas
"         <ivansichfreitas@gmail.com>
"   0.3 - updates and fixes to cUserFunctionPointer, thanks to 
"         Alexei <lxmzhv@gmail.com>
"   0.2 - change [] to operator
"   0.1 - initial upload, modification from vimscript#1201, Extended c.vim


" Common ANSI-standard functions

" Operators
syn match cOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match cOperator	"[.!~*&%<>^|=,+-]"
syn match cOperator	"/[^/*=]"me=e-1
syn match cOperator	"/$"
syn match cOperator "&&\|||"
"syn match cOperator	"[][]"

" Functions
syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
syn match cUserFunctionPointer "(\s*\*\s*\h\w*\s*)\(\s\|\n\)*(" contains=cDelimiter,cOperator
syn match cMacro "\<\(_\|\u\)\+\(\u\|\d\|_\)*\>"

hi def link cUserFunction cFunction
hi def link cUserFunctionPointer cFunction

" Delimiters
" foldmethod=syntax fix, courtesy of Ivan Freitas
syn match cBraces display "[{}]"

" Links
hi def link cFunction Function
" foldmethod=syntax fix, courtesy of Ivan Freitas
hi def link cBraces Delimiter
hi def link cMacro  Macro

