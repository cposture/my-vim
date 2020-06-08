## 安装

1. 复制  .vim/autoload 到你的 .vim，以安装 vim-plug 插件
2. 复制  .vimrc 到你的 ~
3. 在 vim 中执行 `:PlugInstall` 安装其他插件 

## golang ide 使用
| 功能 | 快捷键|
|:-|:-|
| run | `:GoRun %`: go run 当前文件<br>`:GoRun`: 执行整个 package<br>`:GoRun` 快捷键: `space-r`|
| build | `:GoBuild`: go build 当前文件<br>`:GoBuild` 快捷键: `space-b`|
| build 错误跳转 | `space-]`: 下一个错误<br>`space-[`: 上一个错误<br>`space-[[`: 关闭错误框|
| Test | `:GoTest`: 执行当前 package 的测试<br>`:GoTestFunc`: 执行当前光标下的测试函数<br>`:GoTestCompile`: 编译测试文件<br>`:GoTest`快捷键: `space-b`| 
| Coverage | `:GoCoverage`: 执行测试，并且语法高亮测试覆盖率结果<br>`:GoCoverageClear`: 清除语法高亮<br>`:GoCoverageToggle`:`:GoCoverage` 和 `:GoCoverageClear` 的结合<br>`:GoCoverageToggle` 快捷键: `space-c` |
| Import | `:GoImport strings`: 导入 strings，支持 tab 补全<br>`:GoImportAs str strings`: 导入 strings 包，名字为 str<br>`:GoDrop strings`: 删除 strings 包<br>`:goimports`: 导入缺少的包 |
| Text objects | `if`: 函数内部代码块<br>`af`: 整个函数代码块<br>可以结合 `d`、`v`、`y` 一起使用, `dif` 用于删除函数内部代码|
| Struct split and join | `gS`: 把光标放在结构体表达式，自动将一行分解为多行<br>`gJ`: 多行合并为一行|
| Snippets | `<C-l>`: 在插入模式下输入关键词执行快捷键，实现代码生成<br>示例:<br>`fn -> fmt.Println()`<br>`ff -> fmt.Printf()`<br>`ln -> log.Println()`<br>`lf -> log.Printf()`<br>`ff` 和 `lf` 比较特殊, 会自动根据你后面输入内容补充到 format 里 <br> 更多用法: https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets|
| Check | `:GoLint`: 检查不规范的代码，比如变量名规范，变量声明，大小写问题，大写导出包要有注释等等<br>`:GoVet`: 代码静态检查工具，可以发现编译阶段和运行阶段 bug，比如 `fmt.Printf("%d\n", str)` 类似的 Print-format 错误，Boolean 错误（一直为true、false或者冗余的表达式）、Range 循环（range 块内的 go 协程读变量会产生值不变的问题）、Unreachable的代码等等<br>`:GoErrCheck`: 暂时没有介绍<br>`:GoMetaLinter`: 默认并发执行 `go vet`、`golint`、`errcheck`，`let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']` 设置|
|Alternate files| `:GoAlternate`: 在文件和测试文件之间快捷跳转|
| Go to definition  | `:GoDef`: 跳转到定义处<br>`:GoDef` 快捷键: `gd` 或 `C-]`<br>`C-o`: 跳回，如果跳转有有编辑或移动，则跳回到移动前位置<br>`:GoDefPop`: 跳回到上次 `:GoDef` 执行的地方<br>`:GoDefStack`: 展示 `:GoDef` 历史，方便跨级跳回<br>`GoDefStackClear`:清除 `:GoDef` 历史|
|Move between functions | `:GoDecls`: 在当前文件，列出所有类型和函数，并且支持匹配搜索跳转<br>`:GoDeclsDir`: 功能和 `:GoDecls` 一样，但搜索范围为当前目录<br> `]]`: 跳到下一个函数<br>`[[`: 跳到上一个函数<br>可以结合数字一起使用, `3]]`: 跳到当前文件的第三个函数<br>`d]]`: 删除到下个函数前<br>`v]]`: 可视化到下个函数前, 按 `]]` 继续扩大|
|Documentation lookup|`:GoDoc`: 展示光标下 identifier 对应文档<br>`:GoDoc` 快捷键: `K`| 
| Identifier resolution | `:GoInfo`: 查看变量类型,函数签名<br>`:GoInfo` 快捷键: `space-i`|
|Dependencies and files| `:GoFiles`: 查看当前包的所有源文件，不包括测试文件<br>`:GoDeps`: 展示文件依赖包|
|Guru| 代码导航工具<br>`使用说明`: https://docs.google.com/document/d/1_Y9xCEMj5S-7rv2ooHpZNH15JgRT5iM742gJkw5LtmQ/edit<br>`:GoReferrers`: 展示引用光标下 identifier 的代码<br>`:GoDescribe`: 高级版的 `:GoInfo`，展示类型的方法集合，结构体的字段集合<br>`:GoImplements`: 查看类型实现了哪些 interface<br>`:GoWhicherrs`: 光标下 error 变量，展示可能出现在 error 类型值的一组常量、全局变量和具体的类型，这些信息可以帮助处理错误，保证所有重要的错误 case 都被处理<br>`:GoChannelPeers`: 跟踪 channel 的发送、接收和定义的地方<br>`:GoCallees`: 光标下函数，展示可能的调用对象，比如光标下的函数是个接口方法，通过命令可以查询它可能会被绑定到哪些实现上<br>`:GoCallers`: 光标下函数，展示函数被哪些方法调用<br>`:GoCallstack`: 显示从调用图的根到包含选择的函数的任意路径。这对于了解如何在给定程序中实现该功能可能很有用|
| Rename identifiers | `:GoRename`: 更换光标下 identifier 名字，它会搜索 GOPATH 下所有依赖这个 identifier 的 identifiers|
| Extract function | `:GoFreevars`: 选择模式下，解析选择的代码下包含的使用但未声明的变量，便于重构代码段为函数|
|Method stubs implementing an interface | `:GoImpl io.ReadWriteCloser`: 光标下的类型 T，自动实现 `io.ReadWriteCloser` 的所有方法<br>`:GoImpl b *B fmt.Stringer`: 方法里的接收者变量名字为 b 类型为 *B，这种不用把光标放在类型上，可以在任意地方执行 |
|Share it|`:GoPlay`: 把当前文件分享到 https://play.golang.org/，并自动打开浏览器; 支持选择模式下选择特定代码 |
| Debug | `一般流程`: 启动调试程序，打断点，开始调试，执行下一步，查看信息，结束调试程序<br><br>`:GoDebugStart [pkg] [program-args]`: 启动调试程序，准备前期工作，如果 pkg 为空，则使用当前目录的包<br>`:GoDebugTest [pkg] [program-args]`: 和 `GoDebugStart` 一样，但是执行的是 `dlv test` 命令而不是 `dlv debug`，使用 `-test.flag` 给 `gp test` 传递 flag，比如 `-test.v` 或 `-test.run TestFoo`<br>`:GoDebugBreakpoint [linenr]`: 打断点，快捷键: `F9`<br>`:GoDebugContinue`: 开始/继续调试，快捷键: `F5`<br>`:GoDebugNext`: 相当于 step over，单步执行，在函数内遇到子函数时不会进入子函数内单步执行，而是将子函数整个执行完再停止，快捷键: `F10`<br>`GoDebugStep`: 单步执行，遇到子函数就进入并且继续单步执行，快捷键: `F11`<br>`:GoDebugStepOut`: 当单步执行到子函数内时，用step out就可以执行完子函数余下部分，并返回到上一层函数<br>`:GoDebugPrint {expr}`: 查看表达式结果，快捷键: `F6`<br>`:GoDebugStop`: 退出调试，恢复窗口<br>`:GoDebugRestart`: 停止调试，并且重启 dlv 重新编译包<br>`:GoDebugSet {var} {value}`: 设置变量值，只支持 `float`、`int` 变体、`uint` 变体、`bool`、pointer<br><br>`各个窗口说明`:<br>`GODEBUG_VARIABLES`: 展示所有本地变量，Struct 展示为 `{...}`, array/slices 展示为 `[4]`，使用 `<CR>` 展开值<br>`GODEBUG_OUTPUT`: 展示程序和 `dlv` 的输出<br>`GODEBUG_STACKTRACE`: 展示函数调用栈，方便跳转|

