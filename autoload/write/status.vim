function! write#status#flag()
	return write#status#info()
endfunction


function! write#status#info()
	return b:writing ? '[W]' : ''
endfunction
