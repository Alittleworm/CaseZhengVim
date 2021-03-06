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

" 插件管理插件
Plugin 'gmarik/Vundle'

" ============================================================================
" vim 树形目录插件
Plugin 'scrooloose/nerdtree'

" c++高亮增强 C++11/14 STL
Plugin 'octol/vim-cpp-enhanced-highlight'

" 快速注释/解开注释
Plugin 'scrooloose/nerdcommenter'

" 注释快速生成
Plugin 'DoxygenToolkit.vim'

" Vim 标签侧边栏插件
Plugin 'majutsushi/tagbar'

" 模糊搜索, 可以搜索文件/buffer/mru/tag等等
Plugin 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'
" 快速批量搜索代码，搜索文件, 模糊匹配, 正则表达式 配合ctrlp使用的
Plugin 'rking/ag.vim'

" 处理 git merge 文件冲突
"Plugin 'tpope/vim-fugitive'

" 显示色彩对应的颜色
"Plugin 'lilydjwg/colorizer'

" 窗口管理器
Plugin 't9md/vim-choosewin'

" Airline 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if(g:iswindows)
    Plugin 'eugeii/consolas-powerline-vim'
endif

"让cpp文件在.h和.cpp文件中切换
Bundle 'vim-scripts/a.vim'

" python插件
Plugin 'klen/python-mode'

" 语法部分高亮插件
Plugin 'junegunn/limelight.vim'

"自动补全
"if(g:iswindows==1)
    Plugin 'Shougo/neocomplete.vim'
    "onmicppcompete功能：命名空间(namespace),类(class),结构(struct)和联合(union)补全 函数属性成员和返回值类型补全 this指针成员补全 C/C++类型转换(cast)对象补全 类型定义和匿名类型补全
    Bundle 'omnicppcomplete'
"endif
"if(g:iswindows==0)
"    Bundle 'Valloric/YouCompleteMe'
"endif

" snipMate 依赖组件
"Plugin 'MarcWeber/vim-addon-mw-utils'
" snipMate 依赖组件
"Plugin 'tomtom/tlib_vim'
" 使 Vim 具有 TextMate 风格的 snippets 功能
"Plugin 'garbas/vim-snipmate'
" 代码片段补全 
"Plugin 'honza/vim-snippets'

" 同时支持Git 和 Svn ，速度也是相当不错的，高亮当前修改.　比较全面的一个插件
Plugin 'mhinz/vim-signify'
"Plugin 'fisadev/vim-isort'


"if(g:iswindows)
"    "Python and other languages code checker 语法检测
"    Plugin 'scrooloose/syntastic'
"endif

" 代码对齐插件
"Plugin 'godlygeek/tabular'

" markdown语法高亮 不给力 屏蔽
"Plugin 'plasticboy/vim-markdown'

" 查找工具
"Plugin 'IndexedSearch'

" Lua代码高亮补全
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'

" Grep
"Plugin 'yegappan/grep'

" 代码垂直缩进对齐线插件
Plugin 'nathanaelkane/vim-indent-guides'

" HTML快速书写工具
Plugin 'mattn/emmet-vim'

" 配色方案
Plugin 'altercation/vim-colors-solarized'

" 显示终端的各种颜色对应的编号
"Plugin 'guns/xterm-color-table.vim'

" ============================================================================
" 在安装Vundle后只运行一次

if (iCanHazVundle==0)
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

"--------------------------------------vim-indent-guides--------------------
"" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=3
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle
if (&g:background == 'dark')
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=237 ctermbg=236 guifg=grey20 guibg=grey25
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=236 ctermbg=237 guifg=grey20 guibg=grey25
endif
"--------------------------------------vim-indent-guides--------------------

""""""""""""""""""""""""""""""""""""""""""""tab 管理"""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

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

"------------------------------------------- nerdcommenter ----------------------
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
"------------------------------------------- nerdcommenter ----------------------



"""""""""""""""""""""""""""""""""""""""" 注释 DoxygenToolkit""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""" Tagbar """"""""""""""""""""""""""" 
" toggle tagbar display 打开 Tag 列表
map <F4> :TagbarToggle<CR>
" tagbar自动打开
"let g:tagbar_autofocus = 1
let g:tagbar_width = 30
let g:tagbar_type_lua = {
    \ 'ctagstype' : 'MYLUA',
    \ 'kinds' : [
        \ 'f:Function',
        \ 'e:Item',
        \ 'v:Table',
        \ 'm:Moudle',
    \]
\}
"在tagbar中添加markdown支持
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""" NERDTree """"""""""""""""""""""""""""""""""""
" 打开/关闭 NERDTree
map <F3> :NERDTreeToggle<CR>
map <F2> :NERDTree<CR>
" 打开 NERDTree 并选中当前文件
nmap ,t :NERDTreeFind<CR>
" 过滤文件和文件夹的显示
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.git$', '\.svn$', 'cscope.file', 'cscope.out', 'tag$', '\.sln$', '\.vcxproj$', '\.filters$', '\.vcxproj\.user$', '\.exe$']
" 设置宽度
let NERDTreeWinSize=40
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
let NERDChristmasTree=1                 "让树更好看