## 提示补全
* 插件：YCM +  + omni
### YCM-Generator
* 插件：YCM-Generator
* 操作：
1. `ctrl + I`，自动生成 .ycm_extra_conf.py 文件，YCM 依赖此文件进行提示和补全

### YCM
* 插件：YCM
* 操作：
1. `Ctrl + Space`，在任何地方触发完成建议，即使没有字符串前缀也是如此。这对于查看哪些顶级函数可供使用很有用。
2. `:YcmRestartServer`，重新启动
3. `:YcmDiags` 和 `:YcmDebugInfo`，查询信息
4. `:YcmCompleter` 命令，配合其他子选项完成功能，例如，`GoToDeclaration` 跳转到声明处，详细参考：https://github.com/Valloric/YouCompleteMe/tree/61a5a9b84b8c0c993d63c20c8698b42db4365f60#general-usage`

* 说明：
centos 系统比较老，使用 YCM 版本不是最新的，我这里为 https://github.com/Valloric/YouCompleteMe/tree/61a5a9b84b8c0c993d63c20c8698b42db4365f60，llvm 版本为 clang+llvm-3.3-amd64-Ubuntu-10.04.4.tar.gz

### omni
* 操作：
1. `tab`omni 补全，依赖在项目根目录执行 ctags -R

