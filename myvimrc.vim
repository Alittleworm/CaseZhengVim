scriptencoding utf-8
" ============================================================================
" 基础配置
" no vi-compatible 不要使用vi的键盘模式，而是vim自己的
set nocompatible

set encoding=utf-8          "Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等。
set termencoding=utf-8      "Vim 所工作的终端 (或者 Windows 的 Console 窗口) 的字符编码方式。这个选项在 Windows 下对我们常用的 GUI 模式的 gVim 无效，而对 Console 模式的 Vim 而言就是 Windows 控制台的代码页，并且通常我们不需要改变它。
set fileencoding=utf-8      "Vim 中当前编辑的文件的字符编码方式，Vim 保存文件时也会将文件保存为这种字符编码方式 (不管是否新文件都如此)。
set fileencodings=utf-8,chinese,cp936   " Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。因此最好将 Unicode 编码方式放到这个列表的最前面，将拉丁语系编码方式 latin1 放到最后面。
set fileformats=unix,dos        "处理文件格式问题,将UNIX文件格式做为第一选择，而将MS-DOS的文件格式做为第二选择
source $VIMRUNTIME/delmenu.vim  "vim的菜单乱码解决
source $VIMRUNTIME/menu.vim     "vim的菜单乱码解决
language messages zh_CN.utf-8   "vim提示信息乱码的解决
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
" 侦测文件类型
filetype on
" allow plugins by file type (required for plugins!)
" 载入文件类型插件
filetype plugin on          
" 为特定文件类型载入相关缩进文件
filetype indent on

" tabs and spaces handling
set expandtab
" 设置制表符(tab键)的宽度
set tabstop=4
" 设置软制表符的宽度
set softtabstop=4
" (自动) 缩进使用的4个空格
set shiftwidth=4            

" highlight cursor line and column 开启光亮光标行 开启高亮光标列
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=163 guibg=darkred guifg=white
set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=163 guibg=darkred guifg=white

set novisualbell    " 不要闪烁(不明白)

if(g:iswindows)
    set guioptions -=T  "隐藏工具栏
    " 字体设置
    set guifont=Consolas:h10
    " 打开后默认全屏
    if has('win32')    
        au GUIEnter * simalt ~x
    else    
        au GUIEnter * call MaximizeWindow()
    endif 

    function! MaximizeWindow()    
        silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endfunction
endif

" hidden startup messages 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" auto read and write
" 自动把内容写回文件: 如果文件被修改过，在每个 :next、 :rewind、:last、:first、:previous、:stop、:suspend、
" :tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 
" 命令转到别的文件时亦然。
set autowrite
" 设置当文件被改动时自动载入
set autoread
" when deal with unsaved files ask what to do在处理未保存或只读文件的时候，弹出确认 
set confirm                 " 
" no backup files 从不备份
set nobackup
" other settings 
set langmenu=zh_CN.UTF-8
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 缺省情况下，h和l命令不会把光标移出当前行。如果已经到了行首，无论按多少次h键，光标始
" 终停留在行首，l命令也类似。如果希望h和l命令可以移出当前行，更改‘whichwrap’选项的设置
"set whichwrap+=<,>,h,l,[,]

" 去掉输入错误的提示声音
set noeb
" 修改Lender为','默认为'\'
let g:mapleader = ","

" 一行显示不下换行显示，但不插入换行
set wrap
" 禁止生成交换文件
set noswapfile
" 共享剪贴板
set clipboard+=unnamed

" 历史记录条数
set history=20

"set gfw=幼圆:h10:cGB2312

" 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口
" 有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
set ruler

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距
set scrolloff=3

" 用浅色高亮当前行  
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul

" make backspace work like most other apps 设置退格键可用
set backspace=2
set backspace=indent,eol,start

" auto open or close NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" always show status bar
" 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候
" 显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set laststatus=2            

" incremental search 输入字符串就显示匹配点
set incsearch
" highlighted search results
set hlsearch
" search ignore case 搜索模式里忽略大小写
"set ignorecase
" muting search highlighting 
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" syntax highlight on
"syntax on                   " 语法高亮


if version > 580  
    hi clear  
    if exists("syntax_on")  
        syntax reset  
    endif  
endif 

" show line numbers
set nu                      " 显示行号
set rnu                     " 显示别的行距当前行的行数

"打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
autocmd FileType lua nmap <F5> :w !lua<cr><cr>

" 设置匹配模式，显示匹配的括号
set showmatch
" 允许折叠  
set foldenable
"折叠方式
"manual           手工定义折叠
"indent             更多的缩进表示更高级别的折叠
"expr                用表达式来定义折叠
"syntax             用语法高亮来定义折叠
"diff                  对没有更改的文本进行折叠
"marker            对文中的标志折叠
set foldmethod=indent
"设置折叠级别 0是最高级 数值越大折叠级别越低 这样不会每次打开都折叠了
set foldlevel=9999

" 命令行设置
" 命令行显示输入的命令
set showcmd
" 命令行显示vim当前模
set showmode


" 设置背景颜色
set background=dark
syntax enable
"colorscheme solarized
"colorscheme wombat
"colorscheme molokai
"colorscheme delek
colorscheme lucius

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

set t_Co=256  

" 取消高亮
nmap <leader>nh :nohl<CR>

if(g:iswindows==0)
    "用来改变终端下光标颜色
    let color_normal = 'HotPink'
    let color_insert = 'RoyalBlue1'
    let color_exit = 'green'
    if &term =~ 'xterm\|rxvt'
        exe 'silent !echo -ne "\e]12;"' . shellescape(color_normal, 1) . '"\007"'
        let &t_SI="\e]12;" . color_insert . "\007"
        let &t_EI="\e]12;" . color_normal . "\007"
        exe 'autocmd VimLeave * :!echo -ne "\e]12;"' . shellescape(color_exit, 1) . '"\007"'
    elseif &term =~ "screen"
        if !exists('$SUDO_UID')
            if exists('$TMUX')
                exe 'silent !echo -ne "\033Ptmux;\033\e]12;"' . shellescape(color_normal, 1) . '"\007\033\\"'
                let &t_SI="\033Ptmux;\033\e]12;" . color_insert . "\007\033\\"
                let &t_EI="\033Ptmux;\033\e]12;" . color_normal . "\007\033\\"
                exe 'autocmd VimLeave * :!echo -ne "\033Ptmux;\033\e]12;"' . shellescape(color_exit, 1) . '"\007\033\\"'
            else
                exe 'silent !echo -ne "\033P\e]12;"' . shellescape(color_normal, 1) . '"\007\033\\"'
                let &t_SI="\033P\e]12;" . color_insert . "\007\033\\"
                let &t_EI="\033P\e]12;" . color_normal . "\007\033\\"
                exe 'autocmd VimLeave * :!echo -ne "\033P\e]12;"' . shellescape(color_exit, 1) . '"\007\033\\"'
            endif
        endif
    endif
    unlet color_normal
    unlet color_insert
    unlet color_exit
endif

source ~/.vim/vundle_conf.vim
