## 安装

1. 复制  .vim/autoload 到你的 .vim，以安装 vim-plug 插件
2. 复制  .vimrc 到你的 ~
3. 在 vim 中执行 `:PlugInstall` 安装其他插件 

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

文档：
https://stackoverflow.com/questions/28184042/compiling-vim-with-xterm-clipboard-on-centos-6-6
https://blog.csdn.net/jxxiaohou/article/details/51586934
https://netsarang.atlassian.net/wiki/spaces/ENSUP/pages/31588500/Copying+from+Vim+to+Windows+Clipboard
https://www.cnblogs.com/bkylee/p/8403900.htmlclipboard
http://vim.wikia.com/wiki/Copy_and_paste_between_Vim_instances
https://advancedweb.hu/2018/06/12/vim-system-clipboard/
https://blog.csdn.net/sy373466062/article/details/49912877