if(g:iswindows)
    "在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
    "autocmd VimEnter * NERDTree
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""" A """""""""""""""""""""""
map <F6> :A<CR>
"""""""""""""""""""""""""""""""""""""""""""""""" A """""""""""""""""""""""


"-------------------------------------- CtrlP ------------------------------
" file finder mapping
let g:ctrlp_map = ',p'
" hidden some types files
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,*.tag,*.out,*.file         "Linux
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
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }
" linux下使用ag提高效率
if g:iswindows==0 && executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"---------------------------------------------------------------------------


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


"------------------------------------- pymode ------------------------------
" Python-mode
" Activate rope
" Keys: 按键：
" K             Show python docs 显示Python文档
" <Ctrl-Space>  Rope autocomplete  使用Rope进行自动补全
" <Ctrl-c>g     Rope goto definition  跳转到定义处
" <Ctrl-c>d     Rope show documentation  显示文档
" <Ctrl-c>f     Rope find occurrences  寻找该对象出现的地方
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled) 断点
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
"            跳转到前一个/后一个类或函数
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"              跳转到前一个/后一个类或方法
let g:pymode_rope = 0

" Documentation 显示文档
let g:pymode_doc = 1
let g:pymode_doc_key = '<leader>k'

" Linting 代码查错，=1为启用
let g:pymode_lint = 0
let g:pymode_lint_checker = 'pyflakes,pep8'
" Auto check on save
let g:pymode_lint_write = 1 " 0为关闭

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 0 " 0为关闭
"let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting 高亮形式
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code 禁用自动代码折叠
let g:pymode_folding = 0

let g:pymode_options_max_line_length = 200
"------------------------------------- pymode ------------------------------

"------------------------------------- limelight ------------------------------
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"------------------------------------- limelight ------------------------------

"------------------------------------ Signify ------------------------------
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
"------------------------------------ Signify ------------------------------


"----------------------------- Window Chooser ------------------------------
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
"----------------------------- Window Chooser ------------------------------

"------------------------------------ Airline ------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
"let g:airline_theme = 'bubblegum'
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers = 1

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#show_tab_nr = 1

" configure how numbers are displayed in tab mode.
"let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
"let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

" rename label for buffers (default: 'buffers') (c)
let g:airline#extensions#tabline#buffers_label = 'b'

" 这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let airline#extensions#tabline#middle_click_preserves_windows = 1
let airline#extensions#tabline#disable_refresh = 0

if(g:iswindows)
    " 设置consolas字体
    set guifont=Consolas\ for\ Powerline\ FixedD:h9
endif

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
"------------------------------------ Airline ------------------------------

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
"查找本函数调用的函数
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""onmicppcompete"""""""""""""""""""""""""""""""""""""""""""""
" 命名空间查找控制。0 : 禁止查找命名空间 1 : 查找当前文件缓冲区内的命名空间(缺省) 
" 2 : 查找当前文件缓冲区和包含文件中的命名空间
let g:OmniCpp_NamespaceSearch = 1
" 全局查找控制。0:禁止；1:允许(缺省)
let g:OmniCpp_GlobalScopeSearch = 0
" 显示访问控制信息('+', '-', '#')。0/1, 缺省为1(显示)
let g:OmniCpp_ShowAccess = 1
" 类成员显示控制(公有(public)私有(private)保护(protected)成员)。 0 : 自动 1 : 显示所有成员
let g:OmniCpp_DisplayMode = 0
" 选项用来控制匹配项所在域的显示位置。缺省情况下，omni显示的补全提示菜单中总是将匹配项所在域信息显示在
" 缩略信息最后一列。 0 : 信息缩略中不显示匹配项所在域(缺省) 1 : 显示匹配项所在域，并移除缩略信息中最后一列
let OmniCpp_ShowScopeInAbbr = 1
" 显示补全提示缩略信息中显示函数原型。0 : 不显示(缺省) 1 : 显示原型
let g:OmniCpp_ShowPrototypeInAbbr = 0
" 在'.'号后自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let g:OmniCpp_MayCompleteDot = 1
" 在->后自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let g:OmniCpp_MayCompleteArrow = 1
" 在域标识符::后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为0
let g:OmniCpp_MayCompleteScope = 1
" 默认命名空间列表，项目间使用','隔开
let g:OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动选择第一个匹配项。仅当completeopt不为longest时有效。0 :不选择第一项(缺省) 1 : 选择第一项并插入到光标
" 位置 2 : 选择第一项但不插入光标位置
let g:OmniCpp_SelectFirstItem = 2

