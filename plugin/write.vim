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

command! WriteOn call write#On()
command! WriteOff call write#Off()
command! Write call write#Toggle()
