" ============================================================================
" Vundle initialization
" Setting up Vundle - the best vim plugin manager  如果Vundle不存在则clone一个
let iCanHazVundle=1
if(g:iswindows)
	let vundle_readme=expand('$vimpath/bundle/Vundle/README.md')
else
	let vundle_readme=$vimpath.'.vim/bundle/Vundle/README.md'
endif

if(g:iswindows==0 && !filereadable(vundle_readme)==0)
    echo !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p  ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle
    let iCanHazVundle=0
endif

" 侦测文件类型 关闭
filetype off


set rtp+=~/.vim/bundle/Vundle/ 

call vundle#rc()

" let Vundle manage Plugins
Plugin 'gmarik/Vundle'

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" Plugins from github repos:

" Better file browser
Plugin 'scrooloose/nerdtree'

" Code commenter 快速注释/解开注释
Plugin 'scrooloose/nerdcommenter'

" 注释快速生成
Plugin 'DoxygenToolkit.vim'

" Class/module browser
Plugin 'majutsushi/tagbar'

" Code and files fuzzy finder 模糊搜索, 可以搜索文件/buffer/mru/tag等等
Plugin 'kien/ctrlp.vim'

" Extension to ctrlp, for fuzzy command finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'

" Maybe the best Git integration 处理 git merge 文件冲突
Plugin 'tpope/vim-fugitive'

" Tab list panel   Tab管理
Plugin 'kien/tabman.vim'

" Airline 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if(g:iswindows)
    Plugin 'eugeii/consolas-powerline-vim'
endif

" Pending tasks list
"Plugin 'fisadev/FixedTaskList.vim'

"让cpp文件在.h和.cpp文件中切换
Bundle 'vim-scripts/a.vim'

" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
"Plugin 'klen/python-mode'

"if(g:iswindows==1)
"    " Better autocompletion
"    Plugin 'Shougo/neocomplcache.vim'
"endif

if(g:iswindows==0)
    Bundle 'Valloric/YouCompleteMe'
endif

" Snippets manager (SnipMate), dependencies, and snippets repo
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
" 同时支持Git 和 Svn ，速度也是相当不错的，高亮当前修改.　比较全面的一个插件
Plugin 'mhinz/vim-signify'
" Automatically sort python imports
"Plugin 'fisadev/vim-isort'
" Window chooser 窗口管理器
Plugin 't9md/vim-choosewin'

"onmicppcompete功能：
"命名空间(namespace),类(class),结构(struct)和联合(union)补全
"函数属性成员和返回值类型补全
"this"指针成员补全
"C/C++类型转换(cast)对象补全
"类型定义(typedef)和匿名类型(anonymous types)补全
Bundle 'omnicppcomplete'

"if(g:iswindows)
"    "Python and other languages code checker 语法检测
"    Plugin 'scrooloose/syntastic'
"endif

" Golang Plugins
Plugin 'fatih/vim-go'
" 代码对齐插件
Plugin 'godlygeek/tabular'
" markdown语法高亮
Plugin 'plasticboy/vim-markdown'

" Search results counter
Plugin 'IndexedSearch'

" Lua代码高亮补全
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'

" 多窗口插件 airline有这个功能  屏蔽啦
"Plugin 'minibufexplorerpp'

" Grep
"Plugin 'yegappan/grep'

"Plugin 'WolfgangMehner/lua-support'

" Gvim colorscheme
Plugin 'Wombat'

" awesome colorscheme
Plugin 'tomasr/molokai'

" solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" 显示终端的各种颜色对应的编号
"Plugin 'guns/xterm-color-table.vim'

" ============================================================================
" Install plugins the first time vim runs  在安装Vundle后只运行一次

if (iCanHazVundle==0)
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" tab navigation mappings
" 后一个
map tn :tabn<CR>
" 前一个
map tp :tabp<CR>
map tm :tabm
" 关闭当前tab
map tc :tabc<CR>
" 关闭其它所有的tab
map to :tabo<CR>
" 建立对指定文件新的tab
map tt :tabnew
" 查看所有打开的tab
map ts :tabs
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview
set completeopt=menuone,menu,longest 

