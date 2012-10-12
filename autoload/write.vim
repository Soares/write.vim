if exists("g:write#autoloaded") || &cp || v:version < 700
	finish
endif
let g:write#autoloaded = 1


" Sets the buffer as writer-friendly.
" @param {string} bang Whether or not to force full writing mode.
function! write#start(bang)
	setlocal spell wrap display+=lastline nolist linebreak
	if !empty(a:bang) || &tw == 0
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
function! write#stop()
	if b:writing == 2
		if &tw == 0
			setlocal tw<
		endif
		setlocal nonu< nornu<
	endif
	setlocal spell< wrap< display< list< linebreak<
	let b:writing=0
	silent! unmap <buffer> k
	silent! unmap <buffer> j
endfunction


" Toggles write mode.
" @param {string} bang Whether or not to force full writing mode.
function! write#toggle(bang)
	if exists('b:writing') && b:writing > 0
		call write#stop()
	else
		call write#start(bang)
	endif
endfunction


" Toggles writing mode only if writing has never been set for this buffer
" @param {string} bang Whether or not to force full writing mode.
function! write#restart(bang)
	if exists('b:write_ft') && b:write_ft == &ft
		return
	endif
	if exists('b:writing') && b:writing
		call write#stop()
	endif
	call write#start(a:bang)
	let b:write_ft = &ft
endfunction


" Makes a statusline flag if writin mode is on.
" @return {string}
function! write#statusline()
	return b:writing ? '[W]' : ''
endfunction
