if(has("win32") || has("win95") || has("win64") || has("win16"))
	set shell=C:\windows\system32\cmd.exe
	let g:iswindows = 1
else
	let g:iswindows=0
endif

if(g:iswindows)
	let $vimpath = "~/.vim/"
	let $vimrcpath = $vimpath."myvimrc.vim"
	let $PATH_OLD = $PATH
	let $HOMEPATH = "C:/Users/CaseZheng/"
	let $PATH = $PATH_OLD.";".$HOMEPATH.".vim/exec/"
else
	let $vimpath = "~/"
	let $vimrcpath = $vimpath.".vim/myvimrc.vim"
endif

source $vimrcpath


