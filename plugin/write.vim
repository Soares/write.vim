" write.vim: Get your author on.
" Author:       Nate Soares <http://so8r.es>
" Version:      1.0
" License:      The same as vim itself. (See |license|)
" GetLatestVimScripts: 4249 1 :AutoInstall: write.zip
if exists('g:loaded_write') || &cp || v:version < 700
	finish
endif
let g:loaded_write = 1


if !exists('g:write_auto')
	let g:write_auto = []
endif


command! -bang WriteOn call write#start('<bang>')
command! WriteOff call write#stop()
command! -bang Write call write#toggle('<bang>')


if len(g:write_auto) > 0
	augroup write
		autocmd!
		for s:ft in g:write_auto
			let s:bang = s:ft =~# '!$' ? "'!'" : "''"
			let s:ft = substitute(s:ft, '!$', '', '')
			exe 'autocmd FileType '.s:ft.' call write#restart('.s:bang.')'
		endfor
	augroup end
endif