* 文档：
https://mounui.com/217.html

## 源文件头文件切换
* 操作：ctrl-R
* 插件：https://github.com/ericcurtin/CurtineIncSw.vim

## 跳转
* 执行前：
1. 在项目根目录执行 `ctags -R` 生成 tags 文件
2. 打开 vim 后，执行 `set tags=tags;`，我这里将它加在 vimrc 文件了
* 操作：
1. 跳进，ctrl+左键
2. 跳回，ctrl+o
* 插件：ctags

文档： 
https://stackoverflow.com/questions/1835242/how-can-i-map-a-click-in-vim
http://vim.wikia.com/wiki/Single_tags_file_for_a_source_tree
https://blog.csdn.net/gangyanliang/article/details/6889860
http://releases.llvm.org/3.7.0/tools/clang/docs/ClangFormatStyleOptions.html
* 标签跳转：
1. 插件：https://github.com/andymass/vim-matchup
2. 操作：`%`，跳转到下一个标签

## 搜索
* 插件：https://github.com/wsdjeg/FlyGrep.vim
* 操作：`Ctrl+F`，全项目搜索，<Esc> 退出，<Tab> 选择下一个，<S-Tab>选择上一个

## 文件模版
vim模板插件
https://segmentfault.com/a/1190000006036434
Vim为特定文件载入模板
https://blog.csdn.net/demorngel/article/details/72900921

## 窗口
### 类/方法/变量相关侧边栏
* 操作：
1. F9 打开
* 插件：
1. majutsushi/tagbar
* 文档：
http://www.wklken.me/posts/2015/06/07/vim-plugin-tagbar.html
### 状态栏
* 插件：
1. https://github.com/vim-airline/vim-airline
* 文档：
http://www.wklken.me/posts/2015/06/07/vim-plugin-tagbar.html
### 上方 Tab 栏
* 操作：
1. `ctrl+left`，打开文件列表右边文件
2. `ctrl+right`，打开文件列表左边文件
3. `ctrl+n`，打开下一个 tab
4. `ctrl+p`，打开上一个 tab

## 语言
### 语法高亮
开箱即用型的语法高亮包，支持大部分前端后台语言
插件：https://github.com/sheerun/vim-polyglot
### 缩进线
插件：https://github.com/Yggdroot/indentLine
操作：
1. `:IndentLinesToggle`，打开缩进线
### 语法检查
插件：https://github.com/vim-syntastic/syntastic
文档：http://www.wklken.me/posts/2015/06/07/vim-plugin-syntastic.html
### C/C++ 格式化
* 插件：https://github.com/rhysd/vim-clang-format
* 操作：
1. F4，在 normal 模式，格式化文件代码；在 visual 模式，格式化选中的代码
* 配置文件：~/.clang-format
* 文档：
https://github.com/rhysd/vim-clang-format/blob/master/doc/clang-format.txt
https://kxp555.coding.me/2017/12/12/vim%E4%BB%A3%E7%A0%81%E6%A0%BC%E5%BC%8F%E5%8C%96%E6%8F%92%E4%BB%B6clang-format/
https://blog.csdn.net/softimite_zifeng/article/details/78357898
#### 折叠
插件：https://github.com/tmhedberg/SimpylFold
操作：zc关闭折叠并zo打开折叠
#### 缩进
操作：`<<` 和 `>>`，==命令来缩进当前行，可视化模式选择多行，使用=命令缩进选中的行
文档：http://yyq123.blogspot.com/2010/10/vim-indent.html

