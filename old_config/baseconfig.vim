""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8          "Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等。
set termencoding=utf-8      "Vim 所工作的终端 (或者 Windows 的 Console 窗口) 的字符编码方式。这个选项在 Windows 下对我们常用的 GUI 模式的 gVim 无效，而对 Console 模式的 Vim 而言就是 Windows 控制台的代码页，并且通常我们不需要改变它。
set fileencoding=utf-8      "Vim 中当前编辑的文件的字符编码方式，Vim 保存文件时也会将文件保存为这种字符编码方式 (不管是否新文件都如此)。
set fileencodings=utf-8,chinese,cp936	" Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。因此最好将 Unicode 编码方式放到这个列表的最前面，将拉丁语系编码方式 latin1 放到最后面。
set fileformats=unix,dos		"处理文件格式问题,将UNIX文件格式做为第一选择，而将MS-DOS的文件格式做为第二选择
source $VIMRUNTIME/delmenu.vim  "vim的菜单乱码解决
source $VIMRUNTIME/menu.vim     "vim的菜单乱码解决
language messages zh_CN.utf-8   "vim提示信息乱码的解决

syntax on			" 语法高亮
set autowrite       " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoindent      " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent    " 智能对齐方式
set tabstop=4       " 设置制表符(tab键)的宽度
set softtabstop=4   " 设置软制表符的宽度
set shiftwidth=4    " (自动) 缩进使用的4个空格
set backspace=2     " 设置退格键可用
set showmatch       " 设置匹配模式，显示匹配的括号
set linebreak       " 整词换行
set wrap			"一行显示不下换行显示，但不插入换行符
set number          " 显示行号
set guioptions -=T  " 隐藏工具栏
"set guioptions -=m  " 隐藏菜单栏
"set previewwindow  " 标识预览窗口
set history=50      " 历史记录50条
"--状态行设置--
set laststatus=2    " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler           " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
"set ignorecase     " 搜索模式里忽略大小写
"set smartcase      " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
"--命令行设置--
set showcmd         " 命令行显示输入的命令
set showmode        " 命令行显示vim当前模式

set incsearch		" 输入字符串就显示匹配点
set hlsearch

autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set novisualbell    " 不要闪烁(不明白)
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
" 显示中文帮助
set helplang=cn
" 设置配色方案
set background=dark				"设置背景颜色
colorscheme lucius
"colorscheme ron
"colorscheme solarized
"colorscheme desert
"colorscheme monokai

" 字体
set guifont=Consolas:h10
set autoread                    " 设置当文件被改动时自动载入
set clipboard+=unnamed          "共享剪贴板  
set noundofile                  
set nobackup                    "从不备份
set noswapfile		            "禁止生成交换文件
set nocompatible                "不要使用vi的键盘模式，而是vim自己的
let python_highlight_all=1      " 显示python高亮
set noeb                        " 去掉输入错误的提示声音
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set cmdheight=2                 " 命令行（在状态行下）的高度，默认为1，这里是2
filetype on                     " 侦测文件类型
filetype plugin on              " 载入文件类型插件
filetype indent on              " 为特定文件类型载入相关缩进文件
set viminfo+=!                  " 保存全局变量
"set iskeyword+=_,$,@,%,#,-      " 带有符号的单词不要被换行分割
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白，便于阅读
set matchtime=1                         " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3                         " 光标移动到buffer的顶部和底部时保持3行距离
"打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>     " quickfix模式
autocmd FileType lua nmap <F5> :w !lua<cr><cr>
