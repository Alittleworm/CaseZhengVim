filetype off
set rtp+=$VIM/vimfiles/bundle/vundle
call vundle#begin('$VIM/vimfiles/bundle/')
Plugin 'gmarik/Vundle'
Plugin 'L9'

"添加PEP8代码风格检查
Plugin 'nvie/vim-flake8'
"多窗口插件
Bundle 'minibufexplorerpp'
"提供树型浏览文件系统的界面
Bundle 'The-NERD-tree'
"对cscope的支持  
Bundle  'cscope-quickfix'

"taglist是一个用于显示定位程序中各种符号的插件
Bundle 'taglist.vim'
"方便在Vim里面使用Git的插件
Bundle 'tpope/vim-fugitive'
"让cpp文件在.h和.cpp文件中切换
Bundle 'vim-scripts/a.vim'
"SuperTab使Tab快捷键具有更快捷的上下文提示功能。 也就是一种自动补全插件
"Bundle 'supertab'
"状态栏
Bundle 'Lokaltog/vim-powerline'
"onmicppcompete功能：
"命名空间(namespace),类(class),结构(struct)和联合(union)补全
"函数属性成员和返回值类型补全
"this"指针成员补全
""C/C++类型转换(cast)对象补全
"类型定义(typedef)和匿名类型(anonymous types)补全
Bundle 'omnicppcomplete'
"自动补全
"Bundle 'Valloric/YouCompleteMe'
Bundle 'grep.vim'

Bundle 'xolox/vim-lua-ftplugin'
Bundle 'xolox/vim-misc'
"安装syntastic插件，每次保存文件时Vim都会检查代码的语法
Plugin 'scrooloose/syntastic'
Bundle 'Valloric/ListToggle'
call vundle#end()
filetype plugin indent on

function Do_CsTag()
      let dir = getcwd()
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
          if(csfilesdeleted!=0)
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
          if(csoutdeleted!=0)
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
  endfunction



"""""""""""""""""""""""""""""""""""""""""""""""Tlist"""""""""""""""""""""""""""""""""""""""""""""""
"在taglist窗口中，可以使用下面的快捷键：
"<CR>          跳到光标下tag所定义的位置，用鼠标双击此tag功能也一样
"o             在一个新打开的窗口中显示光标下tag
"<Space>       显示光标下tag的原型定义
"u             更新taglist窗口中的tag
"s             更改排序方式，在按名字排序和按出现顺序排序间切换
"x             taglist窗口放大和缩小，方便查看较长的tag
"+             打开一个折叠，同zo
"-             将tag折叠起来，同zc
"*             打开所有的折叠，同zR
"=             将所有tag折叠起来，同zM
"[[            跳到前一个文件
"]]            跳到后一个文件
"q             关闭taglist窗口
"<F1>          显示帮助