" save as sudo
ca w!! w !sudo tee "%"

" simple recursive grep
" both recursive grep commands with internal or external (fast) grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" mappings to call them
" 全文查找
"nmap ,R :RecurGrep 
" 快速查找
"nmap ,r :RecurGrepFast 
" mappings to call them with the default word as search text
"nmap ,wR :RecurGrep <cword><CR>
"nmap ,wr :RecurGrepFast <cword><CR>

" use 256 colors when possible
" if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
" 	let &t_Co = 256
"     colorscheme molokai
" else
"     colorscheme delek
" endif

" colors for gvim
" if has('gui_running')
"     colorscheme wombat
" endif

" autocompletion of files and commands behaves like zsh
" (autocomplete menu)
set wildmenu
set wildmode=full

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" nerdcommenter ----------------------
"1、 \cc 注释当前行和选中行  
"2、 \cn 没有发现和\cc有区别  
"3、 \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作  
"4、 \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释  
"5、 \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释  
"6、 \cs 添加性感的注释，代码开头介绍部分通常使用该注释  
"7、 \cy 添加注释，并复制被添加注释的部分  
"8、 \c$ 注释当前光标到改行结尾的内容  
"9、 \cA 跳转到该行结尾添加注释，并进入编辑模式  
"10、\ca 转换注释的方式，比如： /**/和//  
"11、\cl \cb 左对齐和左右对其，左右对其主要针对/**/  
"12、\cu 取消注释 
"命令 \cc 中的 \ 为<Leader>符，<Leader>符默认为 \ 


" DoxygenToolkit ---------------------
let g:DoxygenToolkit_briefTag_funcName = "yes"

"let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_briefTag_pre = "Synopsis: "            "简介
let g:DoxygenToolkit_templateParamTag_pre = "TTaram: "
let g:DoxygenToolkit_paramTag_pre = "Param: "                "参数
let g:DoxygenToolkit_returnTag = "Return: "                 "返回值
let g:DoxygenToolkit_throwTag_pre = "Throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = "File: "                     "文件名
let g:DoxygenToolkit_dateTag = "Date: "                     "日期
let g:DoxygenToolkit_authorTag = "Author: "                 "作者
let g:DoxygenToolkit_versionTag = "Version: "               "版本
let g:DoxygenToolkit_blockTag = "Name: "
let g:DoxygenToolkit_classTag = "Class: "
let g:DoxygenToolkit_authorName = "CaseZheng, 764307915@qq.com"
let g:doxygen_enhanced_color = 1
let g:load_doxygen_syntax = 1
"作者
nmap <Leader>dl :DoxAuthor<CR>
"函数/类注释
nmap <Leader>dd :Dox<CR>

" Tagbar ----------------------------- 
" toggle tagbar display 打开 Tag 列表
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
"let g:tagbar_autofocus = 1
let g:tagbar_width = 30


" NERDTree ----------------------------- 
" toggle nerdtree display  打开/关闭 NERDTree
map <F3> :NERDTreeToggle<CR>
map <F2> :NERDTree<CR>
" open nerdtree with the current file selected 打开 NERDTree 并选中当前文件
nmap ,t :NERDTreeFind<CR>
" don;t show these file types  过滤文件和文件夹的显示
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.git$', '\.svn$', 'cscope.file', 'cscope.out', 'tag']
" 设置宽度
let NERDTreeWinSize=25
" 排序
let NERDTreeCaseSensitiveSort=1
"let NERDTreeBookmarksFile=       "指定书签文件
let NERDTreeHighlightCursorline=1       "高亮显示光标所在行
"let NERDTreeMouseMode=2                 "指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
"let NERDTreeShowBookmarks=1             "当打开 NERDTree 窗口时，自动显示 Bookmarks
" 默认显示文件
let NERDTreeShowFiles=1
"let NERDTreeShowHidden=1                "默认显示隐藏文件
"let NERDTreeShowLineNumbers=1           "默认显示行号
"let NERDTreeWinPos='right'              "将 NERDTree 的窗口设置在 vim 窗口的右侧，默认在左
"let NERDChristmasTree=1                 "让树更好看

