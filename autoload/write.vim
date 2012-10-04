if exists("g:write#autoloaded") || &cp || v:version < 700
	finish
endif
let g:write#autoloaded = 1


" Sets the buffer as writer-friendly.
" Args:
"  {string} bang Whether or not to force full writing mode.
function! write#On(bang)
	setlocal spell wrap display+=lastline nolist linebreak
	if a:bang != '' || &tw == 0
		setlocal tw=0 nonu nornu
		let b:writing=2
	else
		let b:writing=1
	endif
	noremap  <buffer> <silent> k gk
	noremap  <buffer> <silent> j gj
endfunction


" Unsets the buffer as writer-friendly.
" Will only undo changes that write.vim made.
function! write#Off()
	if b:writing == 2
		setlocal tw< nonu< nornu<
	endif
	setlocal spell< wrap< display< list< linebreak<
	let b:writing=0
	silent! unmap <buffer> k
	silent! unmap <buffer> j
endfunction


" Toggles write mode.
" Args:
"   {string} bang Whether or not to force full writing mode.
function! write#Toggle(bang)
	if exists('b:writing') && b:writing > 0
		call write#Off()
	else
		call write#On(bang)
	endif
endfunction


" Toggles writing mode only if writing has never been set for this buffer
" Args:
"   {string} bang Whether or not to force full writing mode.
function! write#Reenter(bang)
	if !exists('b:writing')
		call write#On(a:bang)
	endif
endfunction


" Checks if write mode is on.
" Returns:
"   Nonzero if and only if write mode is on.
function! write#Writing()
	return b:writing
endfunction
