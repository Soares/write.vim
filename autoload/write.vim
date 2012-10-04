if exists("g:write#autoloaded") || &cp || v:version < 700
	finish
endif
let g:write#autoloaded = 1


" Sets the buffer as writer-friendly.
function! write#On()
	let b:writing=1
	setlocal spell wrap linebreak display+=lastline nonu nornu nolist
	noremap  <buffer> <silent> k gk
	noremap  <buffer> <silent> j gj
endfunction


" Unsets the buffer as writer-friendly.
" Will only undo changes that write.vim made.
function! write#Off()
	let b:writing=0
	setlocal spell< wrap< linebreak< display< nu< rnu< list<
	silent! unmap <buffer> k
	silent! unmap <buffer> j
endfunction


" Toggles write mode.
function! write#Toggle()
	if exists('b:writing') && b:writing > 0
		call write#Off()
	else
		call write#On()
	endif
endfunction


" Checks if write mode is on.
" Returns:
"   Nonzero if and only if write mode is on.
function! write#Writing()
	return b:writing
endfunction