"let Tlist_Ctags_Cmd=''				"设置ctags的位置
let Tlist_Show_One_File=1           "只显示一个文件中的tag，默认为显示多个
let Tlist_OnlyWindow=1              "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Use_Right_Window=0        "让taglist窗口出现在Vim的右边 0表示显示在左边
let Tlist_Sort_Type='name'          "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_Exit_OnlyWindow=1         "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Show_Menu=1				"在gvim中，如果你想显示taglist菜单
"使用Tlist_Max_Submenu_Items和Tlist_Max_Tag_Length来控制菜单条目数和所显示tag名字的长度
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=25
"缺省情况下，在双击一个tag时，才会跳到该tag定义的位置，如果你想单击tag就跳转，设置Tlist_Use_SingleClick为１
"let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0               "如果你想在启动VIM后，自动打开taglist窗口
let Tlist_Close_On_Select=0         "如果你希望在选择了tag后自动关闭taglist窗口，设置Tlist_Close_On_Select为1
let Tlist_File_Fold_Auto_Close=1    "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来
let Tlist_GainFocus_On_ToggleOpen=0 "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Process_File_Always=0     "如果希望taglist始终解析文件中的tag，不管taglist窗口有没有打开，设置Tlist_Process_File_Always为1
"Tlist_WinHeight和Tlist_WinWidth可以设置taglist窗口的高度和宽度。Tlist_Use_Horiz_Window为１设置taglist窗口横向显示
let Tlist_WinHeight=10
let Tlist_WinWidth=25
let Tlist_Use_Horiz_Window=0
nmap Tl :Tlist<CR>                  "使用Tl打开/关闭taglist窗口
"更新TAG
map <F12> :call Do_CsTag()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""onmicppcompete"""""""""""""""""""""""""""""""""""""""""""""
let g:OmniCpp_NamespaceSearch = 2		"命名空间查找控制。0 : 禁止查找命名空间 1 : 查找当前文件缓冲区内的命名空间(缺省) 2 : 查找当前文件缓冲区和包含文件中的命名空间
let g:OmniCpp_GlobalScopeSearch = 1		"全局查找控制。0:禁止；1:允许(缺省)
let g:OmniCpp_ShowAccess = 1			"显示访问控制信息('+', '-', '#')。0/1, 缺省为1(显示)
let g:OmniCpp_DisplayMode = 0			"类成员显示控制(公有(public)私有(private)保护(protected)成员)。 0 : 自动 1 : 显示所有成员
let OmniCpp_ShowScopeInAbbr = 0			"选项用来控制匹配项所在域的显示位置。缺省情况下，omni显示的补全提示菜单中总是将匹配项所在域信息显示在缩略信息最后一列。 0 : 信息缩略中不显示匹配项所在域(缺省) 1 : 显示匹配项所在域，并移除缩略信息中最后一列
let g:OmniCpp_ShowPrototypeInAbbr = 1	"显示补全提示缩略信息中显示函数原型。0 : 不显示(缺省) 1 : 显示原型
let g:OmniCpp_MayCompleteDot = 1		"在'.'号后自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let g:OmniCpp_MayCompleteArrow = 1		"在->后自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
let g:OmniCpp_MayCompleteScope = 1		"在域标识符::后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为0
let g:OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]	"默认命名空间列表，项目间使用','隔开
"let g:OmniCpp_SelectFirstItem = 0		"自动选择第一个匹配项。仅当completeopt不为longest时有效。0 : 不选择第一项(缺省) 1 : 选择第一项并插入到光标位置 2 : 选择第一项但不插入光标位置

if(g:iswindows==1)
	:set tags+=$VIMPROJECT/vimlib/cppstl/tags,$VIMPROJECT/vimlib/linux/tags
else
	:set tags+=$VIMPROJECT/vimlib/cppstl/tags,$VIMPROJECT/vimlib/linux/tags.linux
endif
:set path+=$VIMPROJECT/vimlib/cppstl/cpp_src,$VIMPROJECT/vimlib/linux/include,$VIMPROJECT/vimlib/linux/include/sys/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""NERTree""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * NERDTree             "在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
"按NT即可显示或隐藏NerdTree区域了。
nmap NT :NERDTreeMirror<CR>
nmap NT :NERDTreeToggle<CR>
let NERDChristmasTree=1                 "让树更好看
"let NERDTreeAutoCenter=1                "控制当光标移动超过一定距离时，自动将焦点调整到屏中心
let NERDTreeCaseSensitiveSort=1         "让文件排列更有序
let NERDTreeBookmarksFile=$VIM.'\vimproject\NerdBookmarks.txt'       "指定书签文件
let NERDTreeHighlightCursorline=1       "高亮显示光标所在行
let NERDTreeMouseMode=2                 "指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let NERDTreeShowBookmarks=1             "当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowFiles=1                 "默认显示文件
let NERDTreeShowHidden=1                "默认显示隐藏文件
let NERDTreeShowLineNumbers=1           "默认显示行号
let NERDTreeWinPos='right'              "将 NERDTree 的窗口设置在 vim 窗口的右侧，默认在左侧
let NERDTreeWinSize=25
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"""""""""""""""""""""""""""""""""""""""""""YouCompleteMe"""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"确保了在你完成操作之后，自动补全窗口不会消失
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_global_ycm_extra_conf='C:\MyProgramFiles\Vim\vimfiles\bundle\YouCompleteMe\third_party\ycmd\cpp\ycm\.ycm_extra_conf.py'							  "此处是全局配置文件路径  
"let g:ycm_confirm_extra_conf=0					"关闭每次导入配置文件前的询问  
"let g:syntastic_always_populate_loc_list=1		"方便使用syntastic进行语法检查  
"let g:ycm_seed_identifiers_with_syntax=1		"开启语法关键字补全 
"let g:ycm_collect_identifiers_from_tag_files=1  "让YouCompleteMe同时利用原来的ctags
"let g:ycm_error_symbol = '✗'
"let g:ycm_warning_symbol = '⚠'
"let g:ycm_min_num_of_chars_for_completion=2 	"设置n个字符开始自动补全
"let g:ycm_collect_identifiers_from_comments_and_strings=0	"注释和字符串中的文字也会被收入补全
"let g:ycm_cache_omnifunc=0									"禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1					"开启语义补全
"let g:ycm_complete_in_comments=1							"在注释输入中也能补全
"let g:ycm_complete_in_strings=1								"在字符串输入中也能补全
"let g:ycm_key_invoke_completion = '<tab>'					"直接触发自动补全
"设置在下面几种格式的文件上屏蔽ycm
"let g:ycm_filetype_blacklist = {
"\ 'tagbar' : 1,
"\ 'nerdtree' : 1,
"\}
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif		"离开插入模式后自动关闭预览窗口
"set completeopt=longest,menu								"让Vim的补全菜单行为与一般IDE一致
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"		"回车即选中当前项
"let mapleader =	','								"让<leader>为'.'
"nnoremap <silent><leader>yc :YcmCompleter GoToDeclaration<CR>				"声明
"nnoremap <silent><leader>yf :YcmCompleter GoToDefinition<CR>				"定义
"nnoremap <silent><leader>yg :YcmCompleter GoToDefinitionElseDeclaration<CR> "定义或声明
"nnoremap <silent><leader>yt :YcmCompleter GetType<CR>				"获取变量类型  
"nnoremap <silent><leader>yi :YcmCompleter GoToInclude<CR>			"跳转包含文件  
"nmap <F4> :YcmDiags<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""minibufexpl"""""""""""""""""""""""""""""""""""""""""""""
"多文档编辑  minibufexpl.vim
let g:miniBufExplMapCTabSwitchBufs=1        "启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开
let g:miniBufExplMapWindowsNavVim=1         "按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows=1       "按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
"let g:miniBufExplMapCTabSwitchWindows=1    "启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；
let g:miniBufExplModSelTarget=1             "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
let g:miniBufExplorerMoreThanOne=0			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""ListToggle""""""""""""""""""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 15
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""cscope""""""""""""""""""""""""""""""""""""""""""""""""
"cscope插件：查询符号的调用和定义位置等，已经集成到vim里面，这里只是映射快捷键"<C-_>g的按法是先按"Ctrl+Shift+-","然后很快再按"g"  
"查找本 C符号(可以跳过注释)
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
"set cscopequickfix=s-,c-,d-,i-,t-,e-   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""a""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :A<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
