" write.vim: Get your author on.
"
" Author:       Nate Soares <http://so8r.es>
" Version:      1.0
" License:      The same as vim itself. (See |license|)
" GetLatestVimScripts: 4249 1 :AutoInstall: write.zip

if exists("g:loaded_write") || &cp || v:version < 700
	finish
endif
let g:loaded_write = 1

let g:write_writing = 0

" Sets the buffer as writer-friendly.
function! write#On()
	let g:write_writing=1
	setlocal wrap linebreak nolist
	setlocal display+=lastline
	noremap  <buffer> <silent> k gk
	noremap  <buffer> <silent> j gj
	setlocal spell nornu nonu
endfunction
command! WriteOn call write#On()

" Unsets the buffer as writer-friendly.
" Will only undo changes that write.vim made.
function! write#Off()
	let g:write_writing=0
	setlocal wrap< linebreak< nolist< display<
	silent! unmap <buffer> k
	silent! unmap <buffer> j
	setlocal spell< rnu< nu<
endfunction
command! WriteOff call write#Off()

" Toggles write mode.
function! write#Toggle()
	if g:write_writing
		call write#Off()
	else
		call write#On()
	endif
endfunction
command! Write call write#Toggle()