"自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""neocomplete"""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" 确认补全
inoremap <expr><C-y>  neocomplete#close_popup()
" 取消补全
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""vim-lua-ftplugin""""""""""""""""""""""""""""""""""""""
" 自动语法检测 0表示关闭 运行:CheckSyntax手动进行语法检测
let g:lua_check_syntax=0
" 自动检查未定义的全局变量 0表示禁用 运行:CheckGlobals手动检测
let g:lua_check_globals=0
" 自动补全
let g:lua_complete_omni=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $VIMPROJECT = $vimpath
set tags=tags
if(g:iswindows==1)
    set tags+=~/.vim/vimlib/cppstl/tags
    set tags+=~/.vim/vimlib/linux/tags
"    set tags+=~/.vim/vimlib/boost/tags
else
    set tags+=~/.vim/vimlib/cppstl/tags
    set tags+=~/.vim/vimlib/linux/tags.linux
"    set tags+=~/.vim/vimlib/boost/tags
endif

set path+=~/.vim/vimlib/cppstl/cpp_src
set path+=~/.vim/vimlib/linux/include
"set path+=~/.vim/vimlib/boost/boost
set path+=~/.vim/vimlib/linux/include/sys
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
    else
        echohl WarningMsg | echo "Fail ctags" | echohl None
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
              silent! execute "!find . -name '*.h' -name '*.hpp' -o -name '*.c' -o -name '*.cpp' -o -name '*.lua' -o -name '*.cs' -name '*.py' > cscope.files"
          else
              silent! execute "!dir /s/b *.c,*.cpp,*.h,*.hpp,*.lua,*.cs,*.py >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    :redr!
endfunction

" 新建文件自动插入头部
"autocmd BufNewFile *.sh,*.py,*.rb,*.md exec ":call SetTitle()"
function SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 
    elseif &filetype == 'markdown'
        call setline(1,"---")
        call append(line("."), "title:        \"".expand("%:t")."\"")  
        call append(line(".")+1, "date:         ".strftime("%Y-%m-%d %H:%M"))  
        call append(line(".")+2, "categories:   ")  
        call append(line(".")+3, "tags:         ")  
        call append(line(".")+4, "excerpt:      ")  
        call append(line(".")+5, "author:       CaseZheng")  
        call append(line(".")+6, "layout:       post")  
        call append(line(".")+7, "mathjax:      true")  
        call append(line(".")+8, "---")  
        call append(line(".")+9, "") 
        call append(line(".")+10, "**版权声明：本文为[CaseZheng]的原创文章，转载请注明出处，否则禁止转载。**")  
        call append(line(".")+11, "") 
    endif
endfunction
map <F9> :call SetTitle()<CR><CR>

autocmd BufNewFile * normal G

"更新TAG
map <F10> :call Do_CsTag()<CR><CR>

"-------------------------------------- project ------------------------------
" i 设置后，当选择打开一个文件时会在命令行显示文件名和当前工作路径。
" c 设置后，在项目窗口中打开文件后会自动关闭项目窗口。
" m 在常规模式下开启 |CTRL-W_o| 和 |CTRL-W_CTRL_O| 映射，使得当前缓冲区成为唯一可见的缓冲区，但是项目窗口仍然可见。
" s 设置后将在项目窗口中使用语法高亮。
" S 设置后将在更新和创建项目时启用排序。
" g 设置后会将切换打开和关闭项目窗口映射到 <F12> 上。
" t 设置后将在按空格 <space> 或鼠标右击 <RightMouse> 时候进行原窗口和加宽窗口之间的切换。
let g:proj_flags="icmStg"
"-------------------------------------- project ------------------------------

"-------------------------------------- emmet ------------------------------
let g:user_emmet_settings = {
    \ 'php' : {
    \ 'extends' : 'html',
    \ 'filters' : 'c',
    \ },
    \ 'xml' : {
    \ 'extends' : 'html',
    \ },
    \ 'haml' : {
    \ 'extends' : 'html',
    \ },
    \}
let g:user_emmet_install_global = 0
autocmd FileType html,css,markdown EmmetInstall
"-------------------------------------- emmet ------------------------------


filetype  on

if(executable('cscope') && has("cscope") )
    silent! execute "cs kill -1"
    silent! execute "!cscope -b"
    if filereadable("cscope.out")
        execute "cs add cscope.out"
    endif
endif
:redr!