## 复制粘贴
### vim 复制到 windows
* 说明：
1. 支持复制到系统剪贴板
2. 支持多个 vim 实例共享复制粘贴，解决 tmux 和多个打开 vim 之间复制无法共享问题 

* 安装 x11：`yum install libX11 libX11-devel libXtst-devel libXtst libXt-devel libXt libSM-devel libSM libXpm libXpm-devel`
* 下载 vim 8 源码，编译：
1. `./configure --prefix=/data/luffichen/bin/vim-8.1 --with-features=huge --with-luajit --enable-luainterp=yes --enable-fail-if-missing --enable-pythoninterp=yes --with-x=yes --enable-gui=auto`
2. 查看是否支持 X11：`grep X11 src/auto/config.h` 如果有 `#define HAVE_X11 1` `#define HAVE_X11_XPM_H 1` `#define HAVE_X11_SM_SMLIB_H 1` 即表示依赖成功
3. `make -j4 && make install`
4. `vim --version | grep clipboard` 查看是否支持
5. Run Xshell and connect to the server using the SSH protocol with X11 forwarding，具体的操作：文件-默认会话属性-隧道-X11转移，选择 X Display
6. 配置ssh，`vi /etc/ssh/sshd_config` 确认有配置 `X11Forwrding yes `，允许SSH的X转发
7. 安装VcXsrv X11 Server，https://sourceforge.net/projects/vcxsrv/files/vcxsrv/（xming 的剪切板功能貌似对中文支持不好，所以这里使用 VcXsrv）
8. 打开 XLaunch，选择 multiple windows，和 display number 为 0，start no client，勾选 clipbord
* 操作：
1. visual 模式，选择要复制的内容后执行 `+y`，即可

* 安装 python27-devel，搜索安装包 `yum search python | grep -i devel`，安装 `yum  install python-devel.x86_64`
* 安装 ncurses-dev 库，搜索安装包 `yum search ncurses | grep -i dev`，安装 `yum install ncurses-devel.x86_64`

* 操作：
1. 可视模式 Ctrl + C 选择复制到系统剪贴板
2. 可视模式 CTRL + X 剪切到系统剪贴板
3. 插入模式 CTRL + V 粘贴到系统剪贴板
4. 命令模式 CTRL + V 粘贴到系统剪贴板

## 安装 vim with python2/3

`./configure --prefix=/Users/admin/bin/vim-8.2/ --with-features=huge  --enable-fail-if-missing --enable-python3interp=yes --enable-pythoninterp=yes  --enable-gui=auto --with-python-config-dir=/usr/lib/python2.7/config/ --with-python3-config-dir=/usr/local/Cellar/python@3.8/3.8.2/Frameworks/Python.framework/Versions/3.8/lib/python3.8/config-3.8-darwin --with-python3-command=python3.8`

https://wincent.com/wiki/Building_Vim_from_source
https://www.yupengsir.com/topic/content?i=276

文档：
https://stackoverflow.com/questions/28184042/compiling-vim-with-xterm-clipboard-on-centos-6-6
https://blog.csdn.net/jxxiaohou/article/details/51586934
https://netsarang.atlassian.net/wiki/spaces/ENSUP/pages/31588500/Copying+from+Vim+to+Windows+Clipboard
https://www.cnblogs.com/bkylee/p/8403900.htmlclipboard
http://vim.wikia.com/wiki/Copy_and_paste_between_Vim_instances
https://advancedweb.hu/2018/06/12/vim-system-clipboard/
https://blog.csdn.net/sy373466062/article/details/49912877
