if(has("win32") || has("win95") || has("win64") || has("win16"))
	set shell=C:\windows\system32\cmd.exe
    let g:iswindows = 1
else
	let g:iswindows=0
endif

if(g:iswindows)
	let $vimpath = "C:/MyProgramFiles/Vim/"
	let $vimrcpath = $vimpath."vimfiles/.vimrc"
    let $PATH_OLD = $PATH
    let $PATH = $PATH_OLD.";".$vimpath."vimfiles/exec/"
else
	let $vimpath = "~/"
	let $vimrcpath = $vimpath.".vim/.vimrc"
endif

source $vimrcpath