if(g:iswindows)
    "在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
    "autocmd VimEnter * NERDTree
endif

" Tasklist ------------------------------
" show pending tasks list
map <F11> :TaskList<CR>


" A ---------------------------------
map <F6> :A<CR>


" CtrlP ------------------------------
" file finder mapping
let g:ctrlp_map = ',p'
" hidden some types files
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif           "Linux
" tags (symbols) in current file finder mapping
nmap ,pg :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,pG :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,pf :CtrlPLine<CR>
" recent files finder mapping
nmap ,pm :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,pc :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wpg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wpG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wpf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,wpe :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,wpaf :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wpm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wpc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }


"" Syntastic ------------------------------
"" show list of errors and warnings on the current file
"nmap <leader>e :Errors<CR>
"" turn to next or previous errors, after open errors list
"nmap <leader>n :lnext<CR>
"nmap <leader>p :lprevious<CR>
"" check also when just opened the file
"let g:syntastic_check_on_open = 1
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
"let g:syntastic_javascript_checkers = ['jsl', 'jshint']
"let g:syntastic_html_checkers=['tidy', 'jshint']
"" to see error location list
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_loc_list_height = 5
"" 修改高亮的背景色, 适应主题
"highlight SyntasticErrorSign guifg=white guibg=black
"" don't put icons on the sign column (it hides the vcs status icons of signify)
"let g:syntastic_enable_signs = 0

"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"let g:syntastic_enable_balloons = 1 "whether to show balloons


" Python-mode ------------------------------
" don't use linter, we use syntastic for that
"let g:pymode_lint_on_write = 0
"let g:pymode_lint_signs = 0
" don't fold python code on open
"let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
"let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
"let g:pymode_rope_goto_definition_bind = ',d'
"let g:pymode_rope_goto_definition_cmd = 'e'
"nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
"nmap ,o :RopeFindOccurrences<CR>


"" NeoComplCache ------------------------------
"" most of them not documented because I'm not sure how they work
"" (docs aren't good, had to do a lot of trial and error to make 
"" it play nice)
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"" 在系统启动的时候启动neocomplcache
""let g:neocomplcache_enable_at_startup = 1
""let g:neocomplcache_enable_ignore_case = 1
"" Use smartcase.
""let g:neocomplcache_enable_smart_case = 1
"" 提示的时候默认选择地一个，如果你设置为0，每次输入都需要用上下键选择
"let g:neocomplcache_enable_auto_select = 1
"" 设置NeoComplCache不自动弹出补全列表
"let g:NeoComplCache_DisableAutoComplete = 1
""let g:neocomplcache_enable_fuzzy_completion = 1
""let g:neocomplcache_enable_camel_case_completion = 1
""let g:neocomplcache_enable_underbar_completion = 1
""let g:neocomplcache_fuzzy_completion_start_length = 1
""let g:neocomplcache_auto_completion_start_length = 1
""let g:neocomplcache_manual_completion_start_length = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_keyword_length = 3
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"" complete with workds from any opened file
"let g:neocomplcache_same_filetype_lists = {}
"let g:neocomplcache_same_filetype_lists._ = '_'
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"" Plugin key-mappings.
"" 取消补全
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"" 完成待补全项中共同的字符串
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"" <C-h>, <BS>: close popup and delete backword char.
"" 关闭待选项
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"" 关闭待选项
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"" 关闭待选项
"inoremap <expr><C-y>  neocomplcache#close_popup()
"" 退出待选项
"inoremap <expr><C-e>  neocomplcache#cancel_popup()


" TabMan ------------------------------
" mappings to toggle display, and to focus on it
" 开启/关闭 tab 管理
let g:tabman_toggle = 'tl'
" 将光标移动到tab管理窗口
let g:tabman_focus  = 'tf'

