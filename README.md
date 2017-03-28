# CaseZhengVim

## project 的使用方法

- 启动 vim 后输入 :Project ，就会看到左边出现项目列表，如果还没有项目，列表为空。
- 在常规模式下输入 \C （斜杠+大写C）创建项目：
- Enter the Name of the Entry: ProjectName （项目名称）
- Enter the Absolute Directory to Load:  ProjectPath （项目路径）
- Enter the CD parameter: . （CD 指打开该项目（包括项目下的文件）后， vim 将进入的路径，“.” 指的是当前项目路径）
- Enter the File Filter:  (筛选源文件，只显示符合条件的)
  
## 插件 project 的默认项目文件就是 ~/.vimprojects
  
- 启动 project 插件后，相对应的就会支持一些命令。在常规模式下输入（注意区分大小写）：
   
- \r 根据项目过滤符更新折叠处的文件。
- \R 递归执行 \r 。
- \c 创建一个项目。但不包括指定目录下的子目录。
- \C 递归执行 \c，包括指定目录下的所有子目录。
- <Return> 打开文件；打开或关闭折叠。
- <S-Return> Shift+Return
- \s 同 <Return> 打开文件，打开文件时水平分割窗口。
- \S 加载所有文件到当前窗口，当前窗口会被水平分割显示所有文件。
- <C-Return> Ctrl+Return
- \o 打开指定文件到一个窗口中，并且关闭所有其它窗口，
- <M-Return> Alt+Return
- \v 仅仅打开文件，光标仍然保留在项目列表中。
- <CTRL-Up>
- \<Up> 移动文本或者折叠到当前光标的上一行。
- <CTRL-Down>
- \<Down> 移动文本或者折叠到当前光标的下一行。
- \i 在状态栏中显示光标所在折叠的完整参数以及继承参数。
- \I 在状态栏中显示文件的完整路径。
- \l 加载当前项目层的所有文件到到当前 vim 中。在加载的过程中，任何按键都导致停止。
- \L 加载当前项目以及子项目中的文件到当前 vim 中。谨慎使用。
- \g 在当前项目层执行 grep 。
- \G 在当前项目层及子项目执行 grep 。
- <F12> 当在变量 g:proj_flags 中使用了标志位 'g' 时, 该键用来切换打开和关闭项目窗口.
  
- 其它操作参见 project.txt 。

## 配置
- 在 ~/.vimrc 文件中添加：

- let g:proj_flags="icmsStg"

- i 设置后，当选择打开一个文件时会在命令行显示文件名和当前工作路径。
- c 设置后，在项目窗口中打开文件后会自动关闭项目窗口。
- m 在常规模式下开启 |CTRL-W_o| 和 |CTRL-W_CTRL_O| 映射，使得当前缓冲区成为唯一可见的缓冲区，但是项目窗口仍然可见。
- s 设置后将在项目窗口中使用语法高亮。
- S 设置后将在更新和创建项目时启用排序。
- g 设置后会将切换打开和关闭项目窗口映射到 <F12> 上。
- t 设置后将在按空格 <space> 或鼠标右击 <RightMouse> 时候进行原窗口和加宽窗口之间的切换。

- 其它标志详见 project.txt 。