""""""""""""""""""""""""""""""""""""""""""""minibufexpl"""""""""""""""""""""""""""""""""""""""""""""
""多文档编辑  minibufexpl.vim
"let g:miniBufExplMapCTabSwitchBufs=1        "启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开
"let g:miniBufExplMapWindowsNavVim=1         "按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
"let g:miniBufExplMapWindowNavArrows=1       "按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
""let g:miniBufExplMapCTabSwitchWindows=1    "启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；
"let g:miniBufExplModSelTarget=1             "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
"let g:miniBufExplorerMoreThanOne=0			"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Signify ------------------------------
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git']

    let g:signify_difftool = 'gnudiff'
"let g:signify_vcs_cmds = {
"    \ }

" mappings to jump to changed blocks
 nmap <leader>sn <plug>(signify-next-hunk)
 nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


" Window Chooser ------------------------------
" mapping
nmap  (  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1
"Default keymapings in choosewin mode
" Key Action  Description
" 0   tab_first   Select FIRST tab
" [   tab_prev    Select PREVIOUS tab
" ]   tab_next    Select NEXT tab
" $   tab_last    Select LAST tab
" x   tab_close   Close current tab
" ;   win_land    Navigate to current window
" -   previous    Naviage to previous window
" s   swap        Swap windows #1
" S   swap_stay   Swap windows but stay #1
"     win_land    Navigate to current window
"                 Disable predefined keymaping

" Airline ------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
"let g:airline_theme = 'bubblegum'
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1

if(g:iswindows)
    " 设置consolas字体
    set guifont=Consolas\ for\ Powerline\ FixedD:h9
endif

"设置切换Buffer快捷键"
 nnoremap <C-tab> :bn<CR>
 nnoremap <C-s-tab> :bp<CR>

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '>'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" new file set title and turn to endline 自动插入头部
autocmd BufNewFile *.sh,*.py,*.rb exec ":call SetTitle()"
function SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 
    endif
endfunction
autocmd BufNewFile * normal G


"""""""""""""""""""""""""""""""""""""""""""""cscope""""""""""""""""""""""""""""""""""""""""""""""""
"cscope插件：查询符号的调用和定义位置等，已经集成到vim里面，这里只是映射快捷键"<C-_>g的按法是先按
"Ctrl+Shift+-","然后很快再按"g"查找本 C符号(可以跳过注释)
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"查找本定义
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"查找调用本函数的函数    
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"查找本字符串
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"查找本 egrep 模式
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"查找本文件
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"查找包含本文件的文件
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"查找本函数调用的函数
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"在Vim命令行下运行cw命令，就能在编辑区下面quickfix窗口看到所有查找结果的列表
"cn<cr> "切换到下一个结果
"cp<cr> "切换到上一个结果
"设定使用 quickfix 窗口来显示 cscope 的查询结果  
""set cscopequickfix=s-,c-,d-,i-,t-,e-   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""onmicppcompete"""""""""""""""""""""""""""""""""""""""""""""
" 命名空间查找控制。0 : 禁止查找命名空间 1 : 查找当前文件缓冲区内的命名空间(缺省) 
" 2 : 查找当前文件缓冲区和包含文件中的命名空间
let g:OmniCpp_NamespaceSearch = 1
" 全局查找控制。0:禁止；1:允许(缺省)
let g:OmniCpp_GlobalScopeSearch = 1
" 显示访问控制信息('+', '-', '#')。0/1, 缺省为1(显示)
let g:OmniCpp_ShowAccess = 1
" 类成员显示控制(公有(public)私有(private)保护(protected)成员)。 0 : 自动 1 : 显示所有成员
let g:OmniCpp_DisplayMode = 0
" 选项用来控制匹配项所在域的显示位置。缺省情况下，omni显示的补全提示菜单中总是将匹配项所在域信息显示在
" 缩略信息最后一列。 0 : 信息缩略中不显示匹配项所在域(缺省) 1 : 显示匹配项所在域，并移除缩略信息中最后一列
let OmniCpp_ShowScopeInAbbr = 0
" 显示补全提示缩略信息中显示函数原型。0 : 不显示(缺省) 1 : 显示原型
let g:OmniCpp_ShowPrototypeInAbbr = 0
" 在'.'号后自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let g:OmniCpp_MayCompleteDot = 0
" 在->后自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let g:OmniCpp_MayCompleteArrow = 0
" 在域标识符::后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为0
let g:OmniCpp_MayCompleteScope = 0
" 默认命名空间列表，项目间使用','隔开
let g:OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动选择第一个匹配项。仅当completeopt不为longest时有效。0 :不选择第一项(缺省) 1 : 选择第一项并插入到光标
" 位置 2 : 选择第一项但不插入光标位置
"let g:OmniCpp_SelectFirstItem = 0

"自动关闭补全窗口
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 

let $VIMPROJECT = $vimpath."vimfiles"
if(g:iswindows==1)
    :set tags+=$VIMPROJECT/vimlib/cppstl/tags,$VIMPROJECT/vimlib/linux/tags
else
    :set tags+=$VIMPROJECT/vimlib/cppstl/tags,$VIMPROJECT/vimlib/linux/tags.linux
endif

:set path+=$VIMPROJECT/vimlib/cppstl/cpp_src,$VIMPROJECT/vimlib/linux/include
:set path+=$VIMPROJECT/vimlib/linux/include/sys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Do_CsTag()
    let dir = getcwd()
    let g:tagsdeleted=0
    let g:csfilesdeleted=0
    let g:csoutdeleted=0
    echohl WarningMsg | echo dir | echohl None
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
        return
        endif
    endif
    
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(g:csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(g:csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
         silent! execute "!ctags -R --c++-kinds=+p --c-kinds=+p --fields=+iaS --extra=+q ."
"         silent! execute "!ctags -R --c++-kinds=+p --c-kinds=+p --fields=+iaS --extra=+q --langdef=MYLUA --langmap=MYLUA:.lua --regex-MYLUA="/^.*\s*function\s*(\w+):(\w+).*$/\2/f/" --regex-MYLUA="/^\s*(\w+)\s*=\s*[0-9]+.*$/\1/e/" --regex-MYLU A="/^.*\s*function\s*(\w+)\.(\w+).*$/\2/f/" --regex-MYLUA="/^.*\s*function\s*(\w+)\s*\(.*$/\1/f/" --regex-MYLUA="/^\s*(\w+)\s*=\s*\{.*$/\1/e/" --regex-MYLUA="/^\s*module\s+\"(\w+)\".*$/\1/m,module/" --regex-MYLUA="/^\s*module\s+\"[a-zA-Z0-9._]+\.(\w+)\".*$/\1/m,module/" --languages=MYLUA --excmd=number ."
    else
        echohl WarningMsg | echo "Fail ctags" | echohl None
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
              silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
          else
              silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    :redr!
endfunction

"更新TAG
map <F10> :call Do_CsTag()<CR><CR>

" project
" i 设置后，当选择打开一个文件时会在命令行显示文件名和当前工作路径。
" c 设置后，在项目窗口中打开文件后会自动关闭项目窗口。
" m 在常规模式下开启 |CTRL-W_o| 和 |CTRL-W_CTRL_O| 映射，使得当前缓冲区成为唯一可见的缓冲区，但是项目窗口仍然可见。
" s 设置后将在项目窗口中使用语法高亮。
" S 设置后将在更新和创建项目时启用排序。
" g 设置后会将切换打开和关闭项目窗口映射到 <F12> 上。
" t 设置后将在按空格 <space> 或鼠标右击 <RightMouse> 时候进行原窗口和加宽窗口之间的切换。
let g:proj_flags="icmStg"

filetype  on

if(executable('cscope') && has("cscope") )
    silent! execute "!cscope -b"
    if filereadable("cscope.out")
        execute "cs add cscope.out"
    endif
endif
:redr!
